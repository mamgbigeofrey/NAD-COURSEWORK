
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import java.sql.*;

import java.sql.Statement;
@WebServlet(name = "Recruit", urlPatterns = "/recruit")

public class Recruit extends HttpServlet {

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			PrintWriter out = response.getWriter();
			
			String f=request.getParameter("fName");
			String l=request.getParameter("lName");
			String g=request.getParameter("gender");
			String email=request.getParameter("email");
			String addr=request.getParameter("addresss");
			String age=request.getParameter("age");			
			Statement st = null;
			try { 
				DBConnection conn = new DBConnection();
				st = conn.getStatement();
				st.executeUpdate("insert into staff (firstName, lastName, Age, Gender, address, email) values('"+f+"', '"+l+"', '"+age+"',  '"+g+"', '"+addr+"', '"+email+"' )");
                                request.setAttribute("message","staff's been added susseccfully");
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("staffRecruitment.jsp");
                                requestDispatcher.include(request, response);
                                
                                
			} catch (Exception e) {
				out.println(e.getMessage());
			}


	}


}
