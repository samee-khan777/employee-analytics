 use employeeanalytics;
 select * from employee;

-- 1. highest salary of employee

SELECT * FROM employee
WHERE Salary = (SELECT MAX(Salary) FROM employee);

-- 2. lowest salary of employee

SELECT * FROM employee
WHERE Salary = (SELECT MIN(Salary) FROM employee);

-- 3. second highest salary of employee

SELECT * FROM employee
WHERE Salary = (
    SELECT MAX(Salary)
    FROM employee
    WHERE Salary < (SELECT MAX(Salary) FROM employee)
);

-- 4. department wise avg salary

SELECT Department, AVG(Salary) AS Avg_Salary
FROM employee
GROUP BY Department;

-- 5. gender wise employee count

SELECT Gender, COUNT(*) AS Total_Employee
FROM employee
GROUP BY Gender;

-- 6. employee with experiance with more than 10 years

SELECT Name, Job_Title, Experience_years
FROM employee
WHERE Experience_years > 10;

-- 7. employee earning less than 50000

SELECT Name, Department, Salary
FROM employee
WHERE Salary < 50000;

-- 8. location wise salary

SELECT Location, AVG(Salary) AS Avg_Salary
FROM employee
GROUP BY Location;

-- 9. intern employee list

SELECT * FROM employee
WHERE Job_Title = 'Intern';

-- 10. experience vs salary

SELECT Experience_years, AVG(Salary) AS Avg_Salary
FROM employee
GROUP BY Experience_years
ORDER BY Experience_years;

-- 11. education wise avg salary

SELECT Education_level, AVG(Salary) AS Avg_Salary
FROM employee
GROUP BY Education_level;

-- 12. job title wise employee count

SELECT Job_Title, COUNT(*) AS Total
FROM employee
GROUP BY Job_Title;

-- 13. city wise employee distribution

SELECT Location, COUNT(*) AS Total_Employee
FROM employee
GROUP BY Location
ORDER BY Total_Employee DESC;

-- 14. employee close to retirement

SELECT Name, Age, Job_Title
FROM employee
WHERE Age > 55;

-- 15. salary band classifications (case)

SELECT Name, Salary,
CASE
    WHEN Salary < 50000 THEN 'Low'
    WHEN Salary BETWEEN 50000 AND 100000 THEN 'Medium'
    ELSE 'High'
END AS Salary_Band
FROM employee;

-- 16. experience but underpaid employee

SELECT Name, Experience_years, Salary
FROM employee
WHERE Experience_years > 10 AND Salary < 60000;

-- create view

-- CREATE VIEW Dept_Salary_Report AS
-- SELECT Department, AVG(Salary) AS Avg_Salary
-- FROM employee
-- GROUP BY Department;

-- stored procedure

-- DELIMITER //
-- CREATE PROCEDURE HighSalaryEmployees(IN amount INT)
-- BEGIN
--     SELECT Name, Salary
--     FROM employee
--     WHERE Salary > amount;
-- END //
-- DELIMITER ;

-- CALL HighSalaryEmployees(100000);


















