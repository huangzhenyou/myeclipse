package com.test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.*;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

public class loginServlet extends HttpServlet
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
		
		}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		req.setCharacterEncoding("gbk");
		resp.setCharacterEncoding("gbk");
		resp.setHeader("Content-Type", "text/html; charset=gbk");
		
		 
		String username = req.getParameter("username");
		String userpwd = req.getParameter("userpwd");
		String save = req.getParameter("save");
		

        try
		{
        	String sqlname="";
        	String sqlpassword="";
        	conn.setAutoCommit(false);
        	
        	
			String selectSql = "select addname,addpassword from tab_user";
			rs = stmt.executeQuery(selectSql);
			
			conn.commit();
			conn.setAutoCommit(true);
			
			java.util.List<String> list=new ArrayList<String>();
			
			while(rs.next()){

				list.add(rs.getString(1));
				list.add(rs.getString(2));
			}
			if(list != null && list.size() > 0){
				String[] arr = new String[list.size()];
//				String[] passwordarr = new String[list.size()];
				for(int i=0;i<list.size();i++){
					arr[i] = list.get(i);
				}
				for(int j=0;j<list.size();){
					sqlname=arr[j];
					sqlpassword=arr[j+1];
					j+=2;
//					resp.getWriter().println(sqlname);
//					resp.getWriter().println(sqlpassword);
//					resp.getWriter().println(list.size());
					if(sqlname.equals(username) && sqlpassword.equals(userpwd)){
						req.getSession().setAttribute("name",username);
						req.getSession().setAttribute("password", userpwd);
//						resp.getWriter().println("用户验证成功！！！跳转中~~~<br/>");
						resp.setHeader("refresh", "0;url=success_login.jsp");
						if ("save".equals(save)) {
							Cookie cookie = new Cookie("name",username );
							cookie.setMaxAge(20);
							resp.addCookie(cookie);
							
							cookie = new Cookie("password", userpwd);
							cookie.setMaxAge(20);
							resp.addCookie(cookie);
							break;
						}
					}else if (!sqlname.equals(username) || !sqlpassword.equals(userpwd)) {
//						resp.getWriter().println(sqlname);
//						resp.getWriter().println(sqlpassword);
//						resp.getWriter().println("用户未注册或者密码错误，请注册！<br/>");
//						req.getRequestDispatcher("failed_login.html").forward(req, resp);
						resp.setHeader("refresh", "0;url=failed_login.jsp");
						continue;
					}
					break;
				}
			
			
			}
//			resp.getWriter().println("sqlname"+sqlname);
//			resp.getWriter().println("sqlpassword"+sqlpassword);
			
		} catch (SQLException e){
			resp.getWriter().println(e);
		}catch (Exception e) {
			// TODO: handle exception
		}
		
	}
}
