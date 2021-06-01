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
		���̵�<input type="text" name="mid" id="mid1">
		<input type="button" name="idcheck" id="idcheck" value="���̵�Ȯ��"><br>
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
	let idcheck=document.getElementById("idcheck");
	idcheck.onclick=function(e){
		var mid=document.getElementById("mid1").value;
		const idmention=document.getElementById("idmention");
		console.log("test1");
		if(mid=="" || mid==null){
			idmention.innerHTML="���̵� �Է��ʿ�!";
			console.log("test2");
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
		xhr.open('get','idcheck.jsp?mid='+mid,true);
		xhr.send();
	};
	function mpwcheck(){
		let mpw=document.getElementById("mpw").value;
		let mpwcheck=document.getElementById("mpwcheck").value;
		const pwdmention=document.getElementById("pwdmention");
		if(mpw==""){
			pwdmention.innerHTML="��й�ȣ�� �Է��ϼ���.";
		}
		if(mpw!=mpwcheck){
			pwdmention.innerHTML="��й�ȣ�� ��ġ���� �ʽ��ϴ�.";
		}else{
			pwdmention.innerHTML="��й�ȣ�� ��ġ�մϴ�.";
		}
	}
</script>
</body>
</html>