package org.example;

public class Exercise2 {

    public static void main(String[] args) {
        Student student1 = new Student(1, "Student 1");
        Student student2 = new Student(2, "Student 2");
        Student student3 = new Student(3, "Student 3");

        student1.muaBanhKeo();
        Student.TinhTien();

        student2.muaBanhMi();
        Student.TinhTien();

        student3.muaDoDung();
        Student.TinhTien();

        student1.NopTien();
        student2.NopTien();
        student3.NopTien();
        Student.TinhTien();

    }


}
