package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import Model.User;

public class UserDao {
private Connection con;
private String query;
private PreparedStatement pst;
private ResultSet rs;

public UserDao(Connection con) {
	super();
	this.con = con;
}

public User userlogin(String email,String password){
	User user=null;
	try{
		query="select * from users where email=? and password=?";
		pst = this.con.prepareStatement(query);
		pst.setString(1, email);
		pst.setString(2, password);
		rs= pst.executeQuery();
		if(rs.next()){
			 user= new User();
			 user.setId(rs.getInt("id"));
			 user.setName(rs.getString("name"));
			 user.setEmail(email);
		}
		
	}catch(Exception e){
		e.printStackTrace();
		System.out.print(e.getMessage());
	}
	return user;
}

public boolean addUser(int id, String name, String email, String password) {
	boolean isAdded = false;
    PreparedStatement pst = null;
    try {
        String query = "INSERT INTO users (id, name, email, password) VALUES (?, ?, ?, ?)";
        pst = this.con.prepareStatement(query);
        pst.setInt(1, id);
        pst.setString(2, name);
        pst.setString(3, email);
        pst.setString(4, password);

        int rowsAffected = pst.executeUpdate();
        isAdded = rowsAffected > 0;
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (pst != null) {
            try {
                pst.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    return isAdded;
}
public List<User> getAllUsers() {
    List<User> users = new ArrayList<>();
    String query = "SELECT * FROM users";
    try (PreparedStatement pst = this.con.prepareStatement(query);
         ResultSet rs = pst.executeQuery()) {

        while (rs.next()) {
            User user = new User();
            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
            users.add(user);
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }
    return users;
}

public boolean deleteUserById(int id) {
    boolean isDeleted = false;
    String query = "DELETE FROM users WHERE id=?";
    try (PreparedStatement pst = this.con.prepareStatement(query)) {
        pst.setInt(1, id);
        int rowsAffected = pst.executeUpdate();
        isDeleted = rowsAffected > 0;
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return isDeleted;
}}