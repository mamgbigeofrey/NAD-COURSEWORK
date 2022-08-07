/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import com.DBMan.*;
//import com.models.*;
import com.dbConnection.*;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mwine
 */
public class SIgnUpServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String signupEmail = request.getParameter("email");
            String username = request.getParameter("username");
//            String passwd1 = request.getParameter("password");
            String passwd2 = request.getParameter("confirm-password");
            UserDao dao = new UserDao(DbCon.getConnection());
            if(dao.userExists(signupEmail)){
                out.print("USer already exits");
                response.sendRedirect("user_login.jsp");
            }
            else{
                dao.userSignUp(signupEmail, username, passwd2);
                response.sendRedirect("user_login.jsp");
            }
            
            
            
            
            

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SIgnUpServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SIgnUpServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
