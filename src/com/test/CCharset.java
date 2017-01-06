package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CCharset extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("gbk");
		resp.setCharacterEncoding("gbk");
		resp.setHeader("Content-Type", "text/html; charset=gbk");
		
		String name = req.getParameter("name");
		System.out.println("get : " + name);
		
		name = new String(name.getBytes("iso-8859-1"), "gbk");
		
		System.out.println("get : " + name);
		
		PrintWriter out = resp.getWriter();
		out.println("get : " + name);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("gbk");
		resp.setCharacterEncoding("gbk");
		resp.setHeader("Content-Type", "text/html; charset=gbk");
		
		String name = req.getParameter("name");
		System.out.println("post : " + name);
		
//		name = new String(name.getBytes("iso-8859-1"), "gbk");
		
		System.out.println("post : " + name);
		
		PrintWriter out = resp.getWriter();
		out.println("post : " + name);
	}
}
