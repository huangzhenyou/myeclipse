<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.util.Vector"%>
<%@page import="com.test.CProduct"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'deleteCart.jsp' starting page</title>
    
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
	request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setHeader("Content-Type", "text/html; charset=utf-8");
	Vector<CProduct> vecCart = null;
	List delList = new ArrayList();
	
	Object object = session.getAttribute("cart");
	

	vecCart = (Vector<CProduct>)object;
	String pids[] = request.getParameterValues("pid");
	
	
	for (String pid : pids) {
		for (CProduct c : vecCart) {
			if (!pid.equals(String.valueOf(c.getPid()))) {
				continue;
			}
			
					delList.add(c);
		}
	}
	vecCart.removeAll(delList);
	session.setAttribute("cart", vecCart);
	out.print("删除成功");
	response.setHeader("refresh", "1;url=listCart.jsp");
%>
  </body>
</html>
