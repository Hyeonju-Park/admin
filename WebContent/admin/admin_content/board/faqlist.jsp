<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>fnq.jsp</title>
<style>
	#faqbox{
		position:absolute;
		top:100px;
		left:800px;
	}
	#list{
		position:absolute;
		top:100px;
		left:150px;
	}
</style>
</head>
<body>
<%
	String id=(String)session.getAttribute("id");
%>
<div id="faqbox">
	<form method="post" action="<%=request.getContextPath()%>/admin/faq/insert">
		작성자<br>
		<input type="text" name="fwriter" value=<%=id %> readonly="readonly"><br>
		제목<br>
		<input type="text" name="ftitle"><br>
		내용<br>
		<textarea rows="5" cols="50" name="fcontent"></textarea><br>
		공개<input type="radio" name="fpublic_private" value="1" checked>
		비공개<input type="radio" name="fpublic_private" value="0">
		<input type="submit" name="submit" value="등록">
	</form>
</div>
<div id="list">
<div>
	<table class="table">
		<tr>
			<th colspan="6">공개테이블</th>
		</tr>
		<tr>
			<th>작성자</th>
			<th>제목</th>
			<th>공개여부</th>
			<th>작성날짜</th>			
			<th>수정</th>			
			<th>삭제</th>			
		</tr>
	<c:forEach var="vo" items="${list }">
	<c:choose>
		<c:when test="${vo.fpublic_private==1 }">
		<tr>
			<td>${vo.aid }</td>
			<td>${vo.ftitle }</td>
			<td>공개</td>
			<td>${vo.frdate }</td>
			<td><input type="button" name="update" value="수정" onclick="showPopup()"></td>
			<td><a href="">삭제</a></td>
		</tr>
		</c:when>
		</c:choose>
	</c:forEach>
	</table>
	<c:if test="${startPageNum>10 }">
		<a href="${cp }/admin/faq/list?pageNum=${startPageNum-1 }">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
		<c:choose>
			<c:when test="${pageNum==i }"><%--현재페이지인경우 --%>
				<a href="${cp }/admin/faq/list?pageNum=${i }"><span style="color:blue">[${i }]</span></a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/admin/faq/list?pageNum=${i }"><span style="color:gray">[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${endPageNum<pageCount }">
		<a href="${cp }/admin/faq/list?pageNum=${endPageNum+1 }">[다음]</a>
	</c:if>
	<form method="post" action="${cp }/admin/faq/list">
		<select name="field">
			<option value="ftitle">제목</option>
			<option value="fcontent">내용</option>
		</select>
		<input type="text" name="keyword">
	<input type="button" value="검색">
	</form>	<br>
</div>
<div>
	<table class="table">
		<tr>
			<th colspan="6">비공개테이블</th>
		</tr>
		<tr>
			<th>작성자</th>
			<th>제목</th>
			<th>공개여부</th>
			<th>작성날짜</th>			
			<th><input type="button" name="update" value="수정" onclick="showPopup()"></th>			
			<th><a href="">삭제</a></th>			
		</tr>
	<c:forEach var="vo" items="${list1 }">
	<c:choose>
		<c:when test="${vo.fpublic_private==0 }">
		<tr>
			<td>${vo.aid }</td>
			<td>${vo.ftitle }</td>
			<td>비공개</td>
			<td>${vo.frdate }</td>
			<td><a href="${cp }/admin/admin_content/board/faqlistupdate.jsp?fid=${vo.fid }">수정</a></td>
		</tr>
		</c:when>
		</c:choose>
	</c:forEach>
	</table>
	<c:if test="${startPageNum1>10 }">
		<a href="${cp }/admin/faq/list1?pageNum1=${startPageNum1-1 }">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${startPageNum1 }" end="${endPageNum1 }">
		<c:choose>
			<c:when test="${pageNum1==i }"><%--현재페이지인경우 --%>
				<a href="${cp }/admin/faq/list?pageNum1=${i }"><span style="color:blue">[${i }]</span></a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/admin/faq/list?pageNum1=${i }"><span style="color:gray">[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${endPageNum1<pageCount1 }">
		<a href="${cp }/admin/faq/list?pageNum1=${endPageNum1+1 }">[다음]</a>
	</c:if>	
	<form method="post" action="${cp }/admin/faq/list">
		<select name="field1">
			<option value="ftitle1">제목</option>
			<option value="fcontent1">내용</option>
		</select>
		<input type="text" name="keyword1">
	<input type="button" value="검색">
	</form>
</div>
</div>
<script type="text/javascript">
	var name=document.getElementsByName("name");
	var url="<%=request.getContextPath()%>/admin/admin_content/board/faqlistupdate.jsp"
	var size="width=500, height=500, left=100, top=50"
	function showPopup(){
		window.open(url,"수정",size);
	}
</script>
</body>
</html>