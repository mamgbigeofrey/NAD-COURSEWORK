 
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
import java.time.LocalDate;
import java.util.*
;/**
 * Servlet implementation class AutoReallocate
 */
public class AutoReallocate extends HttpServlet {

   

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter w = response.getWriter();
		Statement st=null;
		DBConnection conn = new DBConnection();
		
		try {
			st=conn.getStatement();
			LocalDate current = LocalDate.now();
		    int currentMonth = current.getMonthValue();
		    
		    LocalDate previousMonth = LocalDate.now().minusMonths(1);
		    int PrevMonth = previousMonth.getMonthValue();
		    w.println("This month - " + currentMonth);
		    w.println("Last Month - " + PrevMonth);
			
		    //For all ProductLines
		    ArrayList<Integer> CurrentsalesfromPL1 = new ArrayList<Integer>();
		    ArrayList<Integer> PrevioussalesfromPL1 = new ArrayList<Integer>();
		    ArrayList<Integer> CurrentID = new ArrayList<Integer>();
		    ArrayList<Integer> PreviousID = new ArrayList<Integer>();
		    //current month
		    ResultSet result = st.executeQuery("SELECT s.sales, p.productLine_id FROM sales AS s JOIN productline as p ON s.productlineID=p.productLine_id WHERE EXTRACT(MONTH FROM s.date)='"+currentMonth+"'");
		    while(result.next()){
		        int sales = result.getInt("sales");
		        CurrentsalesfromPL1.add(sales);
		        int ID1 = result.getInt("productLine_id");
		        CurrentID.add(ID1);
		        
		        }
		    //previous month
		    ResultSet result1 = st.executeQuery("SELECT s.sales, p.productLine_id FROM sales AS s JOIN productline as p ON s.productlineID=p.productLine_id WHERE EXTRACT(MONTH FROM s.date)='"+PrevMonth+"'");
		    while(result1.next()){
		    int sales1 = result1.getInt("sales");
		    PrevioussalesfromPL1.add(sales1);
		    int ID = result1.getInt("productLine_id");
		    PreviousID.add(ID);
		    }
		    //sum
		    int TCurrentSales1=0;
		    int TPreviousSales1=0;
		    int TCurrentSales2=0;
		    int TPreviousSales2=0;
		    int TCurrentSales3=0;
		    int TPreviousSales3=0;
		    int TCurrentSales4=0;
		    int TPreviousSales4=0;
		    
		    for(int i=0; i<CurrentsalesfromPL1.size(); i++) {
		    	    	if(CurrentID.get(i)==1) {
		    		TCurrentSales1+=CurrentsalesfromPL1.get(i);	
		    	}
		    	     	if(CurrentID.get(i)==2) {
				    		TCurrentSales2+=CurrentsalesfromPL1.get(i);	
				    	}
		    	     	if(CurrentID.get(i)==3) {
				    		TCurrentSales3+=CurrentsalesfromPL1.get(i);	
				    	}
		    	     	if(CurrentID.get(i)==4) {
				    		TCurrentSales4+=CurrentsalesfromPL1.get(i);	
				    	}
		    }
		    
		    for(int i=0; i<PrevioussalesfromPL1.size(); i++) {
    	    	if(PreviousID.get(i)==1) {
	    		TPreviousSales1+=PrevioussalesfromPL1.get(i);	
	    	    }
    	     	if(PreviousID.get(i)==2) {
		    		TPreviousSales2+=PrevioussalesfromPL1.get(i);	
		    	}
    	     	if(PreviousID.get(i)==3) {
		    		TPreviousSales3+=PrevioussalesfromPL1.get(i);	
		    	}
    	     	if(PreviousID.get(i)==4) {
		    		TPreviousSales4+=PrevioussalesfromPL1.get(i);	
		    	}
		    }
		    
		    //change in sales;
		    int change1=TCurrentSales1-TPreviousSales1;
		    int change2=TCurrentSales2-TPreviousSales2;
		    int change3=TCurrentSales3-TPreviousSales3;
		    int change4=TCurrentSales4-TPreviousSales4;
		    ArrayList<Integer> changes = new ArrayList<Integer>();
		    changes.add(change1);
		    changes.add(change2);
		    changes.add(change3);
		    changes.add(change4);
		    //finding minimum and maximum
		    int minimum = Collections.min(changes);
		    int maximum = Collections.max(changes);
		    
		    HashMap<Integer,Integer> changeMap = new HashMap<Integer,Integer>();
		    changeMap.put(change1,1);
		    changeMap.put(change2,2);
		    changeMap.put(change3,3);
		    changeMap.put(change4,4);
		    
		    int lowDemand= changeMap.get(minimum);
		    int highDemand= changeMap.get(maximum);
		    
		    //swap from line of low demand to high demand
		    ArrayList<String> staffIDS_lowDemand = new ArrayList<String>();
		    ResultSet r= st.executeQuery("SELECT StaffID FROM staff WHERE productLineID ='"+lowDemand+"'");
		    
            while(r.next()){                
                String Ids = r.getString("StaffID");                 
              staffIDS_lowDemand.add(Ids);                                     
            } 
            
		    int n = 1;      
		    while(n<staffIDS_lowDemand.size()){
                st.executeUpdate("UPDATE staff SET productLineID = '"+highDemand+"' WHERE StaffID = '"+ staffIDS_lowDemand.get(n)+"'");           
                n++;
            }
		    
		    
		    w.println("IDS for low demand; "+staffIDS_lowDemand);
		    
		    
		    w.println("CHANGEMAP; "+changeMap);
		    
		    w.println("The min is "+ minimum + "The max is " + maximum);
		    
		   w.println("      Change in 1: " + change1);
		    w.println("      Change in 2 :" + change2);
		    w.println("       Change in 3 :  " + change3);
		    w.println("      Change in 4 :" + change4);
		    w.println(changes);
//		    w.println(TCurrentSales1);
//		    w.println(TCurrentSales2);
//		    w.println(TCurrentSales3);
//		    w.println(TCurrentSales4);
//		    w.println("This is the current: " +CurrentsalesfromPL1 );
//		    w.println("This is the current ID: " +CurrentID );
//		    w.println("This is the previous: " +PrevioussalesfromPL1 );
		    
		    
		    
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
