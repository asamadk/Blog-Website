package com.Connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectJDBC {

	public static Connection con;
	
	public static Connection connect() {
		
		try {
			if(con == null) {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog","root","wolf");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
}
