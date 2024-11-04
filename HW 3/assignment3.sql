-- 1.	For each project in ‘Houston’, find the project number, the project name, and its controlling department name.
SELECT pnumber, pname, dname
FROM project
JOIN department ON project.dnum = department.dnumber
WHERE plocation = 'Houston';

-- 2.	For each employee working for the ‘Research’ department, find fname, lname, and the salary, and order the result by the salary in descending order. 
SELECT fname, lname, salary
FROM employee
JOIN department ON employee.dno = department.dnumber
WHERE dname = 'Research'
ORDER BY salary DESC;

-- 3.	Get all pairs of SSNs such that the employee with the first SSN has a higher salary than the employee with the second SSN. 
SELECT e1.ssn, e2.ssn
FROM employee e1, employee e2
WHERE e1.salary > e2.salary;

-- 4.	For each supervisor, list the SSN and the number of employees she or he supervises. 
SELECT superssn, COUNT(*) AS Number_of_Employees
FROM employee WHERE superssn IS NOT NULL
GROUP BY superssn;

-- 5.	List fname, lname, and the salary for the employees with salaries > average salary for their department.
SELECT fname, lname, salary
FROM employee
WHERE salary > (SELECT AVG(salary) FROM employee e2 WHERE employee.dno = e2.dno);

-- 6.	For each department with its average employee salary > $32,000, retrieve the department name and the number of employees working for that department.
SELECT dname, COUNT(*)
FROM employee
JOIN department ON employee.dno = department.dnumber
GROUP BY dname
HAVING AVG(salary) > 32000;

-- 7.	Find the department name and its average salary for each department if its average salary > the average salary of all employees.
SELECT dname, AVG(salary)
FROM employee
JOIN department ON employee.dno = department.dnumber
GROUP BY dname
HAVING AVG(salary) > (SELECT AVG(salary) FROM employee);

-- 8.	Get the project numbers and names that has been worked on by all the employees in the department of ‘Administration’.
SELECT pnumber, pname
FROM project p
WHERE NOT EXISTS (
    SELECT ssn
    FROM employee e
    WHERE dno = (SELECT dnumber FROM department WHERE dname = 'Administration')
    AND NOT EXISTS (
        SELECT *
        FROM works_on w
        WHERE w.essn = e.ssn
        AND w.pno = p.pnumber
    )
);

-- 9.	Convert the following nested query into a join query (a query that uses SELECT only once).
-- Select Ssn, Fname, Lname
-- From Employee
-- Where Ssn IN (Select Essn From Works_On Where Pno IN (Select Pnumber From Project Where Pname like 'Product%'));

SELECT DISTINCT e.ssn, e.fname, e.lname
FROM employee e
JOIN works_on w ON e.ssn = w.essn
JOIN project p ON w.pno = p.pnumber
WHERE p.pname LIKE 'Product%';

-- 10.	A view is created as shown below.
-- CREATE VIEW WORKS_ON2 AS
-- SELECT Fname as First, Lname as Last, Pname, Hours
-- FROM EMPLOYEE, PROJECT, WORKS_ON
-- WHERE Ssn = Essn AND Pno = Pnumber;

-- Convert the following query on the view into a query on the base tables. (You are allowed to use SELECT only once.)
SELECT First, Last FROM WORKS_ON2 WHERE Pname='Computerization' AND Hours>10;

SELECT e.fname as First, e.lname as Last
FROM employee e
JOIN works_on w ON e.ssn = w.essn
JOIN project p ON w.pno = p.pnumber
WHERE p.pname = 'Computerization' AND w.hours > 10;
