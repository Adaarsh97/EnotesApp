package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.UserDao;
import com.Db.dBConnect;
import com.User.UserDetails;
import com.mysql.cj.Session;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean isUserFound=false;

		String email = request.getParameter("uemail");
		String password = request.getParameter("upassword");
		String name = request.getParameter("uname");

		UserDetails us = new UserDetails();
		us.setEmail(email);
		us.setPassword(password);
		
		UserDao dao = new UserDao(dBConnect.getConn());
		UserDetails us1= dao.loginUser(us);
		if(us1!=null)isUserFound=true;
		
		
		HttpSession session = request.getSession();

		if (isUserFound) {
			us.setName(us1.getName());
			
			session.setAttribute("UserD", us);
			response.sendRedirect("addNotes.jsp");
		} else {
			session.setAttribute("login-failed", "Invalid Usernmame and Password");
			response.sendRedirect("login.jsp");
		}

		
	}
}
