DROP DATABASE IF EXISTS `Testing_System_Assignment_1`;
CREATE DATABASE `Testing_System_Assignment_1`;
USE `Testing_System_Assignment_1`;

DROP TABLE IF EXISTS `table_Department`;
CREATE TABLE `table_Department` (
    DepartmentID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
    DepartmentIDName VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS  `table_Position`;
CREATE TABLE `table_Position` (
    PositionID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName VARCHAR(20)
);

DROP TABLE IF EXISTS  `table_Account`;
CREATE TABLE `table_Account` (
    AccountID INT,
    Email VARCHAR(50),
    UserName VARCHAR(50),
    FullName VARCHAR(50),
    DepartmentID INT,
    PositionID INT,
    CreateDate DATE
);


DROP TABLE IF EXISTS  `table_Group`;
CREATE TABLE `table_Group` (
    GroupID INT,
    GroupName VARCHAR(50),
    CreatorID INT,
    CreateDate DATE
);

DROP TABLE IF EXISTS  `table_GroupAccount`;
CREATE TABLE `table_GroupAccount` (
    GroupID INT,
    AccountID INT,
    JoinDate DATE
);

DROP TABLE IF EXISTS  `table_TypeQuestion`;
CREATE TABLE `table_TypeQuestion` (
    TypeID INT,
    TypeName VARCHAR(50)
);

DROP TABLE IF EXISTS  `table_CategoryQuestion`;
CREATE TABLE `table_CategoryQuestion` (
    CategoryID INT,
    CategoryName VARCHAR(50)
);

DROP TABLE IF EXISTS  `table_Question`;
CREATE TABLE `table_Question` (
    QuestionID INT,
    Content VARCHAR(200),
    CategoryID INT,
    TypeID INT,
    CreatorID INT,
    CreateDate DATE
);

DROP TABLE IF EXISTS  `table_Answer`;
CREATE TABLE `table_Answer` (
    AnswerID INT,
    Content VARCHAR(200),
    QuestionID INT,
    isCorrect VARCHAR(50)
);

DROP TABLE IF EXISTS  `table_Exam`;
CREATE TABLE `table_Exam` (
    ExamID INT,
    Code INT,
    Title VARCHAR(100),
    CategoryID INT,
    Duration TIME,
    CreatorID INT,
    CreateDate DATE
);  
 
DROP TABLE IF EXISTS  `table_ExamQuestion`;
CREATE TABLE `table_ExamQuestion` (
    ExamID INT,
    QuestionID INT
);
