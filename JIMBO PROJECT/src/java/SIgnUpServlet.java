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
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mwine
 */
@WebServlet(name = "SignUpServlet", urlPatterns = "/sign-up")
public class SignUpServlet extends HttpServlet {

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
            String passwd1 = request.getParameter("password");
            String passwd2 = request.getParameter("confirm-password");
            
//            if(!(passwd1.compare(passwd2))){
//                request.setAttribute("passwderror","Please make sure your passwords match!");
//                RequestDispatcher requestDispatcher = request.getRequestDispatcher("sign-up.jsp");
//                requestDispatcher.include(request, response);
////                response.sendRedirect("sign-up.jsp");
//            }
            
            UserDao dao = new UserDao(DbCon.getConnection());
            if(dao.userExists(signupEmail)){
                
                response.sendRedirect("user_login.jsp");
            }
            else{
                dao.userSignUp(signupEmail, username, passwd2);
                response.sendRedirect("user_login.jsp");
            }
            
             
            
            

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SignUpServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SignUpServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
