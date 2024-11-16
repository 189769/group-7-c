CREATE TABLE Clients (
    ClientID INT  PRIMARY KEY,
    Name VARCHAR(100),
    DateOfBirth DATE,
    Gender CHAR(1),
    PhoneNumber VARCHAR(15),
    Address TEXT,
    IDNumber VARCHAR(20) UNIQUE
);
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    LoanAmount DECIMAL(10, 2),
    InterestRate DECIMAL(5, 2),
    LoanIssueDate DATE,
    LoanDueDate DATE,
    ClientID INT,
    LoanStatus varchar(20),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);
CREATE TABLE Repayments (
    RepaymentID INT PRIMARY KEY,
    RepaymentDate DATE,
    RepaymentAmount DECIMAL(10, 2),
    LoanID INT,
    ClientID INT,
    FOREIGN KEY (LoanID) REFERENCES Loans(LoanID),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);
-- Inserting data into Repayments table
INSERT INTO Repayments (RepaymentID, RepaymentDate, RepaymentAmount, LoanID, ClientID)
VALUES
    (1, '2024-11-15', 10000.00, 10, 1),
    (2, '2024-11-20', 12000.00, 11, 1),
    (3, '2024-08-10', 25000.00, 12, 2),
    (4, '2024-07-25', 20000.00, 13, 3);

CREATE TABLE Savings (
    SavingsID INT PRIMARY KEY,
    ClientID INT,
    DepositAmount DECIMAL(10, 2),
    DepositDate DATE,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);
-- Inserting data into Savings table
INSERT INTO Savings (SavingsID, ClientID, DepositAmount, DepositDate)
VALUES
    (1, 1, 20000.00, '2024-06-15'),
    (2, 2, 50000.00, '2024-09-10'),
    (3, 3, 15000.00, '2024-04-20'),
    (4, 4, 30000.00, '2024-10-05');


CREATE TABLE LoanEligibility (
    EligibilityID INT PRIMARY KEY,
    ClientID INT,
    LoanLimit DECIMAL(10, 2),
    Income DECIMAL(10, 2),
    CreditHistory TEXT,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);
-- Inserting data into LoanEligibility table
INSERT INTO LoanEligibility (EligibilityID, ClientID, LoanLimit, Income, CreditHistory)
VALUES
    (1, 1, 200000.00, 150000.00, 'Good Credit History'),
    (2, 2, 180000.00, 120000.00, 'Good Credit History'),
    (3, 3, 150000.00, 100000.00, 'Average Credit History'),
    (4, 4, 220000.00, 170000.00, 'Excellent Credit History');

---Create a New Client
INSERT INTO Clients (ClientID,Name, DateOfBirth, Gender, PhoneNumber, Address, IDNumber) 
VALUES (1,'John Doe', '1985-05-15', 'M', '0700123456', '1234 Nairobi St.', 'A1234567');
-- Inserting data into Clients table
INSERT INTO Clients (ClientID, Name, DateOfBirth, Gender, PhoneNumber, Address, IDNumber)
VALUES
    (2, 'Jane Smith', '1990-07-22', 'F', '0722334455', '56 Mombasa Rd.', 'B2345678'),
    (3, 'Samuel Kim', '1982-12-10', 'M', '0733445566', '12 Kisumu Rd.', 'C3456789'),
    (4, 'Alice Wambui', '1988-03-05', 'F', '0744556677', '89 Eldoret St.', 'D4567890');

select * from Clients;

--Insert a Loan
INSERT INTO Loans (LoanID,LoanAmount, InterestRate, LoanIssueDate, LoanDueDate, ClientID, LoanStatus) 
VALUES (10,50000.00, 12.5, '2024-11-01', '2025-11-01', 1, 'Active');
INSERT INTO Loans (LoanID,LoanAmount, InterestRate, LoanIssueDate, LoanDueDate, ClientID, LoanStatus)
VALUES (11,65000.00, 9.5, '2024-08-27', '2025-08-27', 1, 'pending');
-- Inserting data into Loans table
INSERT INTO Loans (LoanID, LoanAmount, InterestRate, LoanIssueDate, LoanDueDate, ClientID, LoanStatus)
VALUES
    (12, 100000.00, 15.0, '2024-05-15', '2025-05-15', 2, 'Active'),
    (13, 75000.00, 10.0, '2024-07-10', '2025-07-10', 3, 'Active');


select * from Loans;
select * from Repayments;
select * from LoanEligibility;
select * from savings;


--Update Loan Status
UPDATE Loans SET LoanStatus = 'Paid' WHERE LoanID = 10;

--Delete a Loan
DELETE FROM Loans WHERE LoanID = 10;







