<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_login.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/admin/css/admin.css">
</head>
<body>
<h1>관리자 로그인</h1>
<form method="post" action="<%=request.getContextPath()%>/admin/login">
	아이디<input type="text" name="id" id="id"><br>
	비밀번호<input type="password" name="pwd" id="pwd"><br>
	<input type="submit" value="로그인" id="sub">	
</form>
<% String result = (String)request.getAttribute("result");
	if(result=="fail"){
%>
<script type="text/javascript">
		alert("아이디 또는 비밀번호가 맞지 않아요");
		history.go(-1);
</script>
<%
	}
%>
</body>
</html>