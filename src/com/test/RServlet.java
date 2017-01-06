/*package com.test;

import javax.servlet.*;  
import javax.servlet.http.*;  //基于http的 HttpServlet类在此包中

import java.io.*; 
import java.sql.*; 
public class RServlet extends HttpServlet     //从HttpServlet类派生而来 至少实现以下一个函数 
{ 
  String user  ;
  String password;
  PrintWriter out ;//输出流
  public void init(ServletConfig config) throws ServletException
  {
   super.init(config) ;//调用基类的构造函数进行初始化 
  }
  public  void service(ServletRequest req, ServletResponse res) //重写Service来对客户端的请求进行相应
  {   
   res.setContentType("text/html;charset=gbk");//设置相应页面的格式 如果不设置那么将会导致出现乱码
   //设置 MIME类型应该在 获取PrintWriter之前
   this.getPrintWriter(res);//获得输出流
   if((user=req.getParameter("user"))==null||(password=req.getParameter("password"))==null)//数据不合理就返回
   {     
        out.print("非法数据提交！<br>");
        return ;
   }
   else
   {
     this.addUserToDB(this.user, this.password)   ;//增加用户到数据库
   }
  }
public  void  getPrintWriter(ServletResponse res)
{
 try
 {
   this.out=res.getWriter() ;
 }
 catch(Exception e)
 {
  
 }
}
protected void doPost(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException
{
	req.setCharacterEncoding("gbk");
	resp.setCharacterEncoding("gbk");
	resp.setHeader("Content-Type", "text/html; charset=gbk");
	
	try{
		String addname = req.getParameter("addname");
		String addpassword = req.getParameter("addpassword");
		//resp.getWriter().println(addname);
		//resp.getWriter().println(addpassword);
		
		if(!addname.equals("") && !addpassword.equals("")){
			String userSql = "insert into tab_user (addname,addpassword) values ('"+addname+"', '"+addpassword+"')";
			 executeUpdate(userSql) ;//执行SQL语句
			   close() ;
		}
	
*/