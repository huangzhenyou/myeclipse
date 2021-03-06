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
function buy() {
	var chks = document.getElementsByTagName("input");
	var flag = false;
	for (i = 0; i < chks.length; i++) {
		if (chks[i].checked) {
			flag = true;
			break;
		}
	}
	
	if (!flag) {
		alert("no select");
		return;
	}
	var a = document.getElementById("form");
	a.action = "buyCart.jsp";
	document.getElementById("form").submit();
}
function remove(){
	var chks = document.getElementsByTagName("input");
	var flag = false;
	for (i = 0; i < chks.length; i++) {
		if (chks[i].checked) {
			flag = true;
			break;
		}
	}
	
	if (!flag) {
		alert("no select");
		return;
	}
	
	var a = document.getElementById("form");
	a.action = "deleteCart.jsp";
	document.getElementById("form").submit();
}
</script>
</head>
<body>
	<div class="navigate">
		<a href="index.jsp">首页</a>
		<a href="javascript:buy();">下单</a>
		<a href="javascript:remove();">删除</a>
		<a href="addProduct.html">返回</a>
		<a href="quit.jsp">退出</a>
	</div>
	<div class="cart">
	<form id="form" action="buyCart.jsp" method="post">
<%
	request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		response.setHeader("Content-Type", "text/html; charset=gbk");

	Vector<CProduct> vecCart = null;
	Object object = session.getAttribute("cart");
	if (object != null) {
		out.println("<table border='1'>");
		out.println("<tr>");
		out.println("<th><input type='checkbox'/></th>");
		out.println("<th>商品编号</th>");
		out.println("<th>商品名称</th>");
		out.println("<th>数量</th>");
		out.println("<th>单价</th>");
		out.println("<th>是否促销</th>");
		out.println("<th>供货商</th>");
		out.println("</tr>");
	
		vecCart = (Vector<CProduct>)object;	
		int sums = vecCart.size();
		int numPage = 4;
		int pages = (sums + numPage - 1) / numPage;
		int pageIndex = 0;
		try {
			pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
		} catch (Exception ex) {
			pageIndex = 1;
		}

		CProduct p = null;
		for (int i = numPage * (pageIndex - 1); i >= 0 && i < sums && i < numPage * pageIndex; i++) {
			p = vecCart.get(i);
			
			out.println("<tr>");
			out.println("<td><input type='checkbox' name='pid' value='"+p.getPid()+"'/></td>");
			out.println("<td>"+p.getPid()+"</td>");
			out.println("<td>"+p.getName()+"</td>");
			out.println("<td>"+p.getNums()+"</td>");
			out.println("<td>"+p.getPrice()+"</td>");
			out.println("<td>"+(p.isSale() ? "是" : "否")+"</td>");
			out.println("<td>"+p.getProvider()+"</td>");
			out.println("</tr>");
		}

		out.println("</table>");

		out.println("<div>");
		for (int i = 0; i < pages; i++) {
			out.println("<a href=\"listCart.jsp?pageIndex="+(i+1)+"\">"+(i+1)+"</a>");
		}
		out.println("</div>");
	}
%>

	</form>
	</div>
</body>
</html>