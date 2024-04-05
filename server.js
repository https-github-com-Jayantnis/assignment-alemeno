// const connect = require("./connection");
const connect = require("./connection");
const express = require("express");
const bodyParser = require("body-parser");
const fs = require("fs");
var app = express();

const port = process.env.PORT || 3009;

app.use(bodyParser.json()); //sensitive
app.get("/customers", (req, res) => {
  const query = "SELECT * FROM customer_data";
  connect.query(query, (err, result) => {
    if (err) {
      console.error("Error executing SQL query:", err);
      return res.status(500).json({
        error: "An unexpected error occurred",
      });
    }
    res.status(200).json(result);
  });
});
app.get("/loans", (req, res) => {
  const query = "SELECT * FROM loans_data";
  connect.query(query, (err, result) => {
    if (err) {
      console.error("Error executing SQL query:", err);
      return res.status(500).json({
        error: "An unexpected error occurred",
      });
    }
    res.status(200).json(result);
  });
});

app.post("/register", (req, res) => {
  const { first_name, last_name, age, monthly_income, phone_number } = req.body;

  // Check if required fields are provided
  if (!first_name || !last_name || !age || !monthly_income || !phone_number) {
    return res.status(400).json({ error: "Missing required fields" });
  }

  // Parse monthly_income as a number
  const parsedMonthlyIncome = parseFloat(monthly_income);

  // Check if monthly_income is a valid number
  if (isNaN(parsedMonthlyIncome)) {
    return res.status(400).json({ error: "Invalid monthly income" });
  }

  // Calculate approved_limit
  const approved_limit =
    Math.round((36 * parsedMonthlyIncome) / 100000) * 100000;

  const query = `INSERT INTO customer_data (first_name, last_name, age, phone_number, monthly_salary, approved_limit) VALUES (?, ?, ?, ?, ?, ?)`;
  connect.query(
    query,
    [
      first_name,
      last_name,
      age,
      phone_number,
      parsedMonthlyIncome,
      approved_limit,
    ],
    (err, result) => {
      if (err) {
        console.error("Error executing SQL query:", err);
        return res.status(500).json({
          error: "An unexpected error occurred",
          sqlMessage: err.sqlMessage,
        });
      }
      res.status(201).json({
        customer_id: result.insertId,
        name: `${first_name} ${last_name}`,
        age,
        monthly_income: parsedMonthlyIncome,
        approved_limit,
        phone_number,
      });
    }
  );
});

app.post("/approve", (req, res) => {
  const { customer_id, current_debt } = req.body;

  // Check if required fields are provided
  if (!customer_id || !current_debt) {
    return res.status(400).json({ error: "Missing required fields" });
  }

  const query =
    "SELECT approved_limit FROM customer_data WHERE customer_id = ?";
  connect.query(query, [customer_id], (err, result) => {
    if (err) {
      console.error("Error executing SQL query:", err);
      return res.status(500).json({
        error: "An unexpected error occurred",
        sqlMessage: err.sqlMessage,
      });
    }

    const approved_limit = result[0].approved_limit;

    if (current_debt > approved_limit) {
      return res.status(400).json({ error: "Approved limit exceeded" });
    }

    res.status(200).json({ approved: true });
  });
});

function fetchLoanDataFromDatabase(callback) {
  const query = "SELECT * FROM loans_data";
  connect.query(query, (error, results) => {
    if (error) {
      console.error("Error fetching loan data from MySQL: " + error);
      callback(error, null);
      return;
    }
    callback(null, results);
  });
}

// Load loan data when the application starts
let loanData;

function loadLoanData() {
  fetchLoanDataFromDatabase((error, results) => {
    if (error) {
      console.error("Error loading loan data: " + error);
      return;
    }
    loanData = results;
    console.log("Loan data loaded successfully");
  });
}

loadLoanData();
// Load loan data from JSON file
// const loanData = JSON.parse(fs.readFileSync("loans_data.json", "utf8"));

// Helper function to calculate credit score
function calculateCreditScore(customer) {
  let score = 0;

  // Component i: Past Loans paid on time
  if (customer.past_loans_paid_on_time === "yes") {
    score += 30;
  }

  // Component ii: No of loans taken in past
  score += 20 * (customer.no_of_loans_taken_past / 5);

  // Component iii: Loan activity in current year
  if (customer.loan_activity_current_year === "high") {
    score += 20;
  }

  // Component iv: Loan approved volume
  score += 20 * (customer.loan_approved_volume / 1000000);

  // Component v: Check if sum of current loans is greater than approved limit
  if (customer.current_loans > customer.approved_limit) {
    score = 0;
  }

  return score;
}

