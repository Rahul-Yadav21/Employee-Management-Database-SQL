-- CREATE DATABASE
CREATE DATABASE Employee_Management_DB;
USE Employee_Management_DB;

-- 1.  CREATE DEPARTMENTS TABLE (INDEPENDENT)

CREATE TABLE Departments(
	Department_ID INT AUTO_INCREMENT,
    Department_Name VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Departments PRIMARY KEY(Department_ID)
    );
    
-- 2. CREATE EMPLOYEES TABLE (DEPENDS ON DEPARTMENTS TABLE)
CREATE TABLE Employees(
	Employee_ID INT AUTO_INCREMENT,
    First_Name VARCHAR(30) NOT NULL,
    Last_Name VARCHAR(30) NOT NULL,
    Age INT NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    Phone_Number VARCHAR(15) UNIQUE,
    Email VARCHAR(50) NOT NULL,
    Joining_Date DATE NOT NULL,
    Department_ID INT,
    CONSTRAINT PK_Employees PRIMARY KEY(Employee_ID),
    CONSTRAINT FK_Employees_Departments FOREIGN KEY (Department_ID) 
		REFERENCES Departments(Department_ID) ON DELETE SET NULL 
);

-- 3. CREATE SALARY TABLE (DEPENDS ON EMPLOYEES)
CREATE TABLE SALARY(
Salary_ID INT AUTO_INCREMENT,
Employee_ID INT NOT NULL,
Basic_Salary DECIMAL(10,2) NOT NULL,
Bonus DECIMAL(10,2) DEFAULT 0.00,
Total_Salary DECIMAL(10,2) AS (Basic_Salary + Bonus) STORED,
CONSTRAINT PK_SALARY PRIMARY KEY(Salary_ID),
CONSTRAINT FK_Salary_Employees FOREIGN KEY(Employee_ID) REFERENCES Employees(Employee_ID) ON DELETE CASCADE 
);

-- 4 CREATE ATTENDANCE TABLE (DEPENDS ON EMPLOYEES)
CREATE TABLE ATTENDANCE(
Attendance_ID INT AUTO_INCREMENT,
Employee_ID INT NOT NULL,
Attendance_Date DATE NOT NULL,
Status VARCHAR(20) DEFAULT 'ABSENT', -- PRESENT,ABSENT,LEAVE
CONSTRAINT PK_ATTENDANCE PRIMARY KEY(Attendance_ID),
CONSTRAINT FK_ATTENDANCE_EMPLOYEE FOREIGN KEY(Employee_ID) REFERENCES Employees(Employee_ID) ON DELETE CASCADE
);

-- 5 CREATE LEAVE_RECORDS TABLE (DEPENDS ON EMPLOYEES)
CREATE TABLE Leave_Records(
Leave_ID INT AUTO_INCREMENT,
Employee_ID INT NOT NULL,
Leave_Type VARCHAR(20) NOT NULL, -- CASUAL,SICK ,PAID
From_Date DATE NOT NULL,
To_Date DATE NOT NULL,
Approval_Status VARCHAR(30) DEFAULT 'PENDING', -- PENDING, APPROVED , REJECTED
CONSTRAINT PK_Leave_Records PRIMARY KEY(Leave_ID),
CONSTRAINT FK_Leave_Records_Employees FOREIGN KEY(Employee_ID) REFERENCES Employees(Employee_ID) ON DELETE CASCADE
);

-- 1. INSERT DATA INTO DEPARTMENTS TABLE 
INSERT INTO Departments (Department_Name) VALUES
('HR'),
('IT'),
('FINANCE'),
('MARKETING');

SELECT* FROM Departments;

-- 2. INSERT DATA INTO EMPLOYEES TABLE
INSERT INTO EMPLOYEES (FIRST_NAME, LAST_NAME, AGE, GENDER, PHONE_NUMBER, EMAIL, JOINING_DATE, DEPARTMENT_ID) VALUES
('RAHUL', 'YADAV', 23, 'MALE', '6541256478', 'rahulyadav12@gmail.com', '2025-02-02', 2),
('ATUL', 'KUMAR', 23, 'MALE','954632457', 'atulkumar123@gmail.com', '2025-03-04',1),
('HARSH', 'DUBEY', 25, 'MALE', '6484125478', 'harsh78@gmail.com', '2025-05-12',3),
('ABHAY', 'SHARMA', 26, 'MALE', '7459632145', 'abhaysharma6542@gmail.com', '2026-01-10',1),
('ANISHA', 'CHAUHAN', 29, 'FEMALE', '7896541254', 'anishachauhan63214@gmail.com', '2025-05-15',4);

