<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>memberupdate.jsp</title>
</head>
<body>
<form method="post" action="${cp }/admin/memberupdate">
	���̵�:<input type="text" name="mid" value="${vo.mid }" readonly="readonly"><br>
	��й�ȣ:<input type="text"><br>
	�̸�:<input type="text"><br>
	�ּ�:<input type="text"><br>
	�����ȣ:<input type="text"><br>
	��ȭ��ȣ:<input type="text"><br>
	����:<input type="text"><br>
	���ϸ���:<input type="text"><br>
	�̸���:<input type="text"><br>
	<input type="submit" value="����">
</form>
</body>
</html>