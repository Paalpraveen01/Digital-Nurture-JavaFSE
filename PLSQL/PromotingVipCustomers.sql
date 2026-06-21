--scenario 2:
--Given all customers and set to IsVip is True for balance over 10000;

--Create table
CREATE TABLE Customers(
    CustomerID NUMBER PRIMARY KEY,
    CustomerName varchar2(50),
    Balance Number,
    IsVIP varchar2(5)
);
--Entering Sample data:

INSERT INTO Customers VALUES (1,'Praveen',15000,'FALSE');
INSERT INTO Customers VALUES (2,'Kanis',8000,'FALSE');
INSERT INTO Customers VALUES (3,'Dhanus',15000,'FALSE');
COMMIT;

SET SERVEROUTPUT ON;

DECLARE 
CURSOR cust_cursor is
    SELECT CustomerID,Balance FROM Customers;
BEGIN
    FOR cust_rec IN cust_cursor LOOP
        IF cust_rec.Balance>10000 THEN
        UPDATE Customers
        SET IsVIP = 'TRUE'
        WHERE CustomerID=cust_rec.CustomerID;

        DBMS_OUTPUT.PUT_LINE('Customers'|| cust_rec.CustomerID ||'Promoted to VIP');
        END IF;
    END LOOP;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('VIP Promotion Completed.');
END;
/

SELECT * FROM Customers;