// Helper function to approve loans based on credit score
function approveLoan(customer, creditScore) {
  let approval = false;
  let interestRate = 0;

  if (creditScore > 50) {
    approval = true;
    interestRate = 12;
  } else if (50 > creditScore > 30) {
    approval = true;
    interestRate = 16;
  } else if (30 > creditScore > 10) {
    approval = true;
    interestRate = 20;
  } else if (10 > creditScore) {
    approval = false;
    interestRate = 0;
  }

  return { approval, interestRate };
}

// Middleware to check if the sum of all current EMIs is greater than 50% of monthly salary
function checkEmiLimit(req, res, next) {
  const { monthly_salary, current_emis } = req.body;

  if (current_emis > 0.5 * monthly_salary) {
    return res.status(400).json({ message: "EMI limit exceeded" });
  }

  next();
}

// API endpoint to check loan eligibility
app.post("/check-eligibility", bodyParser.json(), checkEmiLimit, (req, res) => {
  const { customer_id, loan_amount, interest_rate, tenure, monthly_salary } =
    req.body;
  // Find the customer in the loan data
  // Find the customer in the loan data
  const customer = loanData.find((c) => c.customer_id === customer_id);

  if (!customer) {
    return res.status(404).json({ message: "Customer not found" });
  }

  // Calculate the credit score
  const creditScore = calculateCreditScore(customer);

  // Approve the loan
  const { approval, interestRate } = approveLoan(customer, creditScore);

  // Calculate the monthly installment
  const monthlyInstallment =
    (loan_amount * (1 + interest_rate / 100)) / (tenure * 12);

  // Send the response
  res.json({
    customer_id,
    approval,
    interest_rate: interestRate,
    tenure,
    monthlyInstallment,
    corrected_interest_rate: interestRate,
  });
});

// API endpoint to view loan details along with customer details
app.get("/view-loan/:loan_id", (req, res) => {
  const loanId = req.params.loan_id;

  // Query loan data and associated customer data from MySQL
  const query = `
      SELECT 
          loans_data.loan_id, 
          loans_data.customer_id, 
          loans_data.loan_amount, 
          loans_data.interest_rate, 
          loans_data.tenure, 
          customer_data.first_name,
          customer_data.last_name,
          customer_data.phone_number,
          customer_data.age
      FROM 
          loans_data
      INNER JOIN 
          customer_data
      ON 
          loans_data.customer_id = customer_data.customer_id
      WHERE 
          loans_data.loan_id = ?
  `;
  connect.query(query, [loanId], (err, results) => {
    if (err) {
      console.error("Error fetching loan details:", err);
      return res.status(500).json({
        error: "Internal server error",
      });
    }

    if (results.length === 0) {
      return res.status(404).json({
        error: "Loan not found",
      });
    }

    const loanDetails = results[0];

    // Construct the response object with required fields
    const response = {
      loan_id: loanDetails.loan_id,
      customer: {
        id: loanDetails.customer_id,
        first_name: loanDetails.first_name,
        last_name: loanDetails.last_name,
        phone_number: loanDetails.phone_number,
        age: loanDetails.age,
      },
      loan_amount: loanDetails.loan_amount,
      interest_rate: loanDetails.interest_rate,
      monthly_installment: loanDetails.monthly_installment,
      tenure: loanDetails.tenure,
      approved: loanDetails.approved,
    };

    res.json(response);
  });
});

// API endpoint to make a payment towards an EMI
app.post("/make-payment/:customer_id/:loan_id", (req, res) => {
  const customerId = req.params.customer_id;
  const loanId = req.params.loan_id;
  const { amount } = req.body;

  // Fetch loan details from MySQL
  const loanQuery = "SELECT * FROM loans_data WHERE loan_id = ?";
  connect.query(loanQuery, [loanId], (err, loanResults) => {
    if (err) {
      console.error("Error fetching loan details:", err);
      return res.status(500).json({
        error: "Internal server error",
      });
    }

    if (loanResults.length === 0) {
      return res.status(404).json({
        error: "Loan not found",
      });
    }

    const loan = loanResults[0];
    const remainingAmount = loan.monthly_installment - amount;

    // Recalculate EMI amount if the amount paid is less/more than the due installment amount
    if (remainingAmount > 0) {
      // Update loan data with remaining amount
      const updateQuery =
        "UPDATE loans_data SET monthly_installment = ? WHERE loan_id = ?";
      connection.query(updateQuery, [remainingAmount, loanId], (updateErr) => {
        if (updateErr) {
          console.error("Error updating loan details:", updateErr);
          return res.status(500).json({
            error: "Internal server error",
          });
        }

        res.json({ message: "Payment successful. EMI amount recalculated." });
      });
    } else if (remainingAmount === 0) {
      // If the remaining amount is zero, the installment is fully paid
      res.json({ message: "Payment successful. Installment fully paid." });
    } else {
      // If the remaining amount is negative, the user has overpaid
      res.json({
        message:
          "Payment successful. Installment fully paid. User has overpaid.",
      });
    }
  });
});

