/*package com.test;

import javax.servlet.*;  
import javax.servlet.http.*;  //����http�� HttpServlet���ڴ˰���

import java.io.*; 
import java.sql.*; 
public class RServlet extends HttpServlet     //��HttpServlet���������� ����ʵ������һ������ 
{ 
  String user  ;
  String password;
  PrintWriter out ;//�����
  public void init(ServletConfig config) throws ServletException
  {
   super.init(config) ;//���û���Ĺ��캯�����г�ʼ�� 
  }
  public  void service(ServletRequest req, ServletResponse res) //��дService���Կͻ��˵����������Ӧ
  {   
   res.setContentType("text/html;charset=gbk");//������Ӧҳ��ĸ�ʽ �����������ô���ᵼ�³�������
   //���� MIME����Ӧ���� ��ȡPrintWriter֮ǰ
   this.getPrintWriter(res);//��������
   if((user=req.getParameter("user"))==null||(password=req.getParameter("password"))==null)//���ݲ�����ͷ���
   {     
        out.print("�Ƿ������ύ��<br>");
        return ;
   }
   else
   {
     this.addUserToDB(this.user, this.password)   ;//�����û������ݿ�
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
			 executeUpdate(userSql) ;//ִ��SQL���
			   close() ;
		}
	
*/