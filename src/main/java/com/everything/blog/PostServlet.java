package com.everything.blog;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Connection.ConnectJDBC;
import com.everything.dao.Categoriesdao;

@WebServlet("/PostServlet")
public class PostServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	String title = request.getParameter("title");
	int categoryId = Integer.parseInt(request.getParameter("cid"));
	String content = request.getParameter("desc");
	
	HttpSession session = request.getSession();
	User user = (User)session.getAttribute("userD");
	
	postblog pb = new postblog(title,content,null,categoryId,user.getUserid());
	
	Categoriesdao dao = new Categoriesdao(ConnectJDBC.connect());
	
		if(dao.insertblog(pb) == true) {
			response.sendRedirect("postinserted.jsp");
		}else {
			response.sendRedirect("create_blog.jsp");
		}
	}

}
