 
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*
;/**
 * Servlet implementation class ButtonReallocate
 */
public class ButtonReallocate extends HttpServlet {

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter w = response.getWriter();
		Statement st=null;
		DBConnection conn = new DBConnection();
		try {
			st=conn.getStatement();
			//count for all employees;
			int totalStaff=0;
			ResultSet rs = st.executeQuery("SELECT COUNT(staffID) as totalStaff FROM staff");
			
			while(rs.next()){                
                totalStaff = rs.getInt("totalStaff");  
                
              }
			int month = Integer.parseInt(request.getParameter("month"));
			w.println("MONTH : "+month+ "STAFF: "+totalStaff);
			
			//Getting sum from all product lines
			int Tsale1=0;
			int Tsale2=0;
			int Tsale3=0;
			int Tsale4=0;
			int grandSales=0;
			for(int i=1; i<5; i++) {
				ResultSet r = st.executeQuery("SELECT SUM(sales) as totalSales from sales WHERE EXTRACT(MONTH FROM date)='"+month+"' AND productLineID ='"+i+"' ");
				
				if(i==1) {
					while(r.next()) {
						Tsale1=r.getInt("totalSales");
					}
				}
				
				if(i==2) {
					while(r.next()) {
						Tsale2=r.getInt("totalSales");
					}
				}
				
				if(i==3) {
					while(r.next()) {
						Tsale3=r.getInt("totalSales");
					}
				}
				
				if(i==4) {
					while(r.next()) {
						Tsale4=r.getInt("totalSales");
					}
				}
				
			}
			grandSales=Tsale4+Tsale3+Tsale2+Tsale1;
			w.println("Total monthly Sales  = " + grandSales);			
			
			   float ApproximateStaff1 = ((float)Tsale1/grandSales)*totalStaff;
			   float ApproximateStaff2 = ((float)Tsale2/grandSales)*totalStaff;
			   float ApproximateStaff3 = ((float)Tsale3/grandSales)*totalStaff;
			   float ApproximateStaff4 = ((float)Tsale4/grandSales)*totalStaff;
			   w.println("Total monthly Staff1  = " +ApproximateStaff1);
			   w.println("Total monthly Staff2  = " +ApproximateStaff2);
			   w.println("Total monthly Staff3  = " +ApproximateStaff3);
			   w.println("Total monthly Staff4  = " +ApproximateStaff4);
			   
			   
			    ArrayList<Float> ApproxStaff_list = new ArrayList<Float>(Arrays.asList(ApproximateStaff1,ApproximateStaff2,ApproximateStaff3,ApproximateStaff4));
			    w.println("This is the list of Approximate employees "+ApproxStaff_list);
			    
//			    Get highest priority line and least priority line
			  float highPriority = Collections.max(ApproxStaff_list);
			    
			   w.println("Approximate employees: " + ApproximateStaff1+","+ApproximateStaff2+","+ApproximateStaff3+","+ApproximateStaff4 );
			   int newNumberEmployees = Math.round(ApproximateStaff1)+Math.round(ApproximateStaff2)+Math.round(ApproximateStaff3)+Math.round(ApproximateStaff4);
			   //out.println("New number of employees " + newNumberEmployees);
			   
			   int finalStaff1 = Math.round(ApproximateStaff1);
			   int finalStaff2 = Math.round(ApproximateStaff2);
			   int finalStaff3 = Math.round(ApproximateStaff3);
			   int finalStaff4 = Math.round(ApproximateStaff4);
			   
			   
			    HashMap<Float,Integer> priorityMap = new HashMap<Float,Integer>();
			    priorityMap.put(ApproximateStaff1,1);
			    priorityMap.put(ApproximateStaff2,2);
			    priorityMap.put(ApproximateStaff3,3);
			    priorityMap.put(ApproximateStaff4,4);
			 
			    if(priorityMap.get(highPriority) == 1){
			            finalStaff1 = finalStaff1+1;            
			     }
			     else if(priorityMap.get(highPriority) == 2 ){
			            finalStaff2 = finalStaff2+1;
	            }
			     else if(priorityMap.get(highPriority) == 3 ){
			            finalStaff3 = finalStaff3+1;
	            }            
			            else{
			            finalStaff4 = finalStaff4+1;     
	            }
			   w.println();
			   w.println();
			   
			   w.println("Total monthly Staff1  = " +finalStaff1);
			   w.println("Total monthly Staff2  = " +finalStaff2);
			   w.println("Total monthly Staff3  = " +finalStaff3);
			   w.println("Total monthly Staff4  = " +finalStaff4);
			   
			    
			    ArrayList<Integer> staffID1 = new ArrayList<Integer>();
			    ArrayList<Integer> staffID2 = new ArrayList<Integer>();
			    ArrayList<Integer> staffID3 = new ArrayList<Integer>();
			    ArrayList<Integer> staffID4 = new ArrayList<Integer>();
			      
			    
			    
			    			    
			    if(newNumberEmployees==totalStaff){
			    
				    ResultSet productline1 = st.executeQuery("SELECT StaffID FROM staff ORDER BY StaffID Limit " +finalStaff1+ " Offset 0");
		              
		              while(productline1.next()){                
		                int staffId_1 = productline1.getInt("StaffID");                 
		                staffID1.add(staffId_1);                                     
		            } 
		            w.println("staffID1"+staffID1); 
		            
		            //Skip the first two and get the one staff ID to be assigned to product line 2
		             ResultSet productline2 = st.executeQuery("SELECT StaffID FROM staff ORDER BY StaffID Limit " +finalStaff2+ " Offset "+ finalStaff1+"");
		             
		              while(productline2.next()){                
		                int staffId_2 = productline2.getInt("StaffID");                 
		                staffID2.add(staffId_2);                                     
		            } 
		              w.println("staffID2"+staffID2);
		               
		            
		            //Skip the first 3, get next 2 staff IDs for PL3;
		            ResultSet productline3 = st.executeQuery("SELECT StaffID FROM staff ORDER BY StaffID Limit "+finalStaff3+" Offset " +(finalStaff1+finalStaff2)+"");
		             
		              while(productline3.next()){                
		                int staffId_3 = productline3.getInt("StaffID");                 
		                staffID3.add(staffId_3);                                     
		            } 
		              w.println("staffID3"+staffID3);  
		            
		            //Skip the first 5, get next 5 staff IDs for PL4;
		            ResultSet productline4 = st.executeQuery("SELECT StaffID FROM staff ORDER BY StaffID Limit "+finalStaff4+ " Offset "+ (finalStaff1+finalStaff2+finalStaff3)+"");
		             
		              while(productline4.next()){                
		                int staffId_4 = productline4.getInt("StaffID");                 
		                staffID4.add(staffId_4);                                     
		            } 
		              w.println("staffID4"+staffID4);
		    }         
	        
//	            CASE WHEN ITS LESS BY ONE, ADD ONE EMPLOYEE TO HIGHEST PRIORITY PL
	            
			    else if(newNumberEmployees<totalStaff){
			    	
			    	ResultSet productline1 = st.executeQuery("SELECT StaffID FROM staff ORDER BY StaffID Limit " +finalStaff1+ " Offset 0");
		              
		              while(productline1.next()){                
		                int staffId_1 = productline1.getInt("StaffID");                 
		                staffID1.add(staffId_1);                                     
		            } 
		            w.println(staffID1); 
		            
		            //Skip the first two and get the one staff ID to be assigned to product line 2
		             ResultSet productline2 = st.executeQuery("SELECT StaffID FROM staff ORDER BY StaffID Limit " +finalStaff2+ " Offset "+ finalStaff1+"");
		             
		              while(productline2.next()){                
		                int staffId_2 = productline2.getInt("StaffID");                 
		                staffID2.add(staffId_2);                                     
		            } 
		            w.println(productline2);    
		            
		            //Skip the first 3, get next 2 staff IDs for PL3;
		            ResultSet productline3 = st.executeQuery("SELECT StaffID FROM staff ORDER BY StaffID Limit "+finalStaff3+" Offset " +(finalStaff1+finalStaff2)+"");
		             
		              while(productline3.next()){                
		                int staffId_3 = productline3.getInt("StaffID");                 
		                staffID3.add(staffId_3);                                     
		            } 
		            w.println(productline3);   
		            
		            //Skip the first 5, get next 5 staff IDs for PL4;
		            ResultSet productline4 = st.executeQuery("SELECT StaffID FROM staff ORDER BY StaffID Limit "+finalStaff4+ " Offset "+ (finalStaff1+finalStaff2+finalStaff3)+"");
		             
		              while(productline4.next()){                
		                int staffId_4 = productline4.getInt("StaffID");                 
		                staffID4.add(staffId_4);                                     
		            } 
		            w.println(productline4); 
			    	
			    }
			    
			    
			    
			    else{
		            w.println("There's an error");
		            }
		            
			    
			    
	            int nLine1=0;
	            int nLine2=0;
	            int nLine3=0;
	            int nLine4=0;
	            // Assign product line 1 staff
	            while(nLine1<staffID1.size()){
	                st.executeUpdate("UPDATE staff SET productLineID = '1' WHERE StaffID = '"+ staffID1.get(nLine1)+"'");           
	                nLine1++;
	            }
	            
	            //Assign product line 2 staff
	            while(nLine2<staffID2.size()){
	                st.executeUpdate("UPDATE staff SET productLineID = '2' WHERE StaffID = '"+ staffID2.get(nLine2)+"'");           
	                nLine2++;
	            }
	            
	            //Assign product line 3 staff
	            while(nLine3<staffID3.size()){
	                st.executeUpdate("UPDATE staff SET productLineID = '3' WHERE StaffID = '"+ staffID3.get(nLine3)+"'");           
	                nLine3++;
	            }
	            
	            //Assign product line 4 staff
	            while(nLine4<staffID4.size()){
	                st.executeUpdate("UPDATE staff SET productLineID = '4' WHERE StaffID = '"+ staffID4.get(nLine4)+"'");           
	                nLine4++;
	            }  
			
	            
	            
	            //updating categoryline table
	            int id=0;
	            int count=0;
	            int count1=0;
	            int count2=0;
	            int count3=0;
	            int count4=0;
	            
	            	ResultSet result1=st.executeQuery("Select count(staffID) as count from staff where productLineID='1'");
	            	while(result1.next()) {
	            		 count1=result1.getInt("count");
	            	}
	            	ResultSet result2=st.executeQuery("Select count(staffID) as count from staff where productLineID='1'");
	            	while(result2.next()) {
	            		 count2=result2.getInt("count");
	            	}
	            	ResultSet result3=st.executeQuery("Select count(staffID) as count from staff where productLineID='1'");
	            	while(result3.next()) {
	            		 count3=result3.getInt("count");
	            	}
	            	ResultSet result4=st.executeQuery("Select count(staffID) as count from staff where productLineID='1'");
	            	while(result4.next()) {
	            		 count4=result4.getInt("count");
	            	}
	            	
	            	for(int i=1; i<5; i++) {
	            		if(i==1) {
	            			count=count1;
	            			id=1;
	            		}
	            		if(i==2) {
	            			count=count2;
	            			id=2;
            			}
	            		if(i==3) {
	            			count=count3;
	            			id=3;
	            		}
	            		if(i==4) {
	            			count=count4;
	            			id=4;
	            		}
	            		st.executeUpdate("UPDATE categoryline SET allocatedStaff='"+count+"' WHERE productLineID='"+id+"'");
	            	}
	            	
	            
	            
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
