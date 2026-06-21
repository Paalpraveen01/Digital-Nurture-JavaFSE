-- Scenario 3 
-- Sending Remainder for Loan Due within 30 Days:

--Create Table
CREATE TABLE Loans(
  LoanID NUMBER PRIMARY KEY,
  CustomerID NUMBER,
  DueDate Date
);
-- Assigning Values To Tables:
INSERT INTO Loans VALUES (101,1,SYSDATE+10);
INSERT INTO Loans VALUES (102,2,SYSDATE+40);
INSERT INTO Loans VALUES (103,3,SYSDATE+30);

COMMIT;

SET SERVEROUTPUT ON;

DECLARE
  CURSOR loan_cursor IS 
  SELECT LoanID,CustomerID,DueDate FROM Loans
  WHERE DueDate BETWEEN SYSDATE AND SYSDATE+30;
  
BEGIN
    FOR loan_rec IN loan_cursor LOOP
    DBMS_OUTPUT.PUT_LINE('Reminder: LoanID '|| loan_rec.LoanID || ' for CustomerID' ||
    loan_rec.CustomerID || ' Loan is Due on' || TO_CHAR(loan_rec.DueDate,' DD-MON-YYYY'));
    END LOOP;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Updated Message Sucessfully.');
  END;
  /
  --Selecting From Tables
SELECT * FROM Loans;