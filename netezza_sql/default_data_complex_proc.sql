CREATE OR REPLACE PROCEDURE ExampleProcedure(
in_empid INTEGER,
in_empfname VARCHAR(50),
in_emplname VARCHAR(50),
in_department VARCHAR(50),
in_project VARCHAR(50),
in_address VARCHAR(100),
in_dob DATETIME,
in_gender VARCHAR(20) DEFAULT 'M',
in_empposition VARCHAR(50),
in_dateofjoining DATE,
in_salary INTEGER DEFAULT 5000
)
BEGIN
DECLARE nand_result INTEGER;
DECLARE dob_day INTEGER;
DECLARE joined_date DATE;

-- Calculate the intNand of the salary
SET nand_result = int2and(in_salary,in_empid);

-- Check if address is NULL and replace with a default value
SET in_dob = COALESCE(in_dob, CURRENT_TIMESTAMP);

-- Extract the day of the year from the Date of Birth
SET dob_day = EXTRACT(DOY FROM in_dob);

-- Add 3 months to the Date of Joining
SET joined_date = ADD_MONTHS(in_dateofjoining, 3);

-- Insert into EmployeeInfo table with NVL function
INSERT INTO EmployeeInfo (EmpID, EmpFname, EmpLname, Department, Project, Address, DOB, Gender)
VALUES (in_empid, in_empfname, in_emplname, in_department, in_project, NVL(in_address, 'No Address'), in_dob, in_gender);

-- Insert into EmployeePosition table
INSERT INTO EmployeePosition (EmpID, EmpPosition, DateOfJoining, Salary)
VALUES (in_empid, in_empposition, in_dateofjoining, in_salary);
SELECT NOW() as current_timestamp;

COMMIT;
END;