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

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer noteid = Integer.parseInt(request.getParameter("postId"));
		PostDao dao = new PostDao(dBConnect.getConn());
		boolean f = dao.DeleteNote(noteid);
		HttpSession session = null;

		if (f) {
			session = request.getSession();
			session.removeAttribute("UserPosts");
			
		
			ArrayList<post> userPost = (ArrayList<post>)session.getAttribute("UserPosts");
			PostDao pDao= new PostDao(dBConnect.getConn());
			UserDetails user = (UserDetails) session.getAttribute("UserD");
			List<post> userPosts = pDao.SearchNotes(user.getId());
			session.setAttribute("UserPosts", userPosts);
			session.setAttribute("DeleteMsg", "Notes Delete Successfully...");
			
			response.sendRedirect("showNotes.jsp");
		} else {
			session = request.getSession();
			session.setAttribute("WrongMsg", "Something went wrong...");
			
			response.sendRedirect("showNotes.jsp");
		}

	}

}
