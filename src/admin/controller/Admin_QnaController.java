package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/admin/qna")
public class Admin_QnaController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("content","/admin/admin_content/board/qna.jsp");
		req.getRequestDispatcher("/admin/admin_content/index.jsp").forward(req, resp);
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.setCharacterEncoding("utf-8");
//		
//		String saveDir=getServletContext().getRealPath("/upload");
//		MultipartRequest mr=new MultipartRequest(req, // request��ü
//				saveDir,  //���ε��� ���丮 ���
//				1024*1024*5, // �ִ� ���ε� ũ��(����Ʈ)
//				"utf-8", //���ڵ����
//				new DefaultFileRenamePolicy()//������ ���ϸ��� �����ҽ� ���ϸ�ڿ� �Ϸù�ȣ(1,2,3,..)�� �ٿ��� ���� ����
//		);
//		
//		String field=req.getParameter("field");
//		String qwriter=req.getParameter("qwriter");
//		String qpw=req.getParameter("qpw");
//		String qtitle=req.getParameter("qtitle");
//		String qcontent=req.getParameter("qcontent");
//		String orgFileName=mr.getOriginalFileName("file1");//���۵� ���ϸ�
//		String saveFileName=mr.getFilesystemName("file1");//������ ����� ���ϸ�
		//���ϰ�� �ٽù޾ƿ;��� (jsp18)
	
			System.out.println("test");
		System.out.println("���ε� ���:" + saveDir);
//		req.setAttribute("filed", field);
//		req.setAttribute("qwriter", qwriter);
//		req.setAttribute("qpw", qpw);
//		req.setAttribute("qtitlq", qtitle);
//		req.setAttribute("qcontent", qcontent);
		req.setAttribute("content","/admin/admin_content/board/qna.jsp");
		req.getRequestDispatcher("/admin/admin_content/index.jsp").forward(req, resp);
	}
}
