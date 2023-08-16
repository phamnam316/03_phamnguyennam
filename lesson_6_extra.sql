DROP DATABASE IF EXISTS `Projects`;
CREATE DATABASE `Projects`;
USE `Projects`;


-- Create Projects table
CREATE TABLE `Projects` (
    ProjectID TINYINT AUTO_INCREMENT PRIMARY KEY,
    ManagerID TINYINT,
    ProjectName VARCHAR(50) NOT NULL,
    ProjectStartDate DATE NOT NULL,
    ProjectDescription VARCHAR(50),
    ProjectDetail VARCHAR(100),
    ProjectCompletedOn DATE NOT NULL
);
ALTER TABLE `Projects` ADD CONSTRAINT FK_P_01 FOREIGN KEY (ManagerID) REFERENCES `Employees`(EmployeeID);
-- Create Project_Modules table
CREATE TABLE `Project_Modules` (
    ModuleID TINYINT AUTO_INCREMENT PRIMARY KEY,
    ProjectID TINYINT,
    EmployeeID TINYINT,
    ProjectModulesDate DATE NOT NULL,
    ProjectModulesCompletedOn DATE NOT NULL,
    ProjectModulesDescription VARCHAR(100) NOT NULL
);
 ALTER TABLE `Project_Modules` ADD CONSTRAINT FK_PM_01   FOREIGN KEY (ProjectID) REFERENCES `Projects` (ProjectID);
 ALTER TABLE `Project_Modules` ADD CONSTRAINT FK_PM_02   FOREIGN KEY (EmployeeID) REFERENCES `Employees` (EmployeeID);
 
-- Create Employees table
CREATE TABLE `Employees` (
    EmployeeID TINYINT AUTO_INCREMENT PRIMARY KEY,
    EmployeeLastName VARCHAR(50) NOT NULL,
    EmployeeFistName VARCHAR(50) NOT NULL,
    EmployeeHireDate DATE NOT NULL,
    EmployeeStatus VARCHAR(50) NOT NULL,
    SupervisorID TINYINT,
    SocialSecurityNumber TINYINT
);
ALTER TABLE `Employees` ADD CONSTRAINT FK_E_01 FOREIGN KEY (SupervisorID) REFERENCES `Employees` (EmployeeID);
-- Create Work_Done table
DROP TABLE IF EXISTS `Work_Done`;
CREATE TABLE `Work_Done` (
    WorkDoneID INT PRIMARY KEY,
    EmployeeID TINYINT,
    ModuleID TINYINT,
    WorkDoneDate DATE NOT NULL,
    WorkDoneDescription VARCHAR(50) NOT NULL,
    WorkDoneStatus VARCHAR(50) NOT NULL
);
ALTER TABLE  `Work_Done` ADD CONSTRAINT FK_WD_01 FOREIGN KEY (EmployeeID) REFERENCES `Employees` (EmployeeID);
-- Vô hiệu hoá khoá ngoại
SET FOREIGN_KEY_CHECKS=0;
-- Thêm dữ liệu mẫu cho bảng Employees
INSERT INTO Employees (EmployeeLastName, EmployeeFistName, EmployeeHireDate, EmployeeStatus, SupervisorID, SocialSecurityNumber)
VALUES
    ('Nguyen', 'John', '2022-01-15', 'Active', 0, 12),
    ('Tran', 'Alice', '2022-02-20', 'Active', 1, 45),
    ('Le', 'Michael', '2022-03-10', 'Active', 1, 78);

-- Thêm dữ liệu mẫu cho bảng Projects
INSERT INTO Projects (ManagerID, ProjectName, ProjectStartDate, ProjectDescription, ProjectDetail, ProjectCompletedOn)
VALUES
    (1, 'Project X', '2022-01-01', 'Description of Project X', 'Details of Project X', '2022-04-01'),
    (1, 'Project Y', '2022-02-15', 'Description of Project Y', 'Details of Project Y', '2022-04-15'),
    (2, 'Project Z', '2022-03-10', 'Description of Project Z', 'Details of Project Z', '2022-05-01');

-- Thêm dữ liệu mẫu cho bảng Project_Modules
INSERT INTO Project_Modules (ProjectID, EmployeeID, ProjectModulesDate, ProjectModulesCompletedOn, ProjectModulesDescription)
VALUES
    (1, 2, '2022-01-05', '2022-01-25', 'Description of Module 1 for Project X'),
    (1, 3, '2022-01-15', '2022-02-05', 'Description of Module 2 for Project X'),
    (2, 2, '2022-02-20', '2022-03-10', 'Description of Module 1 for Project Y');

