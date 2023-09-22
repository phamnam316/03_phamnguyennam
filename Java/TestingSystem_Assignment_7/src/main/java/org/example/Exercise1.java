package org.example;
import org.example.Student;

public class Exercise1 {
    public static void main(String[] args) {
        Student student1 = new Student(1, "Nguyễn Văn A");
        Student student2 = new Student(2, "Nguyễn Văn B");
        Student student3 = new Student(3, "Nguyễn Văn C");
        Student[] students = {student1, student2, student3};
        for (Student student : students) {
            System.out.println("id : " + student.id + ", tên : " + student.name + ", " + Student.college);
        }

        Student.college = "Đại học Công nghệ";

        for (Student student : students) {
            System.out.println("id : " + student.id + ", tên : " + student.name + ", " + Student.college );
        }
        Student.setCollege("Đại học UIT");

        for (Student student : students) {
            System.out.println("id : " + student.id + ", tên : " + student.name + ", " + Student.college);
        }

        System.out.println(Student.getCollege());
        System.out.println(Student.getDemHS());

    }
}
