package com.DBMan;

import java.sql.*;
import com.models.*;

public class UserDao {

    private final Connection con;

    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public UserDao(Connection con) {
        this.con = con;
    }
    public boolean userExists(String email){
        User user = null;
         boolean result = false;
        try{
           
            user = new User();
            user.setEmail(email);
            query ="select * from users where email=?";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            while(rs.next()){
                if(rs.getString(email).equals(email)){
                    result = true;
                    break;
                    
                }
            }
            
        }catch (SQLException e) {
            System.out.print(e.getMessage());

        }
        return result;
        
    }

    public boolean userSignUp(String email, String name, String passwd) {
        User user = null;
          boolean result = false;
       
        try {
           

            user = new User();
            user.setEmail(email);
            user.setName(name);
            user.setPassword(passwd);

            query = "insert into users (name,email,password) values (?,?,?)";
            pst = this.con.prepareStatement(query);
            pst.setString(1,name);
            pst.setString(2,email);
            pst.setString(3,passwd);
            
            pst.executeUpdate();
            result = true;
            
        } catch (SQLException e) {
            System.out.print(e.getMessage());

        }
        return result;

    }

    public User userLogin(String email, String password) {
        User user = null;
        try {
            query = "select * from users where email=? and password=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            rs = pst.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        }
        return user;
    }
}
