<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
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
    
    <title>My JSP 'test2.jsp' starting page</title>
    
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
           /*      String value=request.getParameter("canshu");
                String newstr=value.substring(value.length()-13,value.length());
				out.println(newstr);
				out.println("<img src='"+newstr+"'width='200' height='200'/>"); */
      
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
			
			while(rs.next()){
				
		//		out.print("<tr><td>"+rs.getString(4)+"</td>");	//±àºÅ
				
		//		out.print("<td>"+rs.getString(3)+"</td>");
		//		out.print("<td>"+rs.getString(2)+"Ôª </td>");
				out.print("<tr><td>"+"<a href = 'addProduct.jsp?id="+rs.getString(5)+"'> <img src = "+rs.getString(4)+"   width='300' height='300'></a> </td></tr>");
				out.print("<tr><td>"+rs.getString(1)+"</td></tr>");
		//		<a href="Á´½ÓµØÖ·"><img src="Í¼Æ¬"></a> 
		//		out.print("<td><a href = 'addProduct.jsp?id="+rs.getString(1)+"'><input type = 'button' value = '¹ºÂò'/></a></td></tr>");
				
			}
			rs.close();
			stmt.close();
			conn.close();
			
			System.out.println("OK");
		} catch (ClassNotFoundException ex) {
			System.out.println(ex.toString());
		} catch (SQLException ex) {
			System.out.println(ex.toString());
		}
 %>
  </body>
</html>
