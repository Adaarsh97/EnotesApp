package com.Servlet;

import java.io.IOException;
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

/**
 * Servlet implementation class showNotesServlet
 */
@WebServlet("/showNotesServlet")
public class showNotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public showNotesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostDao pDao= new PostDao(dBConnect.getConn());
		
		HttpSession session = request.getSession();
		UserDetails user = (UserDetails) session.getAttribute("UserD");
		List<post> userPosts = pDao.SearchNotes(user.getId());
		session.setAttribute("UserPosts", userPosts);
		response.sendRedirect("showNotes.jsp");
		
	}

	
}
