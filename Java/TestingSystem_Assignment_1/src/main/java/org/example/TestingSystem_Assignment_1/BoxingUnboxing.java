package org.example.TestingSystem_Assignment_1;

public class BoxingUnboxing {
    public static void main(String[] args){
        question1();
        question2();
        question3();
    };
    public static void question1(){
        Integer x = Integer.valueOf(5000);
        float y = x.floatValue();
        System.out.printf("Lương : %.2f\n", y);
    }

    public static void question2(){
        String x = "1234567";
        int y = Integer.parseInt(x);
        System.out.println(y);
    }

    public static void question3(){
        Integer x = Integer.valueOf(1234567);
        int y = x.intValue();
        System.out.println(y);
    }



}
