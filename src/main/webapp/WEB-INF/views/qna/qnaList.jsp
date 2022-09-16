<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
	.total{
		width: 800px;
 		margin: auto;
 		text-align: center;
	}
</style>
</head>
<body>
	<%@ include file="../default/header.jsp" %>
	<div class="total">
<h1>Q&A 리스트 </h1>
<table border="1" style="margin: auto;">
			<tr>
				<th>글 번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성 날짜</th>
			</tr>
			<c:forEach var="dto" items="${list}">
			<c:if test="${dto.id=='admin'}">
			<tr hidden="">
				<td>${dto.num}</td>
				<td><a href="${contextPath }contentView?num=${dto.num}">${dto.title}</a></td>
				<td>${dto.id}</td>
				<td>${dto.qDate}</td>
				
			</tr>
			</c:if>
			<c:if test="${dto.id!='admin'}">
				<tr>
				<td>${dto.num}</td>
				<td><a href="${contextPath }contentView?num=${dto.num}">${dto.title}</a></td>
				<td>${dto.id}</td>
				<td>${dto.qDate}</td>
				</tr>
			</c:if>
			</c:forEach>
		</table>
		
		<button type="button" onclick="location.href='${contextPath }qnaForm'">작성</button>
	</div>
</body>
</html>