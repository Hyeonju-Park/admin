<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>memberupdate.jsp</title>
<style>
	#box{
		position:absolute;
		top:100px;
		left:300px;
	}
</style>
</head>
<body>
<div id="box">
	
		<form method="post" action="<%=request.getContextPath()%>/admin/memberupdate">
			���̵�:<input type="text" name="mid" value="${param.mid }" readonly="readonly"><br>
			��й�ȣ:<input type="text" value="${vo.mpw }"><br>
			�̸�:<input type="text"><br>
			�ּ�:<input type="text"><br>
			�����ȣ:<input type="text"><br>
			��ȭ��ȣ:<input type="text"><br>
			����:<input type="text"><br>
			���ϸ���:<input type="text"><br>
			�̸���:<input type="text"><br>
			<input type="submit" value="����">
		</form>
	
</div>
</body>
</html>