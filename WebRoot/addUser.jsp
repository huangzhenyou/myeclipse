<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>

<%@page import="java.sql.ResultSet"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addInformation.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
<%
  		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/test";
		String userName = "root";
		String userPassword = "123";
		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		response.setHeader("Content-Type", "text/html; charset=gbk");

		
		
	
		
		
		String addname = request.getParameter("addname");
		String addpassword = request.getParameter("addpassword");
		
	

		
		try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(url, userName, userPassword);
					Statement stmt = conn.createStatement();
				//	
				if(!addname.equals("") && !addpassword.equals("")){
				String userSql = "insert into tab_user (addname,addpassword) values ('"+addname+"', '"+addpassword+"')";		
				stmt.executeUpdate(userSql);
	}
				stmt.close();
				conn.close();
				
				out.println("<center>"+"<h1>"+"<font color='green'>×¢²á³É¹¦</font>"+"</h1>"+"</center>");
				response.setHeader("refresh", "2;url=login.html");
		} catch (ClassNotFoundException ex) {
			System.out.println(ex.toString());
		} catch (SQLException ex) {
			System.out.println(ex.toString());
		}
		
 %>

  </body>
</html>
