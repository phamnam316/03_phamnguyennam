package org.example;

import java.lang.reflect.Parameter;
import java.sql.*;

public class Exercise2 {
    private static String db_url = "jdbc:mysql://127.0.0.1:3306/testing_system_assignment_1";
    private static String user = "root";
    private static String password = "123456";

    public static void main(String[] args) {
        String insertPosition = "INSERT INTO `table_position` VALUES (? , ?)";
        String selectPosition = "SELECT PositionID,PositionName  FROM `table_position`";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(db_url, user, password);
            PreparedStatement preparedStatement = connection.prepareStatement(insertPosition);
            preparedStatement.setInt(1, 1);
            preparedStatement.setString(2, "Dev");
            preparedStatement.execute();
            preparedStatement = connection.prepareStatement(selectPosition);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                System.out.println(rs.getInt(1) + "  " + rs.getString(2));
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

}
