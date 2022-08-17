-- UNO
SELECT * FROM Jobs
WHERE Min_salary > '10000';

-- DOS
SELECT 
    First_name,
    Hire_date
FROM employees
WHERE Hire_date BETWEEN TO_DATE ('1/1/2002', 'dd/mm/yyyy') AND
    TO_DATE ('31/12/2005', 'dd/mm/yyyy');
    
-- TRES
SELECT
    First_name, 
    Hire_date,
    Job_id
FROM employees
WHERE Job_id IN('IT_PROG', 'SA_MAN');

-- CUATRO
SELECT *
FROM employees
WHERE Hire_date >= '1/1/08';

-- CINCO
SELECT *
FROM employees
WHERE employee_id IN(150,160);

-- SEIS
