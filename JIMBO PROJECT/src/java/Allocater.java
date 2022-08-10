 

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Servlet implementation class Allocater
 */
public class Allocater extends Allocate {
		public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String[] selected =request.getParameterValues("selected");
		String choice=request.getParameter("choice");
		Statement st=null;
		DBConnection conn = new DBConnection();
		HttpSession session = (HttpSession) request.getAttribute("session");
		String s1=(String) session.getAttribute("short_term");
		String s2=(String) session.getAttribute("mid_term");
		String s3=(String) session.getAttribute("long_term");
		try {
			st=conn.getStatement();
			out.println(choice);
			for(String m:selected) {
				out.println("Value: " + m);
				if(choice.equals("Short-Term")) {
					if(Integer.parseInt(m)>Integer.parseInt(s1)) {
				st.executeUpdate("Update Staff set Productline='"+choice+"', Status='ACTIVE' WHERE staffID='"+m+"'");
				st.executeUpdate("Update ProductLines SET Number_of_staff = Number_of_staff+1 WHERE productLine='"+choice+"'");

					}
				}else if(choice.equals("Mid-Term")) {
					if(Integer.parseInt(m)>Integer.parseInt(s2)) {
						st.executeUpdate("Update Staff set Productline='"+choice+"', Status='ACTIVE' WHERE staffID='"+m+"'");
						st.executeUpdate("Update ProductLines SET Number_of_staff = Number_of_staff+1 WHERE productLine='"+choice+"'");

					}
				}else {
					if(Integer.parseInt(m)>Integer.parseInt(s3)) {
						st.executeUpdate("Update Staff set Productline='"+choice+"', Status='ACTIVE' WHERE staffID='"+m+"'");
						st.executeUpdate("Update ProductLines SET Number_of_staff = Number_of_staff+1 WHERE productLine='"+choice+"'");

					}
				}
			}
			response.sendRedirect("StaffAllocation.jsp");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		
	}

}
