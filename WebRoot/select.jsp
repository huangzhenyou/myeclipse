<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'select.jsp' starting page</title>
    
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
		String username = (String)session.getAttribute("name");
		
    	try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(url, userName, userPassword);
				Statement stmt = conn.createStatement();
				String sql1 = "select tab_user123.*,tab_buyer.* from tab_user123  left outer join tab_buyer on tab_buyer.name=tab_user123.pname where tab_user123.username like '"+username+"' ";
    			ResultSet rs1 = stmt.executeQuery(sql1);
    			
    			int a = 0;
    			while (rs1.next()) {
    				a++;
    			}
    			int sums = a;
    			out.print(a);
				int numPage = 4;
				int pages = (sums + numPage - 1) / numPage;
				int pageIndex = 0;
		
    			
    			out.println("<table border='1'>");
				out.println("<tr>");
				out.println("<th>��Ʒ���</th>");
				out.println("<th>��Ʒ����</th>");
				out.println("<th>��Ʒ����</th>");
				out.println("<th>��Ʒ����</th>");
				out.println("<th>�Ƿ����</th>");
		 		out.println("<th>������</th>");
				out.println("<th>�ջ�������</th>");
				out.println("<th>��ϵ�绰</th>");
				out.println("<th>�ջ���ַ</th>");
				out.println("</tr>");
    			try {
					pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
				} catch (Exception ex) {
					pageIndex = 1;
				}
    			String sql2 = "select tab_user123.*,tab_buyer.* from tab_user123  left outer join tab_buyer on tab_buyer.name=tab_user123.pname limit "+numPage * (pageIndex - 1)+","+numPage * pageIndex+"";
    			ResultSet rs = stmt.executeQuery(sql2);
    	
    			while (rs.next()) {
    				out.println("<tr>");

    				out.println("<td>"+rs.getString(1)+"</td>");    				
    				out.println("<td>"+rs.getString(2)+"</td>");
    				out.println("<td>"+rs.getString(3)+"</td>");
    				out.println("<td>"+rs.getString(4)+"</td>");
    				out.println("<td>"+rs.getString(5)+"</td>");
    				out.println("<td>"+rs.getString(6)+"</td>");
    				out.println("<td>"+rs.getString(9)+"</td>");
    				out.println("<td>"+rs.getString(10)+"</td>");
    				out.println("<td>"+rs.getString(11)+"</td>");
    				out.println("</tr>");
    			}
    			out.println("</table>");
    			out.println("<div>");
				for (int i = 0; i < pages; i++) {
				out.println("<a href=\"select.jsp?pageIndex="+(i+1)+"\">"+(i+1)+"</a>");
				}
				out.println("</div>");
    			
				stmt.close();
				conn.close();
				
				
				
		} catch (ClassNotFoundException ex) {
			System.out.println(ex.toString());
		} catch (SQLException ex) {
			System.out.println(ex.toString());
		}
     %>
  </body>
</html>
