
package com.learn.mycart.servlets;

import java.sql.Connection;
import java.sql.DriverManager;

public class DB {
    static String URL = "172.20.29.70:3306/";
    static String DATABASE_NAME = "mycart";
    static String USERNAME = "admin";
    static String PASSWORD = "ordering";

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://" + URL + DATABASE_NAME, USERNAME, PASSWORD);
        } catch (Exception e) {
            System.out.println(e);
            e.printStackTrace();
        }
        return con;
    }
}

