package com.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class listenerclass implements HttpSessionListener,HttpSessionAttributeListener{
	String username;
	
	public void sessionDestroyed(HttpSessionEvent arg0) {
		
		String url = "jdbc:mysql://localhost:3306/test";
		String userName = "root";
		String userPassword = "123";
		
		HttpSession session = arg0.getSession();
		
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, userName, userPassword);
			Statement stmt = conn.createStatement();
			
		
			Vector<CProduct> vecCart = new Vector<CProduct>();
			Object object = session.getAttribute("cart");
			 username =(String)session.getAttribute("name");
			int i = 0;
			 String sql1 = "select id from tab_cart where username like '"+ username +"';";
			 ResultSet rs = stmt.executeQuery(sql1);
			 while(rs.next()){
					i++;
				}
			 rs.close();
			vecCart = (Vector<CProduct>)object;
			
			for (int p = i;p < vecCart.size(); p++) {
				
				
				String sql = "insert into tab_cart (name,pid,price,num,aaa,bbb,username) values('"+ vecCart.get(p).getPid()+"','"+String.valueOf(vecCart.get(p).getPid())+"', '"+String.valueOf(vecCart.get(p).getPrice())+"', '"+String.valueOf(vecCart.get(p).getNums())+"', '"+vecCart.get(p).isSale()+"', '"+vecCart.get(p).getProvider()+"', '"+username+"')";
				
				stmt.executeUpdate(sql);
			}
			 
			stmt.close();
			conn.close();
			
			System.out.println("OK2");
		} catch (ClassNotFoundException ex) {
			System.out.println(ex.toString());
		} catch (SQLException ex) {
			System.out.println(ex.toString());
		}
	}
	
	
	public void sessionCreated(HttpSessionEvent arg0) {
		
	}


	public void attributeAdded(HttpSessionBindingEvent se) {
		System.out.println("OK1");
		String url = "jdbc:mysql://localhost:3306/test";
		String userName = "root";
		String userPassword = "123";
		
		HttpSession session = se.getSession();
		
		try {
			username = (String) session.getAttribute("name");
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, userName, userPassword);
			Statement stmt = conn.createStatement();
			String sql = "select name,pid,price,num,aaa,bbb,id from tab_cart where username like '"+ username +"';";
			
			ResultSet rs = stmt.executeQuery(sql);
			Vector<CProduct> vecCart = new Vector<CProduct>();

			while(rs.next()){
				String name = rs.getString(1);
				String pid =rs.getString(2);
				String price = rs.getString(3);
				String num =rs.getString(4);
				String issale = rs.getString(5);
				String provider =rs.getString(6);
				
				
				
				
				vecCart.add(new CProduct(Integer.parseInt(pid), name, Integer.parseInt(num),
						Integer.parseInt(price), issale.equals("1"), provider));
				
			}
			
			session.setAttribute("cart", vecCart);	
			
			rs.close();
			
			
			stmt.close();
			conn.close();
			
			System.out.println("OK1");
		} catch (ClassNotFoundException ex) {
			System.out.println(ex.toString());
		} catch (SQLException ex) {
			System.out.println(ex.toString());
		}
		
	}


	public void attributeRemoved(HttpSessionBindingEvent se) {
		// TODO Auto-generated method stub
		
	}


	public void attributeReplaced(HttpSessionBindingEvent se) {
		// TODO Auto-generated method stub
		
	}

	
	

}
