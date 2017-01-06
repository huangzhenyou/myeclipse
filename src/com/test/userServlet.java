package com.test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class userServlet extends HttpServlet
{
	
	
	public void init() throws ServletException {
		System.out.println("init");

		super.init();
	}
	
	protected String driver;
	protected String url;
	protected String loginUser;
	protected String loginPassword;

	protected Connection conn = null;
	protected Statement stmt = null;
	protected ResultSet rs = null;

	protected boolean openConnect() {
	    try {	
			Class.forName(driver);
			
			conn = DriverManager.getConnection(url, loginUser, loginPassword);
			
			stmt = conn.createStatement();
			
			//stmt.close();
			//conn.close();
			return true;
		} catch (ClassNotFoundException ex) {

		} catch (SQLException ex) {

		}
		
		return false;
	}
	
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init with config");

		driver = config.getInitParameter("driver");
		url = config.getInitParameter("url");
		loginUser = config.getInitParameter("user");
		loginPassword = config.getInitParameter("password");
		
		openConnect();

		super.init(config);
	}

	protected void service(HttpServletRequest arg0, HttpServletResponse arg1)
	throws ServletException, IOException {
			System.out.println("service");
			super.service(arg0, arg1);
			if (arg0.getMethod().toLowerCase().equals("get")) {
				doGet(arg0, arg1);
			} else {
				doPost(arg0, arg1);
			}
		}
		
		protected ResultSet executeSql(String sql, boolean updateFlag) {
			try {
				if (updateFlag) {
					stmt.executeUpdate(sql);
					return null;
				} else {
					return stmt.executeQuery(sql);
				}
			} catch (SQLException e) {
				System.out.println("3");
				e.printStackTrace();
			}
		return null;
		}

		protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
			req.setCharacterEncoding("gbk");
			resp.setCharacterEncoding("gbk");
			resp.setHeader("Content-Type", "text/html; charset=gbk");
//			System.out.println("doGet: 数据入库成功!!!");
//			resp.getWriter().println("doGet:  数据入库成功!!!");
//			String pid=req.getParameter("pid");
//			String name=req.getParameter("name");
//			String nums=req.getParameter("nums");
//			String price=req.getParameter("price");
//			String sale=req.getParameter("sale");
//			String provider=req.getParameter("provider");
//			
//			String sql = "insert into tab_product (pid, name, nums, price, sale, provider) values ("+pid+", '"+name+"', "+nums+", "+price+", '"+sale+"', '"+provider+"')";
//			executeSql(sql, true);
		}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		req.setCharacterEncoding("gbk");
		resp.setCharacterEncoding("gbk");
		resp.setHeader("Content-Type", "text/html; charset=gbk");
		
		try{
			String addname = req.getParameter("addname");
			String addpassword = req.getParameter("addpassword");
			
			
			resp.getWriter().println(addname);
			resp.getWriter().println(addpassword);
			
			if(!addname.equals("") && !addpassword.equals("")){
				String userSql = "insert into tab_user (addname,addpassword) values ('"+addname+"', '"+addpassword+"')";
				executeSql(userSql, true);
				resp.getWriter().println("注册成功！请登录！");
				resp.setHeader("refresh", "3;url=login.html");
			}else{
				if(addname.equals("") && addpassword.equals("")){
					resp.getWriter().println("输入账户和密码均为空！注册失败！请重新注册！");
					resp.setHeader("refresh", "3;url=addUser.html");
				}else if(addname.equals("") ){
					resp.getWriter().println("输入账户为空！注册失败！请重新注册！");
					resp.setHeader("refresh", "3;url=addUser.html");
				}else if(addpassword.equals("")){
					resp.getWriter().println("输入密码为空！注册失败！请重新注册！");
					resp.setHeader("refresh", "3;url=addUser.html");
				}
					
			}
		}catch (Exception e) {
			resp.getWriter().println("注册失败！请重新注册！");
			resp.setHeader("refresh", "3;url=login.html");
		}
		
	}
}
