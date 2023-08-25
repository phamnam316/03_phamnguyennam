package org.example.TestingSystem_Assignment_1;
import java.util.Random;
import java.util.Scanner;

public class DatatypeCasting {
    public static void main(String[] args){
        question1();
        question2();
        question3();
        question4();
    };
    public static void question1(){
        float luongAccount1 = 5240.5F;
        float luongAccount2 = 10970.055F;

        int luongaccount1 = (int)luongAccount1;
        int luongaccount2 = (int)luongAccount2;

        System.out.println(luongaccount1);
        System.out.println(luongaccount2);

    }

    public static void question2(){
        Random random = new Random();
        int randomNumber = random.nextInt(10000);

        String formatNumber = String.format("%05d" , randomNumber);
        System.out.println("Số random là :" + formatNumber);
    }
    public static void question3(){
        Random random = new Random();
        int randomNumber = random.nextInt(10000);
        String formatNumber = String.format("%05d" , randomNumber);
        System.out.println("Số random là :" + formatNumber);

        int lastTwoDigits = randomNumber % 100;

        System.out.println("2 số cuối của số là: " + lastTwoDigits);
    }

    public static void question4(){
        Scanner scanner = new Scanner(System.in);
        System.out.println("Nhap vao so a :");
        float a = scanner.nextFloat();
        System.out.println("Nhap vao so b :");
        float b = scanner.nextFloat();

        if(b != 0){
            System.out.println(" a/b = " + a/b);
        }else {
            System.out.println("b không được phép bằng 0");
        }
    }


}
