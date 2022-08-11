 
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet(name = "Recriut", urlPatterns = "/allocate")
public class Allocate extends HttpServlet {
	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter w = response.getWriter();
		
		String[] selected =request.getParameterValues("selected");
		int pLine =Integer.parseInt(request.getParameter("choice"));
		String categoryline="";
		int required=0;
		int total_staff= Integer.parseInt(request.getParameter("total"));
//		int allocated=total_staff/3;
		
		int mid_term_staff=(2*total_staff)/7;
		int long_term_staff = 2*mid_term_staff;
		int short_term_staff =long_term_staff/4;
		 int rem=0;
		 int rem1=0;
		Statement st=null;
		DBConnection conn = new DBConnection();

		if(pLine==1||pLine==2) {
			categoryline="SHORT-TERM";
			required=short_term_staff;
		}
		else if(pLine==3) {
			categoryline="MID-TERM";
			required=mid_term_staff;
		}
		else if(pLine==4) {
			categoryline="LONG-TERM";
			required=long_term_staff;
		}
		
		try {
		Statement t= null;
		
		//Number of staff required to manufacture same number of products.
		
		

		 
		 
		 
//			w.println("Allocated Slots for each Line: "+allocated);
			t=conn.getStatement();

			
				t.executeUpdate("update categoryline set productLineID='"+pLine+"', requiredStaff='"+required+"' where lineName='"+categoryline+"'");
			
			
			t.executeUpdate("UPDATE categoryline set slots= '"+required+"' WHERE productLineID='"+pLine+"' AND allocatedStaff='"+0+"'");
//			 if(allocated<=short_term_staff ) {
//			 rem_s1 = short_term_staff - allocated;
//				t.executeUpdate("update productlines set Remaining_Slots='"+rem_s1+"' where productLine='SHORT-TERM' AND Remaining_Slots IS NULL ");
//			 }
//
//			 if(allocated<=mid_term_staff) {
//			 rem_m1=mid_term_staff-allocated;
//			 t.executeUpdate("update productlines set Remaining_Slots='"+rem_m1+"' where productLine='MID-TERM' AND Remaining_Slots IS NULL ");
//			 }
//			 
//			 if(allocated<=long_term_staff ) {
//			 rem_l1=long_term_staff-allocated;
//			 t.executeUpdate("update productlines set Remaining_Slots='"+rem_l1+"' where productLine='LONG-TERM' AND Remaining_Slots IS NULL ");
//			 }
//				
//			 
//			 if(rem_s!=0) {
//				 t.executeUpdate("Update productlines set Remaining_Slots='"+rem_s+"' where productLine='SHORT_TERM'");
//			 }
//			 
//			 if(rem_m!=0) {
//				 t.executeUpdate("Update productlines set Remaining_Slots='"+rem_m+"' where productLine='MID_TERM'");
//			 }
//			 
//			 if(rem_l!=0) {
//				 t.executeUpdate("Update productlines set Remaining_Slots='"+rem_l+"' where productLine='LONG_TERM'");
//			 }
			
			
			

			//}

			 

			//updating product lines and number of staff.
			
//			if(choice.equals("Short-Term")) {
//			if(Integer.parseInt(m)<short_term_staff) {

						
//					}else if(choice.equals("Mid-Term")) {
//						if(Integer.parseInt(m)<mid_term_staff) {
//							st.executeUpdate("Update Staff set Productline='"+choice+"', Status='ACTIVE' WHERE staffID='"+m+"'");
//							st.executeUpdate("Update ProductLines SET Number_of_staff = Number_of_staff+1 WHERE productLine='"+choice+"'");
//
//						}
//					}else {
//						if(Integer.parseInt(m)<long_term_staff) {
//							st.executeUpdate("Update Staff set Productline='"+choice+"', Status='ACTIVE' WHERE staffID='"+m+"'");
//							st.executeUpdate("Update ProductLines SET Number_of_staff = Number_of_staff+1 WHERE productLine='"+choice+"'");
//
//						}
//					}
//				}
				
//				(SELECT staffRequired-Number_of_staff FROM productlines WHERE productLine='"+choice+"') 
				//updating remaining slots

				

				
				
				 
				
				ResultSet s = t.executeQuery("SELECT requiredStaff-allocatedStaff AS Remaining from categoryline where productLineID='"+pLine+"'AND slots IS NOT NULL");
			
				while(s.next()) {
					rem=s.getInt("Remaining");
//					w.println(rem);
				}
					if(rem<=0) {
						String message="No more slots for staff in "+categoryline+".";
						request.setAttribute("message", message);
						RequestDispatcher rr = request.getRequestDispatcher("StaffAllocation.jsp");
						rr.forward(request, response);
					}
				else {
						
						
						
						for(String m:selected) {


							t.executeUpdate("Update Staff set ProductlineID='"+pLine+"', status='ACTIVE' WHERE staffID='"+m+"'");
							t.executeUpdate("Update categoryline SET allocatedStaff = allocatedStaff+1 WHERE productLineID='"+pLine+"'");

								}
						
						ResultSet rs = t.executeQuery("SELECT requiredStaff-allocatedStaff AS Remaining from categoryline where productLineID='"+pLine+"'AND slots IS NOT NULL");
						while(rs.next()) {
							rem1=rs.getInt("Remaining");
							w.println(rem1);
							if(rem1<=0) {
								t.executeUpdate("Update categoryline SET slots = '"+0+"' WHERE productLineID='"+pLine+"'");
								String message="No more slots for staff in "+categoryline+".";
								request.setAttribute("message", message);
								RequestDispatcher rr = request.getRequestDispatcher("StaffAllocation.jsp");
								rr.forward(request, response);	
							}
							else {	
								t.executeUpdate("UPDATE categoryline set slots= '"+rem1+"' WHERE productLineID='"+pLine+"'");						
							}
						}
					}

				
				
				
				
				response.sendRedirect("StaffAllocation.jsp");

//			request.setAttribute("session", session);
//			RequestDispatcher rr = request.getRequestDispatcher("Allocate");
//			rr.forward(request, response);
			
		
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}

}
