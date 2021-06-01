<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>memberinsert.jsp</title>
<style>
	#insertbox{
		position:absolute;
		top:100px;
		left:300px;
	}
</style>
</head>
<body>
<div id="insertbox">
	<form method="post" action="${cp }/admin/memberinsert" style="margin-top:20px;">
		���̵�<input type="text" name="mid">
		<input type="button" name="idcheck" value="���̵�Ȯ��"><br>
		<div id="idmention"></div><br>
		��й�ȣ<input type="password" name="mpw"><br>
		��й�ȣ Ȯ��<input type="password" name="mpwcheck" onkeyup="mpwcheck()"><br>
		<div id="pwdmention"></div><br>
		�̸�<input type="text" name="mname"><br>
		�ּ�<input type="text" name="maddress"><br>
		�̸���<input type="text" name="memail"><br>
		�����ȣ<input type="text" name="mpost"><br>
		��ȭ��ȣ<input type="text" name="mphone"><br>
		����<input type="text" name="mbirth"><br>
		<input type="submit" value="���">
	</form>
</div>
<script type="text/javascript">
	let idcheck=document.getElementById("idcheck")
	idcheck.onclick=function(e){
		const mid=document.getElementById("mid").value;
		const idmention=document.getElementById("idmention");
		if(mid==""){
			idmention.innerHTML="���̵� �Է��ʿ�!"
		}
		let xhr=new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){
				let result=xhr.responseText;
				let json=JSON.parse(result);
				if(json.using==true){
					idmention.innerHTML="������� ���̵�";
				}else{
					idmention.innerHTML="��밡���� ���̵��Դϴ�.";
				}
			}
		};
		xhr.open('get','idcheck.jsp?id='+id,true);
		xhr.send();
	};

</script>
</body>
</html>