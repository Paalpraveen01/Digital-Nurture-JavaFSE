
--Scenario 2:
-- Update Employee Salary only in Employees Table

CREATE TABLE Employees(
  EmployeeID NUMBER PRIMARY KEY,
  EmployeeName VARCHAR2(50),
  Department varchar2(30),
  Salary NUMBER
 );
-- Inserting Table Values
 INSERT INTO Employees VALUES (101,'Praveen','IT',20000);
 INSERT INTO Employees VALUES (102,'Kanishka','IT',30000);
 INSERT INTO Employees VALUES (103,'Santa','HR',70000);
 COMMIT;

 SET SERVEROUTPUT ON;
-- Stored Procedure:
 CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
  p_department IN VARCHAR2,
  p_bonus_percent IN NUMBER
 )
IS 
BEGIN 
  UPDATE Employees
  SET Salary=Salary+(Salary * p_bonus_percent/100)
  WHERE Department=p_department;
  
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Salary Updated for departments: '|| p_department);

EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error: '||SQLERRM);
END UpdateEmployeeBonus;
/

--Excute Procedure:
BEGIN
  UpdateEmployeeBonus('IT', 10);
END;
/
--Selecting Updated Bonus:
SELECT * FROM Employees
