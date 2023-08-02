DROP DATABASE IF EXISTS `Fresher Training Management`;
CREATE DATABASE `Fresher Training Management`;
USE `Fresher Training Management`;
-- Exercise 1:
-- Question 1:	
DROP TABLE IF EXISTS `Table_Trainee`;
CREATE TABLE `Table_Trainee` (
    TraineeID TINYINT UNSIGNED AUTO_INCREMENT,
    Full_Name NVARCHAR(50) NOT NULL,
    Birth_Date DATE NOT NULL,
    Gener ENUM("male","female","unknow") NOT NULL,
    ET_IQ TINYINT UNSIGNED CHECK( ET_IQ <= 20 ) NOT NULL,
    ET_Gmath TINYINT UNSIGNED CHECK( ET_Gmath <= 20 ) NOT NULL,
    ET_English TINYINT UNSIGNED CHECK( ET_English <= 50 ) NOT NULL,
    Training_Class CHAR(6) NOT NULL,
    Evaluation_Notes TEXT NOT NULL,
    PRIMARY KEY (TraineeID)
);

-- Question 2:

ALTER TABLE `Table_Trainee` ADD COLUMN VTI_Account VARCHAR(30) NOT NULL UNIQUE;

-- Exercise 2:

DROP TABLE IF EXISTS `Data_Type`;
CREATE TABLE `Data_Type` (
    ExerciseID INT UNSIGNED AUTO_INCREMENT,
    ExerciseName VARCHAR(50) NOT NULL,
    ExerciseCode CHAR(5) NOT NULL,
    ModifiedDate DATETIME DEFAULT NOW(),
    PRIMARY KEY (ExerciseID)
);		

-- Exercise 3:

DROP TABLE IF EXISTS `Data_Type_2`;
CREATE TABLE `Data_Type_2` (
    ExerciseID INT UNSIGNED AUTO_INCREMENT,
    ExerciseName VARCHAR(50) NOT NULL,
    BirthDate DATE NOT NULL,
    Gender ENUM('0', '1', '2'),
    IsDeletedFlag ENUM('0', '1') NOT NULL,
    PRIMARY KEY (ExerciseID)
);
		