package com.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CAddProductServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		response.setHeader("Content-Type", "text/html; charset=gbk");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		Vector<CProduct> vecCart = null;
		Object object = session.getAttribute("cart");
		if (object == null) {
			vecCart = new Vector<CProduct>();
		} else {
			vecCart = (Vector<CProduct>)object;
		}
		
		try {
			String pid = request.getParameter("pid");
			String name = request.getParameter("name");
			String nums = request.getParameter("nums");
			String price = request.getParameter("price");
			String sale = request.getParameter("sale");
			String provider = request.getParameter("provider");
			CProduct product = new CProduct(Integer.parseInt(pid), name, Integer.parseInt(nums),
					Integer.parseInt(price), sale.equals("1"), provider);

			boolean flag = false;
			for (CProduct p : vecCart) {
				if (p.getPid() == product.getPid()) {
					p.setNums(p.getNums() + product.getNums());
					flag = true;
					break;
				}
			}
			if (!flag) {
				vecCart.add(product);
			}
			
			session.setAttribute("cart", vecCart);
			
			out.print("<center>"+"<h1>"+"<font color='green'>加入购物车成功</font>"+"</h1>"+"</center>");
		} catch (Exception ex) {
			out.print("<center>"+"<h1>"+"<font color='red'>加入购物车失败</font>"+"</h1>"+"</center>");
		}

		response.setHeader("refresh", "1;url=listCart.jsp");
	}
}
