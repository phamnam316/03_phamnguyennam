DROP DATABASE IF EXISTS `Testing_System_Assignment_1`;
CREATE DATABASE `Testing_System_Assignment_1`;
USE `Testing_System_Assignment_1`;

DROP TABLE IF EXISTS `table_Department`;
CREATE TABLE `table_Department` (
    DepartmentID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentIDName VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS  `table_Position`;
CREATE TABLE `table_Position` (
    PositionID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName ENUM('Dev', 'Test', 'Scrum Master', 'PM')
);

DROP TABLE IF EXISTS  `table_Account`;
CREATE TABLE `table_Account` (
    AccountID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(50) NOT NULL,
    UserName NVARCHAR(50) NOT NULL,
    FullName NVARCHAR(50) NOT NULL,
    DepartmentID TINYINT NOT NULL,
    PositionID TINYINT NOT NULL,
    CreateDate DATE NOT NULL
);


DROP TABLE IF EXISTS  `table_Group`;
CREATE TABLE `table_Group` (
    GroupID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName VARCHAR(50) NOT NULL,
    CreatorID INT UNSIGNED NOT NULL,
    CreateDate DATE NOT NULL
);

DROP TABLE IF EXISTS  `table_GroupAccount`;
CREATE TABLE `table_GroupAccount` (
    GroupID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    AccountID INT NOT NULL,
    JoinDate DATE NOT NULL
);

DROP TABLE IF EXISTS  `table_TypeQuestion`;
CREATE TABLE `table_TypeQuestion` (
    TypeID INT,
    TypeName VARCHAR(50)
);

DROP TABLE IF EXISTS  `table_CategoryQuestion`;
CREATE TABLE `table_CategoryQuestion` (
    CategoryID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(30) NOT NULL
);

DROP TABLE IF EXISTS  `table_Question`;
CREATE TABLE `table_Question` (
    QuestionID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content VARCHAR(100) NOT NULL,
    CategoryID INT NOT NULL,
    TypeID INT NOT NULL,
    CreatorID INT NOT NULL,
    CreateDate DATE NOT NULL
);

DROP TABLE IF EXISTS  `table_Answer`;
CREATE TABLE `table_Answer` (
    AnswerID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content VARCHAR(100) NOT NULL,
    QuestionID INT NOT NULL,
    isCorrect ENUM('0', '1')
);

DROP TABLE IF EXISTS  `table_Exam`;
CREATE TABLE `table_Exam` (
    ExamID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ExamCode TINYINT NOT NULL,
    Title VARCHAR(100) NOT NULL,
    CategoryID INT NOT NULL,
    Duration TIME NOT NULL,
    CreatorID INT NOT NULL,
    CreateDate DATE NOT NULL
);  
 
DROP TABLE IF EXISTS  `table_ExamQuestion`;
CREATE TABLE `table_ExamQuestion` (
    ExamID INT NOT NULL,
    QuestionID TINYINT NOT NULL
);


-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
CREATE VIEW `view_SaleEmployees` AS
    SELECT 
        A.FullName, D.DepartmentIDName
    FROM
        `table_Account` A
            JOIN
        `table_Department` D ON A.DepartmentID = D.DepartmentID
    WHERE
        D.DepartmentIDName = 'sale'ion 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
CREATE VIEW `view_MostGroupMembers` AS
SELECT A.AccountID, A.FullName, COUNT(GA.GroupID) AS NumGroups
FROM `table_Account` A
JOIN `table_GroupAccount` GA ON A.AccountID = GA.AccountID
GROUP BY A.AccountID
ORDER BY NumGroups DESC
LIMIT 1;

-- Question 3: Tạo view có chứa câu hỏi có content quá dài và xóa nó đi

-- Tạo view
CREATE VIEW `view_LongQuestions` AS
SELECT * FROM `table_Question`
WHERE LENGTH(Content) > 300;

-- Xóa các câu hỏi quá dài
DELETE FROM `table_Question`
WHERE QuestionID IN (SELECT QuestionID FROM `view_LongQuestions`);

-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất

CREATE VIEW `view_DepartmentMostEmployees` AS
SELECT D.DepartmentIDName, COUNT(A.AccountID) AS NumEmployees
FROM `table_Account` A
JOIN `table_Department` D ON A.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentID
ORDER BY NumEmployees DESC;


-- Question 5: Tạo view có chứa tất cả các câu hỏi do user họ Nguyễn tạo

CREATE VIEW `view_QuestionsByNguyen` AS
SELECT Q.*
FROM `table_Question` Q
JOIN `table_Account` A ON Q.CreatorID = A.AccountID
WHERE A.FullName LIKE 'Nguyen%';






