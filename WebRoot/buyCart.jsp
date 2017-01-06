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
	out.println("<th>ÉÌÆ·±àºÅ</th>");
	out.println("<th>ÉÌÆ·Ãû³Æ</th>");
	out.println("<th>ÊýÁ¿</th>");
	out.println("<th>µ¥¼Û</th>");
	out.println("<th>ÊÇ·ñ´ÙÏú</th>");
	out.println("<th>¹©»õÉÌ</th>");
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
			out.println("<td>"+(p.isSale() ? "ÊÇ" : "·ñ")+"</td>");
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
						<td align="right">ÁªÏµÈË</td>
						<td align="left"><input type="text" name="customer"/></td>
					</tr>
					<tr>
						<td align="right">ÁªÏµµç»°</td>
						<td align="left"><input type="text" name="phone"/></td>
					</tr>
					<tr>
						<td align="right">ËÍ»õµØÖ·</td>
						<td align="left"><input type="text" name="address"/></td>
					</tr>
					<tr>
						<td align="center" colspan="2">
							<input type="submit" value="È·ÈÏ"/>
							<input type="reset" value="Çå¿Õ"/>
							<input type="button" value="·µ»Ø" onclick="history.back();"/>
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