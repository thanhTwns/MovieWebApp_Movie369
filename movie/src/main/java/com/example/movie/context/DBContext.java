package com.example.movie.context;

import java.sql.*;

public class DBContext {

    public Connection getConnection() throws ClassNotFoundException, SQLException {
        String serverName = "localhost";
        String dbName = "LTW_Movie369";
        String port = "1433";
        String userID = "sa";
        String password = "Tuandeptrai@123";

        String url = "jdbc:sqlserver://" + serverName + ":" + port +
                ";databaseName=" + dbName + ";encrypt=true;trustServerCertificate=true;";

        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userID, password);
    }

}
