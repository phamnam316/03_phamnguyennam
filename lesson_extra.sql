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
    Gender ENUM("male","female","unknow") NOT NULL,
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
    ModifiedDate DATETIME DEFAULT NOW (),
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

-- Assignment 3
-- Question 1:
INSERT INTO Table_Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes, VTI_Account)
VALUES (1, N'Hồ Văn An', '1995-05-10', 'male', 18, 16, 45, 'C101', N'Có tiềm năng, cần cải thiện về tiếng Anh.', 'R001'),
    (2, N'Nguyễn Thị Bình', '1997-02-20', 'female', 20, 18, 50, 'C102', N'Thành tích xuất sắc ở tất cả các lĩnh vực.', 'R002'),
    (3, N'Trần Văn Cường', '1998-07-15', 'male', 19, 15, 48, 'C101', N'Có khả năng, cần làm việc trên kỹ năng Toán học.', 'R003'),
    (4, N'Phạm Thị Dung', '1996-09-28', 'female', 17, 19, 47, 'C103', N'Kỹ năng phân tích mạnh mẽ, cần cải thiện về tiếng Anh.', 'R004'),
    (5, N'Lê Văn Dũng', '1999-04-02', 'male', 16, 17, 40, 'C102', N'Thiếu tinh thần làm việc, cần tập trung vào cải thiện IQ.', 'R005'),
    (6, N'Nguyễn Thị Diệu', '1997-12-12', 'female', 18, 20, 50, 'C103', N'Thành tích xuất sắc, học viên đa năng.', 'R006'),
    (7, N'Lê Văn Dương', '1996-11-05', 'male', 20, 19, 45, 'C101', N'Tiềm năng xuất sắc, cần làm việc trên Tiếng Anh và Toán học.', 'R007'),
    (8, N'Trần Thị Hà', '1998-06-19', 'female', 17, 16, 43, 'C102', N'Kết quả khá, cần cải thiện về IQ.', 'R008'),
    (9, N'Lê Văn Hùng', '1999-03-25', 'male', 19, 20, 50, 'C101', N'Trình độ cao, xuất sắc trong tất cả các lĩnh vực.', 'R009'),
    (10, N'Lê Thị Hương', '1996-10-30', 'female', 15, 14, 38, 'C103', N'Trình độ dưới trung bình, cần tập trung vào tất cả các lĩnh vực.', 'R010');
SELECT * FROM `Table_Trainee`;	
DELETE  FROM `Table_Trainee` WHERE TraineeID >= 1 AND TraineeID <= 10;			

-- Question 2:
SELECT MONTH(Birth_Date), COUNT(TraineeID)
FROM `Table_Trainee`
WHERE ET_IQ + ET_Gmath>=20 AND
ET_IQ>=8 AND
ET_Gmath>=8 AND
ET_English>=18
GROUP BY month(Birth_Date);

-- Question 3:
SELECT * 
FROM `Table_Trainee`
WHERE length(Full_Name) = (SELECT MAX(length(Full_Name)) FROM `Table_Trainee`);

-- Question 4:
SELECT TraineeID
FROM `Table_Trainee`
WHERE ET_IQ + ET_Gmath>=20 AND
ET_IQ>=8 AND
ET_Gmath>=8 AND
ET_English>=18;

-- Question 5:
DELETE FROM `Table_Trainee` WHERE TraineeID ="3";

-- Question 6:
UPDATE `Table_Trainee`
SET Training_Class = "2"
WHERE TraineeID ="5";