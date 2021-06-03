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
		�ۼ���<br>
		<input type="text" name="fwriter" value=<%=id %> readonly="readonly"><br>
		����<br>
		<input type="text" name="ftitle"><br>
		����<br>
		<textarea rows="5" cols="50" name="fcontent"></textarea><br>
		����<input type="radio" name="fpublic_private" value="1" checked>
		�����<input type="radio" name="fpublic_private" value="0">
		<input type="submit" name="submit" value="���">
	</form>
</div>
<div id="list">
	<table border="1">
		<tr>
			<th>�ۼ���</th>
			<th>����</th>
			<th>��������</th>
			<th>�ۼ���¥</th>			
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
		<a href="${cp }/admin/faq/list?pageNum=${startPageNum-1 }">[����]</a>
	</c:if>
	<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
		<c:choose>
			<c:when test="${pageNum==i }"><%--�����������ΰ�� --%>
				<a href="${cp }/admin/faq/list?pageNum=${i }"><span style="color:blue">[${i }]</span></a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/admin/faq/list?pageNum=${i }"><span style="color:gray">[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${endPageNum<pageCount }">
		<a href="${cp }/admin/faq/list?pageNum=${endPageNum+1 }">[����]</a>
	</c:if>
	
</div>

</body>
</html>