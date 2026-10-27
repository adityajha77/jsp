

package com.studentcrud;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    // Database URL, username, and password
    private static final String URL = "jdbc:mysql://localhost:3306/student999";
    private static final String USER = "root";
    private static final String PASSWORD = "root123"; // Adjust to your local MySQL password

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}