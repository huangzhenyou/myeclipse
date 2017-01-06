<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>Insert title here</title>



</head>
<body>
 <form action="jieguo.jsp" method="post">
		<table align="center" border="1" bordercolor="green" >
			<tr>
				<td >
					<input type="text" name="goodsname" size="100" value=""/>
				</td>
				<td>
					
					<input style="background-color:write;color: write" type="submit" value="搜索"/>
					
				</td>
			</tr>
		</table>
	</form>


<%
		
		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		response.setHeader("Content-Type", "text/html; charset=gbk");
		
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/test";
		String userName = "root";
		String userPassword = "123";
		
		
			String goodsname = request.getParameter("goodsname");
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, userName, userPassword);
			Statement stmt = conn.createStatement();
			String sql = "select price,jianjie,src,id from tab_product2 where name='"+goodsname+"'";
			
			ResultSet rs = stmt.executeQuery(sql);
			
			
	//out.println("<table border='1'>");
	//out.println("<tr>");
	
	while (rs.next()) {
		//	out.println("<h1>"+rs.getString(3)+"</h1>");
		//	out.println("<img id ='tu' src='"+rs.getString(3)+"' />");
			out.println("&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
		//	out.println("<h1>"+goodsname+"</h1>");
		//	out.println("<img src = " +rs.getString(3)+" width='300' height='300'>");
			
			out.print("<a href = 'addProduct.jsp?id="+rs.getString(4)+"'> <img src = "+rs.getString(3)+"   width='300' height='300'></a> ");
			out.print("<a href = 'addProduct.jsp?id="+rs.getString(4)+"'> <input type='button'  value='添加入购物车'  ></a>");
			
		//	out.println(rs.getString(3));
		//	out.println(rs.getString(3));
			out.println("&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
		/* 	String ss=rs.getString(1);
			session.setAttribute("imgsrc",ss); */
	}
	
	out.println("</tr>");
	out.println("</table>");
	
	rs.close();
	
	stmt.close();
	conn.close();
	
	
	
	
	
	%>
  	
 
</body>
</html>