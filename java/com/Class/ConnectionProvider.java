    package com.Class;

    import java.sql.*;

    public class ConnectionProvider {

        private static Connection con;

        public static Connection getConnection() {

            try {
                if (con == null) {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/peoplemart", "root", "root");
                    System.out.println("Connection ok...");
                }
            } catch (Exception e) {
                System.out.println("Error for db : " + e.getMessage());
            }
            return con;
        }
    }
