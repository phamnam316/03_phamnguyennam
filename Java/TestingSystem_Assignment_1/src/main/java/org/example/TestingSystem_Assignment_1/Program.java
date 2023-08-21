package org.example.TestingSystem_Assignment_1;

import java.sql.Time;
import java.util.Date;

public class Program {
     public static void main(String[] args){
         Department department1 = new Department();
         department1.departmentId = 1;
         department1.departmentName = "Sale";

         Department department2 = new Department();
         department2.departmentId = 2;
         department2.departmentName = "Marketing";

         Position position1 = new Position();
         position1.positionId = 1;
         position1.positionName = Position.PositionName.DEV;

         Position position2 = new Position();
         position2.positionId = 2;
         position2.positionName = Position.PositionName.PM;

         Account account1 = new Account();
         account1.accountId = 1;
         account1.email = "a@gmail.com";
         account1.userName = "A";
         account1.fullName = "Nguyen Van";
         account1.departmentId = 1;
         account1.positionId = 1;
         account1.createDate = new Date();

         Group group1 = new Group();
         group1.creatorId = 1;
         group1.groupName = "A";
         group1.creatorId = 1;
         group1.createDate = new Date();

         GroupAccount groupAccount1 =  new GroupAccount();
         groupAccount1.groupId = 1;
         groupAccount1.accountId = 1;
         groupAccount1.joinDate = new Date();

         TypeQuestion typeQuestion1 = new TypeQuestion();
         typeQuestion1.typeId = 1;
         typeQuestion1.typeName = TypeQuestion.TypeName.ESSAY;

         TypeQuestion typeQuestion2 = new TypeQuestion();
         typeQuestion1.typeId = 2;
         typeQuestion1.typeName = TypeQuestion.TypeName.MULTIPLECHOICE;

         CategoryQuestion categoryQuestion1 = new CategoryQuestion();
         categoryQuestion1.categoryId = 1;
         categoryQuestion1.categoryName = "A";

         Question question1 = new Question();
         question1.questionId = 1;
         question1.content ="a";
         question1.categoryId = 1;
         question1.typeId = 1;
         question1.creatorId = 1;
         question1.createDate = new Date();

         Answer answer1 = new Answer();
         answer1.answerID = 1;
         answer1.content = "a";
         answer1.questionId = 1;
         answer1.isCorrect = true;

         Exam exam1 = new Exam();
         exam1.examId = 1;
         exam1.code = 123;
         exam1.title = "a";
         exam1.categoryId = 1;
         exam1.duration = new Time(1);
         exam1.creatorId = 1;
         exam1.createDate = new Date();

         ExamQuestion examQuestion1 = new ExamQuestion();
         examQuestion1.examId = 1;
         examQuestion1.questionID = 1;


         System.out.println("ID phòng ban : " + department1.departmentName );

         System.out.println("Chức vụ id 1 : " + position1.positionName );

         System.out.println("Định danh user 1 : " + account1.accountId );

         System.out.println("Định danh nhóm 1 : " + group1.groupId );

         System.out.println("ngày user tham gia vào nhóm : " + groupAccount1.joinDate );

         System.out.println("định danh câu hỏi : " + question1.questionId );

         System.out.println("tên chủ đề câu hỏi : " + categoryQuestion1.categoryName );

         System.out.println("nội dung câu hỏi 1  : " + question1.content );

         System.out.println("nội dung câu trả lời 1 cho câu hỏi 1 : " + answer1.content );

         System.out.println("mã đề thi : " + exam1.code );

         System.out.println("định danh của đề thi" + examQuestion1.examId);

     }
}
