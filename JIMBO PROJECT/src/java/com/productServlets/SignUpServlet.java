package com.productServlets;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import com.DBMan.*;
//import com.models.*;
import com.dbConnection.*;
import jakarta.servlet.RequestDispatcher;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mwine
 */
@WebServlet(name = "SignUpServlet", urlPatterns = "/sign-up")
public class SignUpServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String signupEmail = request.getParameter("email");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            int age = Integer.parseInt(request.getParameter("age"));
            String passwd1 = request.getParameter("password");
            String passwd2 = request.getParameter("confirm-password");
            String address = request.getParameter("address");
            String gender = request.getParameter("gender");
            
            Connection conn = DbCon.getConnection();
            String query = "select * from users where email=?";
            PreparedStatement pst = conn.prepareStatement(query);

            pst.setString(1, request.getParameter("email"));
      
            ResultSet rs = pst.executeQuery();
            
            

            if(!(passwd1.equals(passwd2))) {
                request.setAttribute("password3rror" , "Your two passwords do not match");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("sign-up.jsp");
                    requestdispatcher.include(request, response);
              
                
                
               // break;
                
            }
            if(rs.next()){
                request.setAttribute("passworderror" , "A user with this account already exists!!");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("sign-up.jsp");
                    requestdispatcher.include(request, response);
            }

            else { UserDao dao = new UserDao(DbCon.getConnection());
                if (dao.userExists(signupEmail)) {
                    response.sendRedirect("user_login.jsp");
                } else {
                    
                    dao.userSignUp(firstName, lastName, signupEmail, address, gender, passwd2, age);
                    request.setAttribute("signUpSucess", "Account was created sucessfully, you can log in!");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("user_login.jsp");
                    requestdispatcher.include(request, response);
                    
                     
                }
            

             } 
        }
        catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SignUpServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
