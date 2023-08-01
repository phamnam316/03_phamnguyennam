DROP DATABASE IF EXISTS `Fresher Training Management`;
CREATE DATABASE `Fresher Training Management`;
USE `Fresher Training Management`;
-- Exercise 1:
-- Question 1:	
DROP TABLE IF EXISTS `Table_Trainee`;
CREATE TABLE `Table_Trainee`(
 TraineeID  INT AUTO_INCREMENT,
  Full_Name  VARCHAR(50),
  Birth_Date DATE,
  Gener VARCHAR(10),
  ET_IQ  INT,
  ET_Gmath INT,
  ET_English INT,
  Training_Class INT,
  Evaluation_Notes TEXT,
  PRIMARY KEY(TraineeID)
);

-- Question 2:

ALTER TABLE `Table_Trainee` ADD VTI_Account VARCHAR(50) NOT NULL UNIQUE;

-- Exercise 2:

DROP TABLE IF EXISTS `Data_Type`;
CREATE TABLE `Data_Type`(
ID INT AUTO_INCREMENT,
Name VARCHAR(50),
Code VARCHAR(5),
ModifiedDate DATETIME,
PRIMARY KEY(ID)
);		

-- Exercise 3:

DROP TABLE IF EXISTS `Data_Type_2`;
CREATE TABLE `Data_Type_2`(
ID INT AUTO_INCREMENT,
Name VARCHAR(50),
BirthDate DATE,
Gender INT,
IsDeletedFlag BIT,
PRIMARY KEY(ID)
);
		