-- 3. INSERT DATA INTO SALARY TABLE 
INSERT INTO Salary (EMPLOYEE_ID, BASIC_SALARY, BONUS)
VALUES
(1, 65000, 5000),
(2, 75000, 10000),
(3, 45000, 3000),
(4, 60000, 4000),
(5, 55000, 2500);

-- 4. INSERT DATA INTO ATTENDANCE TABLE (ATTENDANCE STATUS BY DEFAULT'ABSENT')
INSERT INTO ATTENDANCE (Employee_ID, Attendance_Date, Status) VALUES
(1, '2026-05-17', 'PRESENT'),
(2, '2026-05-17', 'PRESENT'),
(3, '2026-05-17', 'PRESENT'),
(4, '2026-05-17', 'ABSENT'),
(5, '2026-05-17', 'PRESENT');


-- 5. INSERT DATA INTO LEAVE_RECORDS TABLE
INSERT INTO Leave_Records (EMPLOYEE_ID, LEAVE_TYPE, FROM_DATE, TO_DATE)
VALUES
(2, 'CASUAL', '2026-01-10', '2026-01-14'),
(4, 'CASUAL', '2026-04-10', '2026-04-15'),
(3, 'SICK', '2026-03-10', '2026-04-20');


-- Report 1. FETCH EMPLOYEES WITH THEIR RESPECTIVE DEPARTMENT NAMES USING INNER JOIN
-------------------------------------------------------------------------------------
SELECT
	e.Employee_ID,
    CONCAT(e.First_Name, ' ', e.Last_Name) AS Full_Name,
    d.Department_Name
    FROM Employees e
    INNER JOIN Departments d
    ON e.Department_ID = d.Department_ID;
    
    
--  Report 2. FETCH TOTAL EMPLOYEES AND TOTAL SALARY INVESTMENT FOR EACH DEPARTMENT 
------------------------------------------------------------------------------------
 SELECT 
    d.Department_Name,
    COUNT(e.Employee_ID) AS Total_Staff,
    SUM(s.Total_Salary) AS Total_Salary_Spent
FROM Departments d
LEFT JOIN Employees e ON d.Department_ID = e.Department_ID
LEFT JOIN Salary s ON e.Employee_ID = s.Employee_ID
GROUP BY d.Department_Name;

    
-- REPORT 3: FETCH ALL EMPLOYEES WITH PENDING OR APPROVED LEAVE REQUESTS
---------------------------------------------------------------------------------
SELECT 
    e.Employee_ID,
    CONCAT(e.First_Name, ' ', e.Last_Name) AS Employee_Name,
    d.Department_Name,
    l.Leave_Type,
    l.From_Date,
    l.To_Date,
    e.Phone_Number,
    l.Approval_Status
FROM Employees e
INNER JOIN Leave_Records l ON e.Employee_ID = l.Employee_ID
INNER JOIN Departments d ON e.Department_ID = d.Department_ID
WHERE l.Approval_Status = 'PENDING' OR l.Approval_Status = 'APPROVED'
ORDER BY l.Approval_Status DESC;


-- 1. Query to view all records from the Employees table
SELECT * FROM Employees;

-- 2. Filter employees who are older than 24 years
SELECT First_Name, Last_Name, Age, Email 
FROM Employees 
WHERE Age > 24;

-- 3. Filter employees working in the IT Department (Department_ID = 2)
SELECT First_Name, Last_Name, Email 
FROM Employees 
WHERE Department_ID = 2;

-- 4. View Female Employees
SELECT *
FROM Employees
WHERE Gender = 'FEMALE';

SELECT * FROM Departments;
SELECT * FROM Employees;
    