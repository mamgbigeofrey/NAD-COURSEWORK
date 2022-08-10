package JAVAFILES;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import java.sql.*;

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
				
				st.executeUpdate("insert into Staff (firstName, lastName, Age, Gender, address, email) values('"+f+"', '"+l+"', '"+age+"',  '"+g+"', '"+addr+"' '"+email+"' )");
				response.sendRedirect("staffRecruitment.jsp");
			} catch (Exception e) {
				out.println(e.getMessage());
			}


	}


}
