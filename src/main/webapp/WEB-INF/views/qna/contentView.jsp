<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.total{
		width: 800px;
 		margin: auto;
 		text-align: center;
	}
	.tab { width: 650px; margin: auto; }
	textarea { width: 630px; height: 250px; }
	table {
    	width: 100%;
    	border: 1px solid #A6A6A6;
    	border-collapse: collapse;
 		}
  	th, td {
    	border: 1px solid #A6A6A6;
    	text-align: center;
 	 }
</style>

</head>
<body>
<%@ include file="../default/header.jsp" %>
	<div class="total">
		<table border="1" class="tab">
			<tr>
				<th width="100">글 번호</th>
				<td width="200">${dto.num}</td>
				<th width="100">작성자</th>
				<td width="200">${dto.id}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${dto.title}</td>
				<th>등록일자</th>
				<td>${dto.qDate}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${dto.content}</td>
				<td colspan="2"><c:if test="${ dto.img == 'nan' }">
						<b>이미지가 없습니다</b>
					</c:if> <c:if test="${ dto.img != 'nan' }">
						<img width="100px" height="100px" 
							 src="${contextPath}/admin/download?img=${dto.img}">
					</c:if></td>
			</tr>


		</table>

		<br> <br> <br> <br> <br>



<c:if test="${reply != null}">
	<table class="tab">
		<c:forEach var="reply" items="${reply}">
			<tr>
				<td>관리자</td>
				<td>${reply.content}</td>
				<td>${reply.qDate}</td>
			</tr>
		</c:forEach>
	</table>
</c:if>

		<c:if test="${loginUser.equals('admin')}">
			<form method="post" action="reply">
				<table border="1" class="tab">
					<tr>
						<td colspan="4"><textarea name="content"></textarea></td>
					</tr>
					<tr>
						<td><input type="hidden" name="id" value="admin"></td>
						<td><input type="hidden" name="num" value="${dto.num}"></td>
						<td><input type="hidden" name="groupNum" value="${dto.num}"></td>
					</tr>
					<tr>
						<td colspan="4"><input type="submit" value="답글달기"></td>
					</tr>

				</table>
			</form>
		</c:if>


	</div>

</body>
</html>