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
    PositionName ENUM("Dev", "Test", "Scrum Master", "PM")
);

DROP TABLE IF EXISTS  `table_Account`;
CREATE TABLE `table_Account` (
    AccountID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(50) NOT NULL,
    UserName NVARCHAR(50) NOT NULL,
    FullName NVARCHAR(50) NOT NULL,
    DepartmentID TINYINT  NOT NULL,
    PositionID TINYINT NOT NULL,
    CreateDate DATE NOT NULL
);


DROP TABLE IF EXISTS  `table_Group`;
CREATE TABLE `table_Group` (
    GroupID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName VARCHAR(50) NOT NULL,
    CreatorID INT UNSIGNED NOT NULL ,
    CreateDate DATE NOT NULL
);

DROP TABLE IF EXISTS  `table_GroupAccount`;
CREATE TABLE `table_GroupAccount` (
    GroupID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    AccountID TINYINT NOT NULL,
    JoinDate DATE NOT NULL
);

DROP TABLE IF EXISTS  `table_TypeQuestion`;
CREATE TABLE `table_TypeQuestion` (
    TypeID INT,
    TypeName VARCHAR(50)
);

DROP TABLE IF EXISTS  `table_CategoryQuestion`;
CREATE TABLE `table_CategoryQuestion` (
    CategoryID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(30) NOT NULL
);

DROP TABLE IF EXISTS  `table_Question`;
CREATE TABLE `table_Question` (
    QuestionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content VARCHAR(100) NOT NULL ,
    CategoryID TINYINT NOT NULL,
    TypeID TINYINT NOT NULL,
    CreatorID TINYINT NOT NULL,
    CreateDate DATE NOT NULL
);

DROP TABLE IF EXISTS  `table_Answer`;
CREATE TABLE `table_Answer` (
    AnswerID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content VARCHAR(100) NOT NULL,
    QuestionID TINYINT NOT NULL,
    isCorrect ENUM("0","1") -- 0: True, 1: False
);

DROP TABLE IF EXISTS  `table_Exam`;
CREATE TABLE `table_Exam` (
    ExamID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ExamCode TINYINT NOT NULL,
    Title VARCHAR(100) NOT NULL,
    CategoryID TINYINT NOT NULL,
    Duration TIME NOT NULL,
    CreatorID TINYINT NOT NULL,
    CreateDate DATE NOT NULL
);  
 
DROP TABLE IF EXISTS  `table_ExamQuestion`;
CREATE TABLE `table_ExamQuestion` (
    ExamID TINYINT NOT NULL,
    QuestionID TINYINT NOT NULL
);
