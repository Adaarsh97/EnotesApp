package com.Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.PostDao;
import com.Db.dBConnect;
import com.User.UserDetails;
import com.User.post;

@WebServlet("/NoteEditServlet")
public class NoteEditServlet extends HttpServlet {

	public NoteEditServlet() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			Integer Noteid = Integer.parseInt(request.getParameter("uid"));
			String Title = request.getParameter("title");
			String Content = request.getParameter("description");

			PostDao dao = new PostDao(dBConnect.getConn());
			boolean f = dao.PostUpdate(Noteid, Title, Content);

			if (f) {
				System.out.println("Data Updated Successfully");
				HttpSession session = request.getSession();
				session.setAttribute("updateMsg", "Notes Updated Successfully");
				ArrayList<post> userPost = (ArrayList<post>)session.getAttribute("UserPosts");
				PostDao pDao= new PostDao(dBConnect.getConn());
				UserDetails user = (UserDetails) session.getAttribute("UserD");
				List<post> userPosts = pDao.SearchNotes(user.getId());
				session.setAttribute("UserPosts", userPosts);
				response.sendRedirect("showNotes.jsp");

			} else {
				System.out.println("Something went wrong");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
