package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.User.UserDetails;

public class UserDao {

	private Connection conn;

	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addUser(UserDetails us) {

		boolean b = false;
		try {
			String query = "insert into user(name,email,password) values(?,?,?)";

			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPassword());
			int i = ps.executeUpdate();
			if (i == 1) {
				b = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;

	}

	public UserDetails loginUser(UserDetails us) {

		boolean f = true;
		try {
			String query = "select * from user where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, us.getEmail());
			ps.setString(2, us.getPassword());

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				f = false;
				 
				  int id = rs.getInt("id");
				  String name = rs.getString("name");
				  String email = rs.getString("email");
				  String password = rs.getString("password");
				  us.setId(id);
				  us.setName(name);
				  return us;
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	

}
