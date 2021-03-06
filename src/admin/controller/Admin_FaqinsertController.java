package admin.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.dao.Admin_FaqDao;
import admin.vo.Admin_FaqVo;

@WebServlet("/admin/faq/insert")
public class Admin_FaqinsertController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String fwriter=req.getParameter("fwriter");
		String ftitle=req.getParameter("ftitle");
		String fcontent=req.getParameter("fcontent");
		int fpublic_private=Integer.parseInt(req.getParameter("fpublic_private"));
		
		Admin_FaqDao dao=new Admin_FaqDao();
		Admin_FaqVo vo=new Admin_FaqVo(0, ftitle, fcontent,null,0, fpublic_private,fwriter);
		dao.insert(vo);
		
		String cPath=req.getContextPath();
		resp.sendRedirect(cPath+"/admin/faq/list");
	}
}
