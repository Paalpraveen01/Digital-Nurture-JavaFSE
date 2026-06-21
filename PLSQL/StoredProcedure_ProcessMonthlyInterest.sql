
--Excersice 1
--stored procedure ProcessMonthlyInterest and updates the balance 
  savings account an interest rate of 1% current balance.

CREATE TABLE SavingsAccounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    Balance NUMBER
);

INSERT INTO SavingsAccounts VALUES (101, 1, 10000);
INSERT INTO SavingsAccounts VALUES (102, 2, 20000);
INSERT INTO SavingsAccounts VALUES (103, 3, 15000);

COMMIT;

SET SERVEROUTPUT ON; --show the Output

--Stored Procedure
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
IS
BEGIN
    UPDATE SavingsAccounts
    SET Balance = Balance + (Balance * 0.01);
    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Monthly interest applied successfully.');

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END ProcessMonthlyInterest;
/

-- Execute Procedure
BEGIN
    ProcessMonthlyInterest;
END;
/

-- Display Final Updated Table
SELECT * FROM SavingsAccounts;