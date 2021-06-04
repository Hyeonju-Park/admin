package admin.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import admin.dao.Admin_ProductDao;
import admin.vo.Admin_ProductVo;

@WebServlet("/admin/product/upload")
public class Admin_Product_InsertController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String saveDir=getServletContext().getRealPath("/admin/upload");
		MultipartRequest mr=new MultipartRequest(req, 
				saveDir,
				1024*1024*5,
				"utf-8",
				new DefaultFileRenamePolicy()
				);
		System.out.println("test");
		System.out.println("업로드 경로:"+saveDir);
		int pprice=Integer.parseInt(mr.getParameter("pprice"));
		int pdiscount=Integer.parseInt(mr.getParameter("pdiscount"));
		String orgpimage1=mr.getOriginalFileName("pimage1");
		String savepimage1=mr.getFilesystemName("pimage1");
		String orgpimage2=mr.getOriginalFileName("pimage2");
		String savepimage2=mr.getFilesystemName("pimage2");
		String orgpimage3=mr.getOriginalFileName("pimage3");
		String savepimage3=mr.getFilesystemName("pimage3");
		
		Admin_ProductDao dao=Admin_ProductDao.getInstance();
		Admin_ProductVo vo=new Admin_ProductVo(0, pprice, pdiscount, savepimage1, savepimage2, savepimage3, null,0, 0);
		int n=dao.insert(vo);
		if(n>0) {
			req.setAttribute("code", "success");
		}else {
			req.setAttribute("code", "fail");
		}
		String cPath=req.getContextPath();
		resp.sendRedirect(cPath+"/admin/product/list");
	}
}
