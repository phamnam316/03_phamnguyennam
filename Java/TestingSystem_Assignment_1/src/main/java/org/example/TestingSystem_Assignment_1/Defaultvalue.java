package org.example.TestingSystem_Assignment_1;

import java.time.LocalDate;
import java.util.Date;

public class Defaultvalue {
    public static void main(String[] args){
        question1();
    };

    public static void question1(){
        Account[] accounts = new Account[5];
        for (int i = 0; i < accounts.length; i++ ){
            accounts[i] = new Account();
            accounts[i].email = "Email " + (i + 1);
            accounts[i].userName ="User Name " + (i + 1);
            accounts[i].fullName ="Full Name " + (i + 1);
            accounts[i].createDate = LocalDate.now();
        }

        for (Account account : accounts){
            System.out.println(account.email);
            System.out.println(account.userName);
            System.out.println(account.fullName);
            System.out.println(account.createDate);
            System.out.println();
        }
    }

}
