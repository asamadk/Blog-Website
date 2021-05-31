package com.everything.blog;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Connection.ConnectJDBC;
import com.everything.dao.DAO;

@WebServlet("/Register")
public class Register extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String pass = request.getParameter("pass");
		
		User user = new User(email,fname,lname,pass);
		
		//Connection con = conn.connect();
		DAO dao = new DAO(ConnectJDBC.connect());
		
		if(dao.insert(user)) {
			response.sendRedirect("login.jsp");
		}else {
			response.sendRedirect("register.jsp");
		}
	}

}
