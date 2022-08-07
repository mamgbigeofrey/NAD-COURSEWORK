/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.*;

/**
 *
 * @author Mamgbi Geofrey
 */
public class StaffRegister extends HttpServlet {

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            
             try {
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nad_database", "root", "");
                String name=request.getParameter("fname");
                String username=request.getParameter("username");
                String email=request.getParameter("email");
                String pword=request.getParameter("password");
                PreparedStatement pstmt=conn.prepareStatement("INSERT useraccount(name,username,email,password) " + "VALUES (?,?,?,?)");
                pstmt.setString(1, name);
                pstmt.setString(2, username);
                pstmt.setString(3, email);
                pstmt.setString(4, pword);
               int i= pstmt.executeUpdate();
                
          if(i>0){
              out.println("Thanks customer!! You have just successifully created a new account with Jimbo ");
          }
          else{
              out.println("OOPs!! An error was encountered while creating your account. Please try again");
          }
                 conn.close();
             } catch (SQLException ex) {
                 out.print("can not find database specified" + ex.getMessage());
             }
        } catch (ClassNotFoundException ex) {
            out.print("driver class not found" + ex.getMessage());
        }
        }
    }

    

  


