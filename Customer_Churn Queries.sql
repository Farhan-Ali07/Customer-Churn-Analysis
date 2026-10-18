CREATE DATABASE Customer_churn;
USE Customer_churn;

CREATE TABLE customers (
    customer_id VARCHAR(20),
    age INT,
    gender VARCHAR(20),
    senior_citizen INT,
    partner VARCHAR(10),
    dependents VARCHAR(10),
    tenure_months INT,
    phone_service VARCHAR(20),
    multiple_lines VARCHAR(30),
    internet_service VARCHAR(30),
    online_security VARCHAR(30),
    online_backup VARCHAR(30),
    device_protection VARCHAR(30),
    tech_support VARCHAR(30),
    streaming_tv VARCHAR(30),
    streaming_movies VARCHAR(30),
    contract VARCHAR(30),
    payment_method VARCHAR(50),
    monthly_charges DECIMAL(10,2),
    total_charges DECIMAL(10,2),
    churn VARCHAR(10),
    churn_flag INT,
    tenure_group VARCHAR(20)
);
DROP TABLE customers;

CREATE TABLE customer_churn_data (
    customer_id VARCHAR(20),
    age INT,
    senior_citizen VARCHAR(10),
    partner VARCHAR(10),
    dependents VARCHAR(10),
    tenure_months INT,
    phone_service VARCHAR(20),
    multiple_lines VARCHAR(30),
    internet_service VARCHAR(30),
    contract VARCHAR(30),
    paperless_billing VARCHAR(10),
    payment_method VARCHAR(50),
    monthly_charges DECIMAL(10,2),
    total_charges DECIMAL(10,2),
    city VARCHAR(50),
    churn VARCHAR(10),
    Churn_Flag INT,
    Tenure_Group VARCHAR(30),
    Monthly_Charges_Group VARCHAR(30)
);
SELECT * FROM customer_churn_data;

SELECT
    COUNT(*) AS total_customers,
    SUM(Churn_Flag) AS churned_customers,
    ROUND(SUM(Churn_Flag) * 100.0 / COUNT(*), 2) AS churn_rate_percentage
FROM customer_churn_data;

SELECT contract, COUNT(*) AS Total_customers,
SUM(Churn_Flag) , ROUND(SUM(Churn_Flag) * 100.0 / COUNT(*),2) AS Churn_Rate
FROM customer_churn_data
GROUP BY contract 
ORDER BY Churn_Rate DESC;

SELECT payment_method, COUNT(*) AS Total_customers,
SUM(Churn_Flag) , ROUND(SUM(Churn_Flag) * 100.0 / COUNT(*),2) AS Churn_Rate
FROM customer_churn_data
GROUP BY payment_method
ORDER BY Churn_Rate DESC;


SELECT Tenure_group, COUNT(*) AS Total_customers,
SUM(Churn_Flag) , ROUND(SUM(Churn_Flag) * 100.0 / COUNT(*),2) AS Churn_Rate
FROM customer_churn_data
GROUP BY Tenure_group
ORDER BY Churn_Rate DESC;


SELECT Monthly_charges_group, COUNT(*) AS Total_customers,
SUM(Churn_Flag) , ROUND(SUM(Churn_Flag) * 100.0 / COUNT(*),2) AS Churn_Rate
FROM customer_churn_data
GROUP BY Monthly_charges_group
ORDER BY Churn_Rate DESC;

SELECT
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 55 THEN '46-55'
        WHEN age BETWEEN 56 AND 65 THEN '56-65'
        ELSE '66+'
    END AS Age_Group,
    COUNT(*) AS total_customers,
    SUM(Churn_Flag) AS churned_customers,
    ROUND(SUM(Churn_Flag) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customer_churn_data
GROUP BY Age_Group
ORDER BY churn_rate DESC;


SELECT Internet_service, COUNT(*) AS Total_customers,
SUM(Churn_Flag) , ROUND(SUM(Churn_Flag) * 100.0 / COUNT(*),2) AS Churn_Rate
FROM customer_churn_data
GROUP BY Internet_service
ORDER BY Churn_Rate DESC;

SELECT contract , Tenure_Group , COUNT(*) AS Total_customers,
SUM(Churn_Flag) , ROUND(SUM(Churn_Flag) * 100.0 / COUNT(*),2) AS Churn_Rate
FROM customer_churn_data
GROUP BY  contract , Tenure_Group 
ORDER BY Churn_Rate DESC;

SELECT Internet_Service , Tenure_Group , COUNT(*) AS Total_customers,
SUM(Churn_Flag) , ROUND(SUM(Churn_Flag) * 100.0 / COUNT(*),2) AS Churn_Rate
FROM customer_churn_data
GROUP BY  Internet_Service , Tenure_Group 
ORDER BY Churn_Rate DESC;