// API endpoint to view statement of a particular loan taken by the customer
app.get("/view-statement/:customer_id/:loan_id", (req, res) => {
  const customerId = req.params.customer_id;
  const loanId = req.params.loan_id;

  // Fetch loan details from MySQL
  const loanQuery =
    "SELECT * FROM loans_data WHERE customer_id = ? AND loan_id = ?";
  connect.query(loanQuery, [customerId, loanId], (err, loanResults) => {
    if (err) {
      console.error("Error fetching loan details:", err);
      return res.status(500).json({
        error: "Internal server error",
      });
    }

    if (loanResults.length === 0) {
      return res.status(404).json({
        error: "Loan not found for the specified customer",
      });
    }

    const loan = loanResults[0];

    // Construct response object with loan details
    const loanStatement = {
      customer_id: loan.customer_id,
      loan_id: loan.loan_id,
      principal: loan.loan_amount,
      interest_rate: loan.interest_rate,
      amount_paid: loan.loan_amount - loan.monthly_payment,
      monthly_installment: loan.monthly_payment,
      repayments_left: loan.tenure,
    };

    res.json(loanStatement);
  });
});
function checkEligibility(customer_id, loan_amount, interest_rate, tenure) {
  // Check if loan amount exceeds a certain limit
  if (loan_amount > 1000000) {
    return false; // Loan amount too high
  }

  // Check if interest rate exceeds a certain limit
  if (interest_rate > 20) {
    return false; // Interest rate too high
  }

  // Check if tenure is within an acceptable range
  if (tenure < 6 || tenure > 60) {
    return false; // Tenure not suitable
  }

  // Additional eligibility checks can be added here based on your requirements

  // If all checks pass, return true indicating eligibility
  return true;
}

// API endpoint to process a new loan based on eligibility
app.post("/create-loan", (req, res) => {
  const { customer_id, loan_amount, interest_rate, tenure } = req.body;

  // Perform eligibility check (you can implement this logic based on your requirements)
  // For example, check if the customer's credit score meets certain criteria
  const isEligible = checkEligibility(
    customer_id,
    loan_amount,
    interest_rate,
    tenure
  );

  if (!isEligible) {
    return res.json({
      loan_id: null,
      customer_id,
      loan_approved: false,
      message:
        "Loan not approved. Customer does not meet eligibility criteria.",
      monthly_installment: null,
    });
  }

  // If eligible, process the loan
  const monthlyInstallment = calculateMonthlyInstallment(
    loan_amount,
    interest_rate,
    tenure
  );

  // Save loan data to the database and get the loan ID (assuming you have a function to do this)
  const loanId = saveLoanDataToDatabase(
    customer_id,
    loan_amount,
    interest_rate,
    tenure
  );

  // Return the response
  res.json({
    loan_id: loanId,
    customer_id,
    loan_approved: true,
    message: "Loan approved. Congratulations!",
    monthly_installment: monthlyInstallment,
  });
});

// Function to calculate monthly installment based on loan amount, interest rate, and tenure
function calculateMonthlyInstallment(loan_amount, interest_rate, tenure) {
  // Convert interest rate from percentage to decimal
  const monthlyInterestRate = interest_rate / 100 / 12;

  // Calculate monthly installment using the formula for fixed-rate loans
  const numerator = loan_amount * monthlyInterestRate;
  const denominator = 1 - Math.pow(1 + monthlyInterestRate, -tenure);
  const monthlyInstallment = numerator / denominator;

  return monthlyInstallment;
}

// Function to save loan data to the database
function saveLoanDataToDatabase(
  customer_id,
  loan_amount,
  interest_rate,
  tenure
) {
  // Example code to save loan data to the database (you need to replace this with your actual database interaction code)

  // Assuming you have a MySQL connection already established
  const query =
    "INSERT INTO loans_data (customer_id, loan_amount, interest_rate, tenure) VALUES (?, ?, ?, ?)";
  const values = [customer_id, loan_amount, interest_rate, tenure];

  connect.query(query, values, (error, results) => {
    if (error) {
      console.error("Error saving loan data to database:", error);
      // Handle database error here (e.g., return an error response to the client)
      return null; // Indicate failure
    }

    // Return the newly inserted loan ID
    return results.insertId;
  });
}
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});

// @route GET api/customers
