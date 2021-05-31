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

@WebServlet("/edit_profile")
public class edit_profile extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession s = request.getSession();
		User user = (User)s.getAttribute("userD");
		user.setEmail(request.getParameter("email"));
		user.setFname(request.getParameter("fname"));
		user.setLname(request.getParameter("lname"));
		user.setPasswowrd(request.getParameter("pass"));
		
		
		
		Connection con = ConnectJDBC.connect();
		DAO dao = new DAO(con);
		
		if(dao.update(user)) {
			response.sendRedirect("profile.jsp");
		}else {
			response.sendRedirect("edit_profile.jsp");
		}
		
	}

}
