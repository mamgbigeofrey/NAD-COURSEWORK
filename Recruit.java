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
			String addr=request.getParameter("address");
			String g=request.getParameter("gender");
			String email=request.getParameter("email");
			String tel=request.getParameter("tel");
			String age=request.getParameter("age");
			String pl=request.getParameter("productLine");
			
		
			Statement st = null;
			try {
				
				DBConnection conn = new DBConnection();
				st = conn.getStatement();
				st.executeUpdate("insert into staffRecruit (firstName, lastName, address, gender, email, phone, age, productLine) values('"+f+"', '"+l+"', '"+addr+"', '"+g+"', '"+email+"', '"+tel+"', '"+age+"', '"+pl+"')");
				st.executeUpdate("Update ProductLines SET Number_of_staff = Number_of_staff+1 WHERE productLine='"+pl+"'");
				response.sendRedirect("staffRecruitment.jsp");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				out.println(e.getMessage());
			}


	}


}
