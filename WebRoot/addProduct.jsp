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
<link href="cart.css" rel="stylesheet" type="text/css">

<script>
	function addn(){
		var nums = document.getElementById("nums");
		nums.value++;
	}
	function ren(){
		var nums = document.getElementById("nums");
		nums.value--;
	}
</script>
</head>
<body>
<%
		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		response.setHeader("Content-Type", "text/html; charset=gbk");
		String id = request.getParameter("id");
		String name = "";
		String price = "";
		String jianjie = "";
		String src="";
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/test";
		String userName = "root";
		String userPassword = "123";
		boolean flag = true;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, userName, userPassword);
			Statement stmt = conn.createStatement();
			String sql = "select name,price,jianjie,src from tab_product2 where id = "+id+";";
							
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				name = rs.getString(1);
				price = rs.getString(2);
				jianjie = rs.getString(3);
				src	= rs.getString(4);
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
	<div class="navigate">
		<a href="index.jsp">返回</a>
		<a href="listCart.jsp">购物车</a>
	</div>
	<center>
		<form action="addProduct" method="post">
		
			<table><img src = "<%=src %>" width='300' height='300'>
				<tr>
					<td align="right">产品编号</td>
					<td align="left"><input type="text" readonly="ture" style = "text-align:center" name="pid"  value = "<%=id %>"/></td>
				</tr>
				<tr>
					<td align="right">产品名称</td>
					<td align="left"><input type="text" readonly="ture" name="name" style = "text-align:center" value = "<%=name %>"/></td>
				</tr>
				<tr>
					<td align="right">数量</td>
					<td align="left"><input type = "button"  value = "-" onclick = "ren()"/><input type="text" name="nums" id = "nums" value = "1"  style = "width:125px;text-align:center"/><input type = "button" value = "+" onclick = "addn()"/></td>
				</tr>
				<tr>
					<td align="right">单价</td>
					<td align="left"><input type="text" readonly="ture" style = "text-align:center" name="price"/ value = "<%=price %>"></td>
				</tr>
				<tr>
					<td align="right">是否促销</td>
					<td align="left">
						<input type="radio" name="sale" value="1"/>是
						<input type="radio" name="sale" value="0" checked = checked/>否
					</td>
				</tr>
				<tr>
					<td align="right">供货商</td>
					<td align="left">
						<textarea name="provider" readonly="ture" rows="4" cols="20" ><%=jianjie %></textarea>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<input type="submit" value="入库"/>
						
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>