<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@page import="java.util.Vector"%>
<%@page import="com.test.CProduct"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="cart.css" rel="stylesheet" type="text/css">
<script type="text/javascript">

</script>
</head>
<body>
	<form action="addInformation.jsp" method="post">
<%
	Vector<CProduct> vecCart = null;
	Object object = session.getAttribute("cart");
	if (object == null) {
		out.println("no product in cart");
		response.setHeader("refresh", "1;url=listCart.jsp");
		return;
	}
	
	vecCart = (Vector<CProduct>)object;
	String pids[] = request.getParameterValues("pid");
	
	out.println("<table border='1' class='cart'>");
	out.println("<tr>");
//	out.println("<th><input type='checkbox'/></th>");
	out.println("<th>商品编号</th>");
	out.println("<th>商品名称</th>");
	out.println("<th>数量</th>");
	out.println("<th>单价</th>");
	out.println("<th>是否促销</th>");
	out.println("<th>供货商</th>");
	out.println("</tr>");

	for (String pid : pids) {
		for (CProduct p : vecCart) {
			if (!pid.equals(String.valueOf(p.getPid()))) {
				continue;
			}

			out.println("<tr>");

			out.println("<td>"+p.getPid()+ "<input hidden type='checkbox' checked = 'checked' name='pid' value='"+p.getPid()+"'/>" + "</td>");
			out.println("<td>"+p.getName()+"</td>");
			out.println("<td>"+p.getNums()+"</td>");
			out.println("<td>"+p.getPrice()+"</td>");
			out.println("<td>"+(p.isSale() ? "是" : "否")+"</td>");
			out.println("<td>"+p.getProvider()+"</td>");
			
			out.println("</tr>");
			
			
		}
	}

%>
		<tr>
			<td colspan="6" algin="center">
				<center>
				<table class="sale">
					<tr>
						<td align="right">联系人</td>
						<td align="left"><input type="text" name="customer"/></td>
					</tr>
					<tr>
						<td align="right">联系电话</td>
						<td align="left"><input type="text" name="phone"/></td>
					</tr>
					<tr>
						<td align="right">送货地址</td>
						<td align="left"><input type="text" name="address"/></td>
					</tr>
					<tr>
						<td align="center" colspan="2">
							<input type="submit" value="确认"/>
							<input type="reset" value="清空"/>
							<input type="button" value="返回" onclick="history.back();"/>
						</td>
					</tr>
				</table>
				</center>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>