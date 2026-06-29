-- Scenario 1:
-- Apply a 1% discount to loan interest rates
-- for customers above 60 years old.

-- Create Customers table
CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Age NUMBER
);

-- Create Loans table
CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    InterestRate NUMBER
);

-- Insert sample data
INSERT INTO Customers VALUES (1, 65);
INSERT INTO Customers VALUES (2, 45);
INSERT INTO Customers VALUES (3, 70);

INSERT INTO Loans VALUES (101, 1, 10);
INSERT INTO Loans VALUES (102, 2, 12);
INSERT INTO Loans VALUES (103, 3, 8);

COMMIT;

-- Enable output
SET SERVEROUTPUT ON;

-- PL/SQL Block
DECLARE
    CURSOR cust_cursor IS
        SELECT CustomerID, Age
        FROM Customers;
BEGIN
    FOR cust_rec IN cust_cursor LOOP

        IF cust_rec.Age > 60 THEN
            UPDATE Loans
            SET InterestRate = InterestRate - 1
            WHERE CustomerID = cust_rec.CustomerID;

            DBMS_OUTPUT.PUT_LINE('Discount applied for Customer ID: '||
             cust_rec.CustomerID );
        END IF;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Process completed successfully.');
END;
/

-- Display updated loan details
SELECT * FROM Loans;