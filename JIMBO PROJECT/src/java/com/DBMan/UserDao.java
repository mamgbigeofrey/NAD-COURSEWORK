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
           if(rs.next()){
               return true;
           }
            
        }catch (SQLException e) {
            System.out.print(e.getMessage());

        }
        return result;
        
    }

    public boolean userSignUp(String firstName, String lastName, String email,String address,String gender,String passwd,int age) {
        User user = null;
        boolean result = false;
       
        try {

            user = new User();
            user.setEmail(email);
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setAddress(address);
            user.setGender(gender);
            user.setPassword(passwd);
            user.setAge(age);

            query = "insert into users (firstName,lastName,email,address,gender,password,age) values (?,?,?,?,?,?,?)";
            pst = this.con.prepareStatement(query);
            pst.setString(1,firstName);
            pst.setString(2,lastName);
            pst.setString(3,email);
            pst.setString(4,address);
            pst.setString(5,gender);
            pst.setString(6,passwd);
            pst.setInt(7,age);
            if(pst.executeUpdate()== 1){
                 result = true;
                
            }else{
                return false;
            }
            
            
           
            
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
                user.setId(rs.getInt("userID"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setEmail(rs.getString("email"));
                user.setGender(rs.getString("gender"));
                user.setAge(rs.getInt("age"));
                user.setAddress(rs.getString("address"));
             }
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        }
        return user;
    }
}
