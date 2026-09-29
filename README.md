# Employee-Management-Database-SQL
A MySQL database project for managing employee information, departments, salaries, attendance, and leave records using relational database concepts and SQL queries.

## Project Overview
This project is an Employee Management Database developed using MySQL.The main objective of this project is to design a relational database for managing employee-related information and perform SQL queries to retrieve, filter, and analyze employee data.The database manages employees, departments, salaries, attendance, and leave records and demonstrates how these tables can be connected using primary and foreign keys.

## Tools & Technologies
MySQL Workbench
SQL
Relational Database Concepts

## Project Workflow
## 1. Database & Table Creation

Created an Employee Management Database with five related tables:

Departments – Stores department information
Employees – Stores employee details
Salary – Stores salary and bonus information
Attendance – Stores employee attendance records
Leave_Records – Stores employee leave requests

## 2. Database Relationships

Primary keys and foreign keys were used to establish relationships between the tables.

Key concepts implemented:

Primary Keys
Foreign Keys
AUTO_INCREMENT
NOT NULL
UNIQUE
ON DELETE CASCADE
ON DELETE SET NULL
Generated columns

## 3. Data Insertion

Sample employee management data was inserted into the database, including:

Department information
Employee details
Salary and bonus
Attendance status
Leave requests and approval status 

## 4. SQL Queries & Reports

SQL queries were created to perform different types of analysis:

Fetch employees with their department names
Calculate total employees by department
Calculate total salary expenditure by department
Find employees with pending or approved leave requests
Filter employees based on age
Find employees working in the IT department
Filter employees by gender
Retrieve records from individual tables

##Key SQL Concepts Used

CREATE DATABASE
CREATE TABLE
INSERT INTO
SELECT
WHERE
INNER JOIN
LEFT JOIN
GROUP BY
ORDER BY
COUNT()
SUM()
CONCAT()
Primary Key & Foreign Key Constraints

## Key Analysis

The database queries provide insights such as:

Employee distribution across departments
Total salary investment by department
Employee leave information
Employee details based on different conditions
Department-wise employee and salary information

## Conclusion
This project demonstrates the practical implementation of relational database design and SQL querying using MySQL. It covers database creation, table relationships, data management, constraints, joins, filtering, and aggregation to manage and analyze employee-related data.
