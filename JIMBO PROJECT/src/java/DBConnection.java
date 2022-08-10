package JAVAFILES;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnection {

	Connection con=null;
	Statement st =null;
	public Statement getStatement() throws ClassNotFoundException, SQLException{
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jimboshopper", "root", "");
		st = con.createStatement();
		return st;
		
		}
}
