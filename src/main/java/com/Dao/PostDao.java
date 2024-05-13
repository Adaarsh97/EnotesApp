package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.User.post;

public class PostDao {

	private Connection conn;

	public PostDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean AddNotes(String title, String description, int uid) {

		boolean f = false;
		try {
			String q = "insert into post(title,content,uid) values(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(q);
			ps.setString(1, title);
			ps.setString(2, description);
			ps.setInt(3, uid);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<post> SearchNotes(int uid) {

		boolean f = false;
		List<post> userPosts = new ArrayList<>();
		try {
			String q = "Select * from  post where uid=? order by id desc";
			PreparedStatement ps = conn.prepareStatement(q);
			ps.setInt(1, uid);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				post posts = new post(rs.getInt("id"), rs.getString("title"), rs.getString("content"),
						rs.getDate("date"));
				userPosts.add(posts);

			}
			System.out.print("(((((((((((((");
			userPosts.stream().forEach(System.out::println);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return userPosts;
	}

	public post SearchNote(int pid) {

		
		
		post posts= new post();
		try {
			String q = "Select * from  post where id=? order by id desc";
			PreparedStatement ps = conn.prepareStatement(q);
			ps.setInt(1, pid);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				 posts = new post(rs.getInt("id"), rs.getString("title"), rs.getString("content"),
						rs.getDate("date"));
				

			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return posts;
	}

	public boolean PostUpdate(int nid, String s1, String s2) {

		boolean f = false;
		try {
			String q = "update post set title=? ,content=? where id=?";
			PreparedStatement ps = conn.prepareStatement(q);
			ps.setString(1, s1);
			ps.setString(2, s2);
			ps.setInt(3, nid);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}

	public boolean DeleteNote(int nid) {

		boolean f = false;

		try {
			String q = "delete from post where id=?";
			PreparedStatement ps = conn.prepareStatement(q);
			ps.setInt(1, nid);
			int x = ps.executeUpdate();
			if (x == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
