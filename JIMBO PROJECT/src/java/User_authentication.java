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
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.*;

/**
 *
 * @author Hp
 */
public class User_authentication extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            
             try {
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nad_database", "root", "");
                Statement statement=conn.createStatement();
                String username=request.getParameter("username");
                String password=request.getParameter("password");
                
                
                ResultSet rs =statement.executeQuery("select * from useraccount where email='"+username+"' and password='"+password+"'");
               
                if(rs.next()){
                    String name=rs.getString("name");
                    HttpSession session=request.getSession();
                    session.setAttribute("name", name);
                    session.setAttribute("user", username);
                    session.setAttribute("pass", password);

                    response.sendRedirect("pages/user-dashboard/user_dashboard.jsp");
                }
                else{
                    out.println("Incorrect login details. Please try again");
                }
         
            conn.close();
             } catch (SQLException ex) {
                 out.print( ex.getMessage());
             }
        } catch (ClassNotFoundException ex) {
            out.print( ex.getMessage());
        }
        }
    }

    

  


