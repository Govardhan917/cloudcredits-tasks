CREATE DATABASE customer_churn;
USE customer_churn;

select * from customer;

##Basic Data Check Queries
SELECT * FROM customer LIMIT 10;

SELECT COUNT(*) FROM customer;

DESCRIBE customer;

##🔹 Handling Missing / Invalid Data
SELECT * FROM customer WHERE TotalCharges IS NULL OR TotalCharges = '';

DELETE FROM customer WHERE customerID IS NULL;

##🔹 Overall Churn Count
SELECT Churn, COUNT(*) AS total_customers
FROM customer
GROUP BY Churn;

##🔹 Churn Percentage
SELECT 
    Churn,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customer), 2) AS churn_percentage
FROM customer
GROUP BY Churn;

##🔹 Churn by Contract Type
SELECT Contract, Churn, COUNT(*) AS total
FROM customer
GROUP BY Contract, Churn;

##🔹 Churn by Internet Service
SELECT InternetService, Churn, COUNT(*) AS total
FROM customer
GROUP BY InternetService, Churn;

##🔹 Revenue Analysis (Churn vs Non-Churn)
SELECT 
    Churn,
    ROUND(SUM(TotalCharges), 2) AS total_revenue
FROM customer
GROUP BY Churn;

##🔹 High-Risk Customers

##(Low tenure + High Monthly Charges)

SELECT customerID, tenure, MonthlyCharges, Churn
FROM customer
WHERE tenure < 6
  AND MonthlyCharges > 70;

##🔹 Senior Citizen Churn Analysis
SELECT SeniorCitizen, Churn, COUNT(*) AS total
FROM customer
GROUP BY SeniorCitizen, Churn;

##🔹 Churn by Payment Method
SELECT PaymentMethod, Churn, COUNT(*) AS total
FROM customer
GROUP BY PaymentMethod, Churn;

##🔹 Churn by Paperless Billing
SELECT PaperlessBilling, Churn, COUNT(*) AS total
FROM customer
GROUP BY PaperlessBilling, Churn;

##🔹 Top Customers by Monthly Charges
SELECT customerID, MonthlyCharges
FROM customer
ORDER BY MonthlyCharges DESC
LIMIT 10;