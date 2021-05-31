package admin.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/memberinsert")
public class Admin_MemberinsertController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cp = req.getContextPath();
		ServletContext application = getServletContext();
		application.setAttribute("cp", cp);
		req.setAttribute("content", "/admin/admin_content/member/memberinsert.jsp");
		req.getRequestDispatcher("/admin/admin_content/index.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mid=req.getParameter("mid");
		String mpw=req.getParameter("mpw");
		String mpwcheck=req.getParameter("mpwcheck");
		String mname=req.getParameter("mname");
		String maddress=req.getParameter("maddress");
		String mpost=req.getParameter("mpost");
		String mphone=req.getParameter("mphone");
		String mbirth=req.getParameter("mbirth");
		String memail=req.getParameter("memail");
		//�򰥷�
		if(mpw!=mpwcheck) {
			req.setAttribute("mention", "��й�ȣ�� �����ʽ��ϴ�.");
		}else {
			req.setAttribute("mention", "��й�ȣ ��밡��");
		}
		
		req.setAttribute("mid", mid);
		req.setAttribute("mpw", mpw);
		req.setAttribute("mname", mname);
		req.setAttribute("maddress", maddress);
		req.setAttribute("mpost", mpost);
		req.setAttribute("mphone", mphone);
		req.setAttribute("mbirth", mbirth);
		req.setAttribute("memail", memail);
		req.setAttribute("content", "/admin/admin_content/member/memberinsert.jsp");
	
		req.getRequestDispatcher("/admin/admin_content/index.jsp").forward(req, resp);
	}
}
