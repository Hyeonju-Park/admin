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
	<table border="1">
		<tr>
			<th>작성자</th>
			<th>제목</th>
			<th>공개여부</th>
			<th>작성날짜</th>			
		</tr>
	<c:forEach var="vo" items="${list }">
		<tr>
			<td>${vo.aid }</td>
			<td>${vo.ftitle }</td>
			<td>${vo.fpublic_private }</td>
			<td>${vo.frdate }</td>
		</tr>
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
	
</div>

</body>
</html>