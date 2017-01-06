package com.test;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CFilter implements Filter {
	public void destroy() {
		System.out.println("destory Filter");
	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		System.out.println("doFilter2");
		
		HttpServletRequest request = (HttpServletRequest)arg0;
		HttpServletResponse response = (HttpServletResponse)arg1;
		HttpSession session = request.getSession();

		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		response.setHeader("Content-Type", "text/html; charset=gbk");
		
		String uri = request.getRequestURI();
		String ss[] = uri.split("/");
		String file = ss[ss.length - 1];
		System.out.println(file+",");
		if (file.equals("index.jsp") || file.equals("login.html") || file.equals("loginServlet")|| file.equals("addUser.jsp")|| file.equals("addUser.html")
				|| file.equals("failed_login.jsp") || file.equals("addProduct.jsp") || file.equals("listCart.jsp") ) {
			arg2.doFilter(arg0, arg1);
			return;
		}
	
		if (session.getAttribute("name") == null) {
//			response.sendRedirect("login.html");
			System.out.println("aa");
			request.getRequestDispatcher("login.html").forward(arg0, arg1);
			return;
		}
		
		
		
		arg2.doFilter(arg0, arg1);
	}

	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("init Filter");
	}
}
