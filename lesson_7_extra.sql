USE `projects`;

DELIMITER $$
CREATE TRIGGER Ex1
BEFORE INSERT ON `project_modules`
FOR EACH ROW
BEGIN
    DECLARE project_start_date DATE;
    DECLARE project_completed_date DATE;
-- Lay ngay vat dau va hoan thanh du an
SELECT ProjectStartDate, ProjectCompletedOn
    INTO project_start_date, project_completed_date
    FROM `Projects`
    WHERE Projects.ProjectID = NEW.ProjectID;

-- Ktra du lieu nhap vao
IF NEW.ProjectModulesDate < project_start_date THEN 
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Ngay module khong duoc truoc ngay bat dau du an';
END IF;

IF NEW.ProjectModulesCompletedOn > project_completed_date THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ngay hoan thanh module khong đuoc sau ngay hoan thanh du an.';
    END IF;
END $$
DELIMITER ;

INSERT INTO Projects (ManagerID, ProjectName, ProjectStartDate, ProjectDescription, ProjectDetail, ProjectCompletedOn)
VALUES
    (1, 'Project X', '2023-06-06', 'Description of Project X', 'Details of Project X', '2022-08-08');

INSERT INTO Project_Modules (ProjectID, EmployeeID, ProjectModulesDate, ProjectModulesCompletedOn, ProjectModulesDescription)
VALUES
    (10, 1, '2023-07-07', '2023-06-06', 'Description of Module 1 for Project X');