<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.test.CProduct"%>
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

		Vector<CProduct> vecCart = null;
		Object object = session.getAttribute("cart");
		if (object == null) {
			out.println("no product in cart");
			response.setHeader("refresh", "1;url=listCart.jsp");
			return;
		}
	
		vecCart = (Vector<CProduct>)object;
		String pids[] = request.getParameterValues("pid");
		
		String name = request.getParameter("customer");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
	

		
		try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(url, userName, userPassword);
					Statement stmt = conn.createStatement();
				for (String pid : pids) {
					for (CProduct p : vecCart) {
						if(!pid.equals(String.valueOf(p.getPid()))) {
						continue;
						}
						String sql = "insert into tab_user123(number, name, count, money, aaa, bbb,pname) values ('"+p.getPid()+"','"+p.getName()+"','"+p.getNums()+"','"+p.getPrice()+"','"+(p.isSale() ? "是" : "否")+"','"+p.getProvider()+"','"+name+"');";
						stmt.executeUpdate(sql);
						
						
						
					}
				}			
    			String sql1 = "insert into tab_buyer (name, phone, adress) values ('"+name+"','"+phone+"','"+address+"');";
				stmt.executeUpdate(sql1);
    			
				stmt.close();
				conn.close();
				
				out.println("<center>"+"<h1>"+"<font color='green'>下单成功</font>"+"</h1>"+"</center>");
				response.setHeader("refresh", "2;url=select.jsp");
		} catch (ClassNotFoundException ex) {
			System.out.println(ex.toString());
		} catch (SQLException ex) {
			System.out.println(ex.toString());
		}
		
 %>

  </body>
</html>
