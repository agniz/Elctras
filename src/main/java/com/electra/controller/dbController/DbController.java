package com.electra.controller.dbController;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbController {
	 public static Connection getCon() throws SQLException, ClassNotFoundException {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        String url = ("jdbc:mysql://localhost:3306/electra");
	        String username = "root";
	        String password = "";
	        return DriverManager.getConnection(url, username, password);
	    }
}
