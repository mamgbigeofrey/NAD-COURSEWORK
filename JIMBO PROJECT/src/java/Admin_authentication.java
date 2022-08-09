/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import com.dbConnection.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.models.*;

/**
 *
 * @author mwine
 */
public class Admin_authentication extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");

            PrintWriter out = response.getWriter();
            
            Connection conn = DbCon.getConnection();
            String query = "select * from admin where username=? and password=?";
            PreparedStatement pst = conn.prepareStatement(query);

            pst.setString(1, request.getParameter("username"));
            pst.setString(2, request.getParameter("password"));
      
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {

                Admin auth = new Admin();
                auth.setUsername(rs.getString("username"));
                auth.setPasswd(rs.getString("password"));
                

                HttpSession session = request.getSession();
                session.setAttribute("auth", auth);
                response.sendRedirect("admin.jsp");
            } else {

                response.sendRedirect("admin_login.jsp");
            }

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Admin_authentication.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
