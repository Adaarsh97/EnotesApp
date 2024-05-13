package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.UserDao;
import com.Db.dBConnect;
import com.User.UserDetails;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String name = req.getParameter("fname");
		String email = req.getParameter("uemail");
		String password = req.getParameter("upassword");

		UserDetails user = new UserDetails();
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);

		UserDao dao = new UserDao(dBConnect.getConn());
		boolean b = dao.addUser(user);
		PrintWriter p = res.getWriter();

		if (b) {

			HttpSession session = req.getSession();
			session.setAttribute("reg-success", "Registeration sucessfully...");
			res.sendRedirect("register.jsp");

		} else {

			HttpSession session = req.getSession();
			session.setAttribute("failed-msg", "Something went wrong on server...");
			res.sendRedirect("register.jsp");
		}

	}

}
