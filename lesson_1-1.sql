Drop Database if exists `Testing_System_Assignment_1`;
Create Database `Testing_System_Assignment_1`;
Use `Testing_System_Assignment_1`;

Drop Table if exists `table_Department`;
Create Table `table_Department`(
  DepartmentID  INT,
  DepartmentIDName VARCHAR(50)
);

Drop Table if exists `table_Position`; 
Create Table `table_Position`(
  PositionID    INT,
  PositionName  VARCHAR(20)
);

Drop Table if exists `table_Account`; 
Create Table `table_Account`( 
  AccountID    INT,
  Email        VARCHAR(50),
  UserName     VARCHAR(50),
  FullName     VARCHAR(50),
  DepartmentID  INT,
  PositionID    INT,
  CreateDate    DATE
);


Drop Table if exists `table_Group`; 
Create Table `table_Group`( 
  GroupID    INT,
  GroupName    VARCHAR(50),
  CreatorID  INT,
  CreateDate    DATE
);

Drop Table if exists `table_GroupAccount`; 
Create Table `table_GroupAccount`( 
  GroupID    INT,
  AccountID  INT,
  JoinDate    DATE
);

Drop Table if exists `table_TypeQuestion`; 
Create Table `table_TypeQuestion`( 
  TypeID    INT,
  TypeName  VARCHAR(50)
);

Drop Table if exists `table_CategoryQuestion`; 
Create Table `table_CategoryQuestion`( 
  CategoryID    INT,
  CategoryName  VARCHAR(50)
);

Drop Table if exists `table_Question`; 
Create Table `table_Question`( 
  QuestionID    INT,
  Content     VARCHAR(200),
  CategoryID    INT,
  TypeID        INT,
  CreatorID     INT,
  CreateDate    DATE
);

Drop Table if exists `table_Answer`; 
Create Table `table_Answer`( 
  AnswerID    INT,
  Content     VARCHAR(200),
  QuestionID  INT,
  isCorrect    VARCHAR(50)
);

Drop Table if exists `table_Exam`; 
Create Table `table_Exam`( 
  ExamID    INT,
  Code      INT,
  Title     VARCHAR(100),
  CategoryID    INT,
  Duration      TIME,
  CreatorID     INT,
  CreateDate    DATE
);

Drop Table if exists `table_ExamQuestion`; 
Create Table `table_ExamQuestion`( 
  ExamID    INT,
  QuestionID    INT
);