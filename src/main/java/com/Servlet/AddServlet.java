package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.PostDao;
import com.Db.dBConnect;
import com.User.UserDetails;
import com.User.post;

@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

		int uid = Integer.parseInt(request.getParameter("uid"));
		String title = request.getParameter("title");
		String description = request.getParameter("description");

		PostDao dao = new PostDao(dBConnect.getConn());
		boolean f = dao.AddNotes(title, description, uid);

		if (f)
		{
			System.out.println("Data inserted successfully !!");
		response.sendRedirect("showNotes.jsp");}
		else {
			response.sendRedirect("addNotes.jsp");}
			System.out.println("Data not inserted !!");}

	}


