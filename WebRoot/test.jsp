<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
	function Test(element){
			alert(element.src);	
			window.location.href='test2.jsp?canshu='+element.src;
	}
</script>
</head>
<body>
<%

	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/test";
	String loginUser = "root";
	String loginPassword = "123"; 
	
	Class.forName(driver);
	
	Connection conn = DriverManager.getConnection(url, loginUser, loginPassword);
	
	Statement stmt = conn.createStatement();
	
	String sql = "select src from tab_product2";
	ResultSet rs = stmt.executeQuery(sql);
	
	
	while (rs.next()) {
		
		
//		out.println("<td><input type='password' val='"+rs.getString(3)+"'/></td>");
		//out.println("<td>"+rs.getString(1)+"</td>");
		String src =rs.getString(1);
		out.println("<img src='"+src+"'width='200' height='200' onclick='Test(this)' />");
	/* 	if (rs.getString(4).equals("1")) {
			out.println("<td>Male</td>");
		} else if (rs.getString(4).equals("2")) {
			out.println("<td>Female</td>");
		} else {
			out.println("<td>Unknown</td>");
		}
		
		out.println("<td><a href='W161028_1_removeUser.jsp?name="+rs.getString(2)+"'>remove</a></td>");
		out.println("<td><a href='W161028_1_modifyUser.jsp?name="+rs.getString(2)+"'>modify</a></td>");

		out.println("</tr>");
	}
	out.println("</table>"); */
	}
%>
	
</body>
</html>