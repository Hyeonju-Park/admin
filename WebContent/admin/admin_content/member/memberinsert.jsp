<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>memberinsert.jsp</title>

</head>
<body>
<form method="post" action="${cp }/admin/insert" style="margin-top:20px;">
	���̵�<input type="text" name="mid"><br>
	��й�ȣ<input type="password" name="mpw"><br>
	��й�ȣ Ȯ��<input type="password" name="mpwcheck"><br>
	<div id="mention"></div>
	�̸�<input type="text" name="mname"><br>
	�ּ�<input type="text" name="maddress"><br>
	�̸���<input type="text" name="memail"><br>
	�����ȣ<input type="text" name="mpost"><br>
	��ȭ��ȣ<input type="text" name="mphone"><br>
	����<input type="text" name="mbirth"><br>
	<input type="submit" value="���">
</form>
</body>
</html>