<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/admin/css/product.css">
<div class="boardcss_list_table">
<h3 class="producttext1">상품별 재고리스트</h3>
	<table class="list_table">
		<thead>
		<tr>
			<th>번호</th>
			<th>상품명</th>
			<th>색상</th>
			<th>사이즈</th>
			<th>수량</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.sid }</td>
				<td>${vo.sname }</td>
				<td>${vo.scolor }</td>
				<td>${vo.ssize }</td>
				<td>${vo.samount }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>	

<div class="imgbox">
	<img class="img1" name="smallimg"><img class="img2" name="smallimg"><img class="img3" name="smallimg">
	<input type="button" value="좌" id="btnprev">
	<input type="button" value="우" id="btnnext">
</div>

<div class="product_input">
<h3 class="producttext2">주문등록</h3>
<form action="${cp }/admin/product/upload" enctype="multipart/form-data"  method="post">
	<label class="label_img1">대표이미지</label>
	<input type="file" name="pimage1" style="position: absolute;top:50px;left:150px;width:250px; font-size: 0.9rem;">
	<img id="large_img1">
	<label class="label_img2">추가이미지1</label>
	<input type="file" name="pimage2" style="position: absolute;top:400px;left:150px;width:250px; font-size: 0.9rem;">
	<img id="large_img2">
	<label class="label_img3">추가이미지2</label>
	<input type="file" name="pimage3" style="position: absolute;top:400px;left:400px;width:250px; font-size: 0.9rem;">
	<img id="large_img3">
	<label class="label_sid">상품번호</label>
	<select id="select_sid" onchange="chang_sid()" name="sid" style="position:absolute;top:660px;left:100px;width: 100px;font-size:0.9rem;">
		<c:forEach var="vo" items="${list }">
			<option>${vo.sid }</option>
		</c:forEach>
	</select>
	<label class="label_amount">상품수량</label><input type="text" name="amount" readonly="readonly" style="position:absolute;top:660px;left:350px;width: 200px;font-size: 0.9rem;" />
	<label class="label_price">가격</label><input type="text" name="pprice" style="position:absolute;top:760px;left:100px;width: 200px;font-size: 0.9rem;" />
	<label class="label_discount">할인율</label><input type="text" name="pdiscount" style="position:absolute;top:760px;left:450px;width: 200px;font-size: 0.9rem;" />
	<input type="submit" class="insertbtn" value="등록">
</form>
</div>
<script type="text/javascript">
	function chang_sid(){
			let sid=document.getElementById("select_sid").value;
			let amount=document.getElementsByName("amount")[0].value;
			let xhr=new XMLHttpRequest();
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4 && xhr.status==200){
					let result=xhr.responseXML;
					let code=xml.getElementsByTagName("amount")[0].textContent;
					console.log(code);
				}
			};
			xhr.open('post','${pageContext.request.contextPath}/admin/stock/find',true);
			xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			let params="sid="+sid;
			xhr.send(params);
		}
</script>
<!-- <script type="text/javascript">
	window.onload=function(){
		var content="<%=request.getContextPath()%>/admin/upload/";
		var imgs=[content+'1.jpg',content+'2.jpg',content+'3.jpg'];
		var img=document.getElementsByName("smallimg");
		var btnprev=document.getElementById("btnprev");
		var btnnext=document.getElementById("btnnext");
		var lage_img1=document.getElementById("lage_img1");
		for(var i=0;i<img.length;i++){
			img[i].src=imgs[i];
			img[i].addEventListener('click',changepic);
		}
		var cnt=0;
		btnnext.onclick=function(){
			cnt+=1;
			for(var i=0;i<3;i++){
				let index=(i+cnt)%10;
				img[i].src=imgs[index];
				
			}
		}
		btnprev.onclick=function(){
			if(cnt==0) cnt=10;
			cnt-=1;
			for(var i=0;i<3;i++){
				let index=(i+cnt)%10;
				img[i].src=imgs[index];
			}
		}
		function changepic(){
			var imgAttribute = this.getAttribute("src");
			console.log(imgAttribute);
			var lage_img1_path=document.getElementsByName("lage_img1_path")[0].value=imgAttribute;
			lage_img1.setAttribute("src", imgAttribute);
		}
	}
</script> -->

