package com.products;

import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.*;
import java.sql.*;

import jakarta.servlet.annotation.MultipartConfig;


/**
* Servlet implementation class Upload
*/
 
@MultipartConfig
public class Upload extends HttpServlet {
private static final long serialVersionUID = 1L;
 
@Override
public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

try ( PrintWriter out = response.getWriter()) {

      String name = request.getParameter("productName");
      String cat1 = request.getParameter("cc");
      String price1 = request.getParameter("price");
      String quantity1 = request.getParameter("quantity");
      Part part = request.getPart("productImage");
       
        String fileName=part.getSubmittedFileName();
        String path = "./product-image/"+fileName;
        InputStream is = part.getInputStream();
        out.println(fileName);
        boolean success = uploadFile(is,path);
        if(success){
           try {
              Class.forName("com.mysql.jdbc.Driver");
         
            try{
      Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jimboshopper","root","");
      Statement st1=conn.createStatement();
 
      String InsertStatement = "insert into products (productName,category, price,image, quantityInStock, Likes) values('"+name+"','"+cat1+"','"+price1+"','"+fileName+"','"+quantity1+"','0')";
   
      st1.executeUpdate(InsertStatement);
 
            }catch(SQLException e) {
                out.println(e);
            }
        } catch (ClassNotFoundException e) {
         out.println(e);
         
     }
           response.sendRedirect("viewProducts.jsp");
            }
        else{
            out.println("error");
        }
     }
 }
public boolean uploadFile(InputStream is,String path)throws ServletException, IOException{
 boolean test=false;
 
     byte[] byt=new byte[is.available()];
     is.read(byt);
     FileOutputStream output=new FileOutputStream(path);
     output.write(byt);
     output.flush();
     output.close();
     
     test = true;
     return test;
 
}

}















 