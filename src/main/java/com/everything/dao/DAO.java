package com.everything.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.everything.blog.User;

public class DAO {
	private Connection con;
	
	public DAO(Connection con) {
		// TODO Auto-generated constructor stub
		super();
		this.con = con;
	}
	public boolean insert(User u) {
			String query = "insert into login(email,fname,lname,pass) values(?,?,?,?)";
			
			try {
				
				PreparedStatement ps = con.prepareStatement(query);
				ps.setString(1, u.getEmail());
				ps.setString(2, u.getFname());
				ps.setString(3, u.getLname());
				ps.setString(4, u.getPasswowrd());
				
				int check = ps.executeUpdate();
				
				if(check == 1)return true;
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		return false;
	}
	
	public User check(String email,String pass) {
		
		User user=null;
		
		String query = "select * from login where email=? and pass = ?";
		
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, pass);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				//return true;
				user = new User();
				user.setUserid(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setFname(rs.getString("fname"));
				user.setLname(rs.getString("lname"));
				user.setPasswowrd(rs.getString("pass"));
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		//return false;
		return user;
	}
	
	public boolean update(User user) {
		
		String query="UPDATE login set email=?, fname = ?, lname= ?,pass=? where id=?";
		
		try {
			
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1,user.getEmail());
			ps.setString(2, user.getFname());
			ps.setString(3, user.getLname());
			ps.setString(4, user.getPasswowrd());
			ps.setInt(5, user.getUserid());
			
			int i = ps.executeUpdate();
			if(i ==1)return true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}

}
