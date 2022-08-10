package com.DBMan;

import java.sql.*;
import java.util.*;

import com.models.Cart;
import com.models.Product;

public class ProductDao {

    private Connection con;

    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public ProductDao(Connection con) {
//		super();
        this.con = con;
    }

    public List<Product> getProductsByCategory(String productCategory) {
        List<Product> book1 = new ArrayList<>();
        try {
            query = "select * from products where category =?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, "category");
            rs = pst.executeQuery();
            while (rs.next()) {
                Product row = new Product();
                row.setId(rs.getInt("productID"));
                row.setName(rs.getString("productName"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));

                book1.add(row);

            }

        } catch (SQLException e) {
            System.out.println("SQL exception " + e.getMessage());
        }

        return book1;
    }

    public List<Product> getAllProducts() {
        List<Product> book = new ArrayList<>();
        try {

            query = "select * from products";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
                Product row = new Product();
                row.setId(rs.getInt("ProductID"));
                row.setName(rs.getString("productName"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));

                book.add(row);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        }
        return book;
    }
    void updateProductQuantity(int pID) throws SQLException{
        query = "select * from products where productID =?";
        pst = this.con.prepareStatement(query);
        pst.setInt(1,pID);
        rs = pst.executeQuery();
        if(rs.next()){
            int dbQuantity = rs.getInt("quantity");
            if(dbQuantity>0){
                String query2 ="update products set quantity=? where productID=?";
                PreparedStatement pst2 =this.con.prepareStatement(query2);
//                pst2.setInt(1,(dbQuantity -))
                
                
            }
         }
    
}

    public Product getSingleProduct(int id) {
        Product row = null;
        try {
            query = "select * from products where productID=? ";

            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();

            while (rs.next()) {
                row = new Product();
                row.setId(rs.getInt("productID"));
                row.setName(rs.getString("productName"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return row;
    }

    public double getTotalCartPrice(ArrayList<Cart> cartList) {
        double sum = 0;
        try {
            if (!cartList.isEmpty()) {
                for (Cart item : cartList) {
                    query = "select price from products where productID=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        sum += rs.getDouble("price") * item.getQuantity();
                    }

                }
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return sum;
    }

    public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
        List<Cart> book = new ArrayList<>();
        try {
            if (!cartList.isEmpty()) {
                for (Cart item : cartList) {
                    query = "select * from products where productID=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Cart row = new Cart();
                        row.setId(rs.getInt("productID"));
                        row.setName(rs.getString("productName"));
                        row.setCategory(rs.getString("category"));
                        row.setPrice(rs.getDouble("price") * item.getQuantity());
                        row.setQuantity(item.getQuantity());
                        book.add(row);
                    }

                }
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return book;
    }
}
