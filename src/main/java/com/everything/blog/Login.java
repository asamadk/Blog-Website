package com.everything.blog;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import org.graalvm.compiler.lir.LIRInstruction.Use;

import com.Connection.ConnectJDBC;
import com.everything.dao.DAO;

@WebServlet("/Login")
public class Login extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		
		Connection con = ConnectJDBC.connect();
		DAO dao = new DAO(con);
		User user = dao.check(email, pass);
		
		if(user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userD", user);
			response.sendRedirect("welcome.jsp");
		}else {
			response.sendRedirect("login.jsp");
		}
		
	}

}
