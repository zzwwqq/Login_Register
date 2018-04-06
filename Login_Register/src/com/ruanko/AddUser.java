package com.ruanko;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class AddUser {
	private UserInfo userInfo;
	private Connection con;
	//无参构造器
    public AddUser(){
       String JDBC_DRIVER = "com.mysql.jdbc.Driver";
       String DB_USERNAME = "root";
       String DB_PASSWORD = "13450376787zwq";
       String URL="jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8";
       try {
		Class.forName(JDBC_DRIVER);
	con = DriverManager.getConnection(URL, DB_USERNAME, DB_PASSWORD);
       } catch (Exception e) {
		// TODO: handle exception
    	   e.printStackTrace();
	}
       
    }
    
    //Setter方法
    public void setUserInfo(UserInfo userInfo){
    	this.userInfo=userInfo;
    }
    
    
    public UserInfo getUserInfo() {
		return userInfo;
	}

	public Connection getCon() {
		return con;
	}

	//注册
	public void regist() {
		
		
		
		
		
    	String sql = "Insert into userRegister values(?,?)";
    	try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userInfo.getUsername());//给第一个参数赋值
			pstmt.setString(2, userInfo.getPassword());//给第二个参数赋值
			
			pstmt.executeUpdate();//执行该SQL语句
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
    }
       
}
 
