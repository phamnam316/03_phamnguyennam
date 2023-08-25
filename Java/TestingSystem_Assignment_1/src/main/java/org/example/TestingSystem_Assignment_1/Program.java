package org.example.TestingSystem_Assignment_1;

import java.sql.Time;
import java.time.LocalDate;
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
         account1.createDate = LocalDate.now();

         Account account2 = new Account();
         account2.accountId = 2;
         account2.email = "b@gmail.com";
         account2.userName = "B";
         account2.fullName = "Tran Van";
         account2.departmentId = 1;
         account2.positionId = 1;
         account2.createDate = LocalDate.now();


         Group group1 = new Group();
         group1.creatorId = 1;
         group1.groupName = "Java Fresher";
         group1.creatorId = 1;
         group1.createDate = new Date();

         Group group2 = new Group();
         group2.creatorId = 2;
         group2.groupName = "C# Fresher";
         group2.creatorId = 1;
         group2.createDate = new Date();


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

      //Question 1:
         //Kiểm tra account thứ 2
         //Nếu không có phòng ban (tức là department == null) thì sẽ in ra text
         //"Nhân viên này chưa có phòng ban"
         //Nếu không thì sẽ in ra text "Phòng ban của nhân viên này là ..."
//Question 1:
         if(account2.departmentId == 0){
             System.out.println("Nhân viên này chưa có phòng ban");
         }else {
             System.out.println("Phòng ban của nhân viên này là " + account2.departmentId);
         }
//Question 3:
         System.out.println(account2.departmentId == 0 ?"Nhân viên này chưa có phòng ban":"Phòng ban của nhân viên này là " + account2.departmentId);

//Question 4:
         System.out.println(account1.positionId == 1 ? "Đây là Developer" :"Người này không phải là Developer");
//Question 5:
         Group[] groups1 = {group1};
         Account[] accounts1 = {account1,account2};
         group1.account = accounts1;

         int sl =group1.account.length;
         switch (sl){
             case 1 :
                 System.out.println("Nhóm có một thành viên");
                 break;
             case 2 :
                 System.out.println("Nhóm có hai thành viên");
                 break;
             case 3 :
                 System.out.println("Nhóm có ba thành viên");
                 break;
             default :
                 System.out.println("Nhóm có nhiều thành viên");
                 break;
         }
//Question 7:
       Position.PositionName x = Position.PositionName.DEV;
         switch (x){
             case DEV:
                 System.out.println("Đây là Developer");
                 break;
             default :
                 System.out.println("Người này không phải là Developer");
                 break;
         }
//Question 8:
         for (Account account: accounts1) {
                 System.out.println("Email: " + account.email);
                 System.out.println("FullName: " + account.fullName);
                 System.out.println("Department: " + account.departmentId);
                 System.out.println();
         }
//Question 9:
         Department[] departments = {department1,department2};
         for (Department department: departments) {
             System.out.println("DepartmentId: " + department.departmentId);
             System.out.println("DepartmentName: " + department.departmentName);
             System.out.println();
         }
//Question 10:
         for(int i = 0; i < accounts1.length ; i++){
             System.out.println("Thông tin account thứ " + (i + 1)  +"là:");
             System.out.println("Email: " + accounts1[i].email);
             System.out.println("FullName: " + accounts1[i].fullName);
             System.out.println("Phòng ban:" + accounts1[i].departmentId);
             System.out.println();
         }
//Question 11:
         for(int i = 0; i < departments.length ; i++){
             System.out.println("Thông tin department thứ " + (i + 1)  +"là:");
             System.out.println("Id: " + departments[i].departmentId);
             System.out.println("Name: " + departments[i].departmentName);
             System.out.println();
         }
//Question 12:
         for(int i = 0; i < 2 ; i++){
             System.out.println("Thông tin department thứ " + (i + 1)  +"là:");
             System.out.println("Id: " + departments[i].departmentId);
             System.out.println("Name: " + departments[i].departmentName);
             System.out.println();
         }
//Question 13:
         for(int i = 0; i < accounts1.length ; i++ ){
             if(i != 1){
                 System.out.println("Thông tin account thứ " + (i + 1)  +"là:");
                 System.out.println("Email: " + accounts1[i].email);
                 System.out.println("FullName: " + accounts1[i].fullName);
                 System.out.println("Phòng ban:" + accounts1[i].departmentId);
                 System.out.println();
             }

         }
//Question 14:
         for(int i = 0; i < accounts1.length ; i++ ){
             if(accounts1[i].accountId < 4){
             System.out.println("Thông tin account thứ " + (i + 1)  +"là:");
             System.out.println("Email: " + accounts1[i].email);
             System.out.println("FullName: " + accounts1[i].fullName);
             System.out.println("Phòng ban:" + accounts1[i].departmentId);
             System.out.println();
         }
         }
//Question 15:
         for(int i = 0; i < 20 ; i = i + 2 ){
                 System.out.println(i);
         }
//Question 16 :
         int i = 0;
         while (i < accounts1.length){
             System.out.println("Thông tin account thứ " + (i + 1)  +"là:");
             System.out.println("Email: " + accounts1[i].email);
             System.out.println("FullName: " + accounts1[i].fullName);
             System.out.println("Phòng ban:" + accounts1[i].departmentId);
             System.out.println();
             i++;
         }
//Question 17 :
         i = 0;
         while (i < departments.length){
             System.out.println("Thông tin department thứ " + (i + 1)  +"là:");
             System.out.println("Id: " + departments[i].departmentId);
             System.out.println("Name: " + departments[i].departmentName);
             System.out.println();
             i++;
         }
//Question 18 :
         i = 0;
         while (i < departments.length) {
             if (i == 1) {
                 continue;
             }
             System.out.println("Thông tin department thứ " + (i + 1) + "là:");
             System.out.println("Id: " + departments[i].departmentId);
             System.out.println("Name: " + departments[i].departmentName);
             System.out.println();
             i++;
         }
//Question 19 :
         i = 0;
         while (i < accounts1.length) {
             if(accounts1[i].accountId < 4){
                 System.out.println("Thông tin account thứ " + (i + 1)  +"là:");
                 System.out.println("Email: " + accounts1[i].email);
                 System.out.println("FullName: " + accounts1[i].fullName);
                 System.out.println("Phòng ban:" + accounts1[i].departmentId);
                 System.out.println();
                 i++;
             }
         }
//Question 20 :

}
}
