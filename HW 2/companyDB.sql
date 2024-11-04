CREATE TABLE employee (
    fname VARCHAR(10),
    minit CHAR,
    lname VARCHAR(10),
    ssn INT,
    bdate CHAR(10),
    address VARCHAR(25),
    sex CHAR,
    salary FLOAT,
    superssn INT,
    dno INT
);

CREATE TABLE department (
    dname VARCHAR(15),
    dnumber INT,
    mgrssn INT,
    mrgstartdate CHAR(10)
);

CREATE TABLE dept_locations (
    dnumber INT,
    dlocation VARCHAR(10)
);

CREATE TABLE works_on (
    essn INT,
    pno INT,
    hours FLOAT
);

CREATE TABLE project (
    pname VARCHAR(16),
    pnumber INT,
    plocation VARCHAR(10),
    dnum INT
);

CREATE TABLE dependent (
    essn INT,
    dependent_name VARCHAR(10),
    sex CHAR,
    bdate CHAR(10),
    relationship VARCHAR(10)
);