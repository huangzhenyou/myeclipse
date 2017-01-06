<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>


<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    
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
  
   <table  border="1" height="80"  width="980" align="center">
  
 <%
		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		response.setHeader("Content-Type", "text/html; charset=gbk");
    if(session.getAttribute("name")!=null){
   %>
   <h4  align="right"> 欢迎<%=session.getAttribute("name") %>光临 </h6><h6 align="right" ><a href="login_out.jsp">退出</a></h4>
   <%
    }else{
    %><h4 align="right">您还未登录，先<a  href="login.html">登录</a></h4>
	<%
    }
    %>
    
 
 
  	<center>
	<img src="images/bg/SYtop.jpg" width="980" height="80" >		
	
		<tr>
		<td width="140" height="500" valign="top">
			<table width="200" align="center" >
				<tr><td>用户管理</td></tr>
				<tr><td></a></td></tr>
				
				<tr><td>商品管理</td></tr>
				<tr><td><a href="addProduct.html">添加采购商品</a></td></tr>
				<tr><td></a></td></tr>
				<hr>
				<tr><td>订单管理</td></tr>
				<tr><td><a href="select.jsp">查看订单</a></td></tr>
				<tr><td><a href="listCart.jsp">购物车</a></td></tr>
			</table>
			<td >
				<table width="750" border="1" align="center" >
			<form action="jieguo.jsp" align="right">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" value="快速搜索您想要的商品"  style="width:400px; height:30px;" >  
			<a href="jieguo.jsp">
			<input type="button" name="goodsname" value="搜索"></form></a>
				
				
		<%	
		
				
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/test";
		String userName = "root";
		String userPassword = "123";
		boolean flag = true;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, userName, userPassword);
			Statement stmt = conn.createStatement();
			String sql = "select name,price,jianjie,src,id from tab_product2;";
			ResultSet rs = stmt.executeQuery(sql);
			out.print("<hr></br>");
			while(rs.next()){
				
		//		out.print("<tr><td>"+rs.getString(4)+"</td>");	//编号
				
		//		out.print("<td>"+rs.getString(3)+"</td>");
		//		out.print("<td>"+rs.getString(2)+"元 </td>");
				out.print("<a href = 'addProduct.jsp?id="+rs.getString(5)+"'> <img src = "+rs.getString(4)+"   width='300' height='300'></a> ");
				out.print(rs.getString(1)+"");
		//		<a href="链接地址"><img src="图片"></a> 
		//		out.print("<td><a href = 'addProduct.jsp?id="+rs.getString(1)+"'><input type = 'button' value = '购买'/></a></td></tr>");
				
			}
			rs.close();
			stmt.close();
			conn.close();
			
			
		} catch (ClassNotFoundException ex) {
			System.out.println(ex.toString());
		} catch (SQLException ex) {
			System.out.println(ex.toString());
		}
 %>
					
				</table>
			
			
			<tr>
			<hr width="73%" size="3" align="center" noshade="red">
			<td height="30" colspan="2" align="center">版权所有限公司</td>
	</table>
			<hr width="73%" size="3" align="center" noshade="red">
	
 
    
    
    
  </body>
</html>
