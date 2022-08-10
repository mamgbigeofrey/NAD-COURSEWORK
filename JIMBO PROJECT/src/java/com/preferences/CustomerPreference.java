/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.preferences;

import com.models.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author mwine
 */
@WebServlet(name="CustomerPreference", urlPatterns={"/likes"})
public class CustomerPreference extends HttpServlet {
  
     
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         HttpSession session = request.getSession();
        Product product = (Product)session.getAttribute("p");
        Cookie cookie = new Cookie("prefer",product.getName());
        response.addCookie(cookie);
        
 ArrayList <Product> products = new ArrayList<>();
Cookie [] cookies= null;
         cookies = request.getCookies();
         int j=0;
         
         while(j< cookies.length){
             
             if("shirts".equals(cookie.getValue())){
                 
                 
             }
         
    }
 
}}
