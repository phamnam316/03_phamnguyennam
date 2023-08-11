DROP DATABASE IF EXISTS `Extra4`;
CREATE DATABASE `Extra4`;
USE `Extra4`;

-- Question 1:
CREATE TABLE `table_Department` (
    Department_Number INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Department_Name VARCHAR(50) NOT NULL
);

CREATE TABLE `Employee_Table` (
    Employee_Number INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Employee_Name VARCHAR(50) NOT NULL,
    Department_Number INT UNSIGNED,
    FOREIGN KEY (Department_Number)
        REFERENCES `table_Department` (Department_Number)
);

CREATE TABLE `Employee_Skill_Table` (
    Employee_Number INT UNSIGNED,
    Skill_Code VARCHAR(50) NOT NULL,
    DATE_Registered DATE NOT NULL,
    FOREIGN KEY (Employee_Number)
        REFERENCES `Employee_Table` (Employee_Number)
);


-- Question 2:
INSERT INTO `table_Department` (Department_Name)
VALUES ('HR'),
       ('Finance'),
       ('IT'),
       ('Marketing'),
       ('Sales'),
       ('Operations'),
       ('Research'),
       ('Production'),
       ('Customer Service'),
       ('Admin');


INSERT INTO `Employee_Table` (Employee_Name, Department_Number)
VALUES ('John Doe', 1),
       ('Jane Smith', 2),
       ('Michael Johnson', 3),
       ('Emily Brown', 1),
       ('David Wilson', 4),
       ('Sarah Davis', 5),
       ('Christopher Martinez', 3),
       ('Linda Taylor', 6),
       ('Daniel Anderson', 7),
       ('Olivia Thomas', 8);


INSERT INTO `Employee_Skill_Table` (Employee_Number, Skill_Code, DATE_Registered)
VALUES (1, 'Java', '2023-01-15'),
       (1, 'Python', '2023-02-20'),
       (2, 'C', '2023-03-10'),
       (3, 'Java', '2023-04-05'),
       (3, 'C', '2023-05-12'),
       (4, 'C', '2023-06-25'),
       (5, 'Java', '2023-07-18'),
       (6, 'Python', '2023-08-05'),
       (7, 'C', '2023-09-09'),
       (8, 'Python', '2023-10-22');

UPDATE `Employee_Table` 
SET 
    Department_Number = 1
WHERE
    Employee_Number = 7;


-- Question 3:
SELECT 
    t2.Employee_Name, t3.Skill_Code
FROM
    `Employee_Table` AS t2
        JOIN
    `Employee_Skill_Table` AS t3 ON t2.Employee_Number = t3.Employee_Number
WHERE
    Skill_Code = 'Java';

-- Question 4:
SELECT 
    t1.Department_Number, t1.Department_Name
FROM
    table_Department t1
        JOIN
    Employee_Table t2 ON t1.Department_Number = t2.Department_Number
GROUP BY t1.Department_Number , t1.Department_Name
HAVING COUNT(t2.Employee_Number) > 3;

-- Question 5:
SELECT 
    t1.Department_Number,
    t1.Department_Name,
    t2.Employee_Number,
    t2.Employee_Name
FROM
    table_Department t1
        LEFT JOIN
    Employee_Table t2 ON t1.Department_Number = t2.Department_Number;

-- Question 6:
SELECT DISTINCT
    t3.Employee_Number, t2.Employee_Name
FROM
    Employee_Skill_Table t3
        JOIN
    Employee_Table t2 ON t3.Employee_Number = t2.Employee_Number
GROUP BY t3.Employee_Number , t2.Employee_Name
HAVING COUNT(DISTINCT t3.Skill_Code) > 1;

