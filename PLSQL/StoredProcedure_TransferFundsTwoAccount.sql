--Scenario 3:
-- TransferFunds from one account to Another account seeing Their Balance
CREATE TABLE Accounts(
  AccountID NUMBER PRIMARY KEY,
  CustomerName VARCHAR2(50),
  Balance NUMBER
);

INSERT INTO Accounts VALUES (101,'Praveen',10000);
INSERT INTO Accounts VALUES (102,'Kanishka',5000);

COMMIT;

SET SERVEROUTPUT ON;
--Stored Procedure
CREATE OR REPLACE PROCEDURE TransferFunds(
  p_source_account IN NUMBER,
  p_destination_account IN NUMBER,
  P_amount IN NUMBER
)
IS 
  v_balance NUMBER;
BEGIN
    SELECT Balance 
    INTO v_balance 
    FROM Accounts
    WHERE AccountID=p_source_account;
-- Check if have Suffient Amount To Transfer:
    IF v_balance >= p_amount THEN
      
      UPDATE Accounts
      SET Balance=Balance - p_amount
      WHERE AccountID=p_source_account;

      UPDATE Accounts
      SET Balance=Balance + p_amount
      WHERE AccountID=p_destination_account;
      COMMIT;

      DBMS_OUTPUT.PUT_LINE('Fund successfully Transfered.');
      -- Then Print Insufficient amount:
    ELSE
       DBMS_OUTPUT.PUT_LINE('Insufficient balance');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error: '||SQLERRM);
END TransferFunds;
/
--Execute Procedure:
BEGIN
  TransferFunds(101,102,3000);
End;
/

--Selecting Updated Changes
SELECT * FROM Accounts;
