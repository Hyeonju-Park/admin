package admin.controller;

import java.io.File;

import javax.servlet.http.HttpServlet;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import admin.dao.Admin_FaqDao;
import admin.vo.Admin_FaqVo;

public class Admin_QnaController extends HttpServlet{
	req.setCharacterEncoding("utf-8");
	String saveDir=getServletContext().getRealPath("/upload");
	MultipartRequest mr=new MultipartRequest(req, // request객체
			saveDir,  //업로드할 디렉토리 경로
			1024*1024*5, // 최대 업로드 크기(바이트)
			"utf-8", //인코딩방식
			new DefaultFileRenamePolicy()//동일한 파일명이 존재할시 파일명뒤에 일련번호(1,2,3,..)을 붙여서 파일 생성
	);
	String fwriter=req.getParameter("fwriter");
	String ftitle=req.getParameter("ftitle");
	String fcontent=req.getParameter("fcontent");
	String file1=req.getParameter("file1");
	String orgFileName=mr.getOriginalFileName("file1");//전송된 파일명
	
	
	Admin_FaqDao dao=new Admin_FaqDao();
	Admin_FaqVo vo=new Admin_FaqVo(0, ftitle, fcontent, 0, null, 0, 0, saveFileName);
	File f=new File(saveDir +"\\" + saveFileName);
}
