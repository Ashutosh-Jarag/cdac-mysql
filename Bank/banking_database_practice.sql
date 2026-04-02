
-- Banking Database Practice Script

-- 1. Create Database
CREATE DATABASE IF NOT EXISTS BankingDB;
USE BankingDB;

-- 2. Branch Table
CREATE TABLE IF NOT EXISTS Branch (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(50),
    city VARCHAR(50)
);

-- 3. Customer Table
CREATE TABLE IF NOT EXISTS Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    phone VARCHAR(15),
    address VARCHAR(100),
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

-- 4. Account Table
CREATE TABLE IF NOT EXISTS Account (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(10,2),
    open_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- 5. Transactions Table
CREATE TABLE IF NOT EXISTS Transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(20),
    amount DECIMAL(10,2),
    transaction_date DATE,
    FOREIGN KEY (account_id) REFERENCES Account(account_id)
);

-- 6. Loan Table
CREATE TABLE IF NOT EXISTS Loan (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    loan_type VARCHAR(30),
    amount DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- Insert Branch Data
INSERT INTO Branch VALUES
(1,'Pune Main Branch','Pune'),
(2,'Mumbai Central','Mumbai'),
(3,'Delhi Branch','Delhi'),
(4,'Bangalore Branch','Bangalore');

-- Insert Customer Data
INSERT INTO Customer VALUES
(101,'Rahul Sharma','9876543210','Pune',1),
(102,'Sneha Patil','9876501234','Pune',1),
(103,'Amit Verma','9876512345','Mumbai',2),
(104,'Priya Singh','9876598765','Delhi',3),
(105,'Rohit Kulkarni','9876588888','Bangalore',4);

-- Insert Account Data
INSERT INTO Account VALUES
(1001,101,'Savings',50000,'2023-01-10'),
(1002,102,'Current',75000,'2023-02-15'),
(1003,103,'Savings',62000,'2023-03-20'),
(1004,104,'Savings',45000,'2023-04-12'),
(1005,105,'Current',90000,'2023-05-18');

-- Insert Transaction Data
INSERT INTO Transactions VALUES
(1,1001,'Deposit',10000,'2024-01-10'),
(2,1001,'Withdrawal',2000,'2024-01-15'),
(3,1002,'Deposit',5000,'2024-02-10'),
(4,1003,'Withdrawal',3000,'2024-03-12'),
(5,1004,'Deposit',8000,'2024-04-08'),
(6,1005,'Withdrawal',4000,'2024-05-20');

-- Insert Loan Data
INSERT INTO Loan VALUES
(501,101,'Home Loan',500000,'Approved'),
(502,102,'Car Loan',300000,'Pending'),
(503,103,'Education Loan',200000,'Approved'),
(504,104,'Personal Loan',150000,'Rejected'),
(505,105,'Business Loan',700000,'Approved');

-- Sample Practice Queries
-- 1. Show all customers
SELECT * FROM Customer;

-- 2. Customer account details
SELECT c.name, a.account_type, a.balance
FROM Customer c
JOIN Account a ON c.customer_id = a.customer_id;

-- 3. Accounts with balance > 60000
SELECT * FROM Account WHERE balance > 60000;

-- 4. Total bank balance
SELECT SUM(balance) AS total_balance FROM Account;

-- 5. Count accounts
SELECT COUNT(*) AS total_accounts FROM Account;
