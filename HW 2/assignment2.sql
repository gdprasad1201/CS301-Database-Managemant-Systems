-- Assignment 2
-- 1. List all attributes of those employees whose address is Spring, TX
SELECT * FROM employee WHERE address LIKE '%Spring, TX%';

-- 2. List the ssn and salary of employees who work for Research department
SELECT ssn, salary FROM employee, department WHERE employee.dno = department.dnumber AND department.dname = 'Research';

-- 3. Find all project names for the projects John Smith works on
SELECT project.pname FROM employee, works_on, project WHERE employee.ssn = works_on.essn AND works_on.pno = project.pnumber AND employee.fname = 'John' AND employee.lname = 'Smith';

-- 4. Find all employees (including first name and last name) who do not work on Project #10
SELECT employee.fname, employee.lname FROM employee WHERE employee.ssn NOT IN (SELECT works_on.essn FROM works_on WHERE works_on.pno = 10);