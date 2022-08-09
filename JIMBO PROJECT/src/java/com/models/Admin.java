/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.models;

/**
 *
 * @author mwine
 */
public class Admin {
    private String username;
    private String password;
    public void setUsername(String name){
        this.username = name;
        
    }
    
   public  String getUsername (){
        return this.username;
    }
   
      public void setPasswd(String passwd){
        this.password = passwd;
        
    }
      
    public String getPasswd (){
        return this.password;
    }
    
}
