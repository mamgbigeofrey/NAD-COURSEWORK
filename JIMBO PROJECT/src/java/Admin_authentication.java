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
//import java.util.logging.Level;
//import java.util.logging.Logger;

/**
 *
 * @author Hp
 */
public class Admin_authentication extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
                ResultSet resultSet=statement.executeQuery("select * from admin");
                String db_email=resultSet.getString("email");
                out.print("i'm running now, please wait");
                String db_password=resultSet.getString("password");
                String form_email=request.getParameter("username");
                String form_password=request.getParameter("password");

          if(form_email.equals(db_email) && form_password.equals(db_password)){
              response.sendRedirect("./pages/user-dashboard/user_dashboard.jsp");
          }
          else{
              out.println("You have either a wrong email or a password");
          }
         // resultSet.close();
         // statement.close();
         // conn.close();
             } catch (SQLException ex) {
                 out.print("can not find database specified" + ex.getMessage());
             }
        } catch (ClassNotFoundException ex) {
            out.print("driver class not found" + ex.getMessage());
        }finally {
                out.println("Database Connection Terminated");
            }
        }
    }

    

  


