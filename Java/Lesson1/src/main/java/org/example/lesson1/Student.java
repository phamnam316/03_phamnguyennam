package org.example.lesson1;
import java.util.Date;


public class Student {
    public enum Gender {
        MALE, FEMALE, UNKNOW;
    }
    int id;
    float salary;
    String fullName;
    char a;
    boolean isPassCourse;
    Date birthDay;

    Gender gender;
    int[] diems;
    void goToSchool() {
        System.out.println("I'm going to school ... ");
    }

}


