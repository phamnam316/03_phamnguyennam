package org.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Exercise1 {
    private static String db_url = "jdbc:mysql://127.0.0.1:3306/testing_system_assignment_1";
    private static String user = "root";
    private static String password = "123456";

    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(db_url, user, password);
            System.out.println("Connect success!");
            connection.close();
        }catch (SQLException | ClassNotFoundException e){
            System.out.println(e.getMessage());
        }
    }
}
