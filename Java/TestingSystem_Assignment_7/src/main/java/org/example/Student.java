package org.example;

public class Student {
    int id;
    String name;
    public static String college = "Đại học bách khoa";

    public static int moneyGroup;

    public static int demHS = 0;

    public Student(int id, String name) {
        this.name = name;
        this.id = id;
        moneyGroup += 100;
        demHS++;
    }

    public static String getCollege() {
        return college;
    }

    public void muaBanhKeo() {
        if (Student.moneyGroup >= 50) {
            Student.moneyGroup = Student.moneyGroup - 50;
        } else {
            System.out.println("Không đủ tiền để mua bánh keo");
        }
    }

    public void muaBanhMi() {
        if (Student.moneyGroup >= 20) {
            Student.moneyGroup = Student.moneyGroup - 20;
        } else {
            System.out.println("Không đủ tiền để mua bánh mì");
        }
    }

    public void muaDoDung() {
        if (Student.moneyGroup >= 150) {
            Student.moneyGroup = Student.moneyGroup - 50;
        } else {
            System.out.println("Không đủ tiền để mua đồ dùng");
        }
    }

    public void NopTien() {
        Student.moneyGroup += 50;
    }

    public static void TinhTien() {
        System.out.println("Tiền còn lại là : " + Student.moneyGroup);
    }

    public static void setCollege(String C){
        college = C;
    }

    public static String getcollege() {
        return college;
    }

    public static int getDemHS() {
        return demHS;
    }
}