-- Thêm dữ liệu mẫu cho bảng Work_Done
INSERT INTO Work_Done (WorkDoneID, EmployeeID, ModuleID, WorkDoneDate, WorkDoneDescription, WorkDoneStatus)
VALUES
    (1, 2, 1, '2022-01-25', 'Completed work for Module 1', 'Completed'),
    (2, 3, 1, '2022-02-05', 'Completed work for Module 1', 'Completed'),
    (3, 2, 2, '2022-03-10', 'Completed work for Module 2', 'Completed');


DROP PROCEDURE IF EXISTS RemoveCompletedProjects;
-- b) Viết stored procedure (không có parameter) để Remove tất cả thông tin project đã hoàn thành sau 3 tháng kể từ ngày hiện. In số lượng record đã remove từ các table liên quan trong khi removing (dùng lệnh print)
hiện)
DELIMITER //
CREATE PROCEDURE RemoveCompletedProjects()
BEGIN
    DECLARE currentDate DATE;
    DECLARE removedCount INT;

    -- Lấy ngày hiện tại
    SET currentDate = CURDATE();

    -- Lấy số lượng bản ghi đã xóa
    SET removedCount = 0;

    -- Xóa dự án đã hoàn thành sau 3 tháng kể từ ngày hiện tại
    DELETE P, PM, WD
    FROM Projects P
    LEFT JOIN Project_Modules PM ON P.ProjectID = PM.ProjectID
    LEFT JOIN Work_Done WD ON PM.ModuleID = WD.ModuleID
    WHERE P.ProjectCompletedOn IS NOT NULL
    AND P.ProjectCompletedOn <= DATE_SUB(currentDate, INTERVAL 3 MONTH);

    -- Cập nhật số lượng bản ghi đã xóa
    SET removedCount = ROW_COUNT();

    -- In số lượng bản ghi đã xóa
    SELECT CONCAT('Removed ', removedCount, ' records.') AS Message;
END;
//
DELIMITER ;

-- Gọi stored procedure
CALL RemoveCompletedProjects();

-- c) Viết stored procedure (có parameter) để in ra các module đang được thực
DELIMITER //
CREATE PROCEDURE GetInProgressModules(IN p_ProjectID TINYINT, IN p_EmployeeID TINYINT)
BEGIN
    SELECT PM.ModuleID, PM.ProjectID, PM.EmployeeID, PM.ProjectModulesDate, PM.ProjectModulesCompletedOn, PM.ProjectModulesDescription
    FROM Project_Modules PM
    WHERE PM.ProjectID = p_ProjectID AND PM.EmployeeID = p_EmployeeID
    AND PM.ProjectModulesCompletedOn IS NULL;

END;
//
DELIMITER ;


DELIMITER //
CREATE PROCEDURE GetInProgressModules(
    IN p_ProjectID TINYINT, 
    IN p_EmployeeID TINYINT,
    OUT p_ModuleID TINYINT
)
BEGIN
    SELECT PM.ModuleID
    INTO p_ModuleID
    FROM Project_Modules PM
    WHERE PM.ProjectID = p_ProjectID 
    AND PM.EmployeeID = p_EmployeeID
    AND PM.ProjectModulesCompletedOn IS NULL;

END;
//
DELIMITER ;

SET @ModuleID ='';
CALL GetInProgressModules(1, 1, @ModuleID);
SELECT @ModuleID;

-- d) Viết hàm (có parameter) trả về thông tin 1 nhân viên đã tham gia làm mặc dù không ai giao việc cho nhân viên đó (trong bảng Works).
SET @@session.sql_log_bin = 0;

DELIMITER //
CREATE FUNCTION GetEmployeesWithoutAssignedTasks(
    p_EmployeeID TINYINT
)
RETURNS BOOLEAN
DETERMINISTIC
NO SQL
BEGIN
    DECLARE result BOOLEAN;

    SELECT 
        COUNT(*) INTO result
    FROM
        Employees E
    WHERE
        E.EmployeeID = p_EmployeeID
        AND E.EmployeeID NOT IN (SELECT DISTINCT EmployeeID FROM Work_Done);

    RETURN result;
END;
//
DELIMITER ;

-- Gọi hàm 
SELECT GetEmployeesWithoutAssignedTasks(1);




