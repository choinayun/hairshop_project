<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
 	table {
    	width: 80%;
    	border: 1px solid #A6A6A6;
    	border-collapse: collapse;
  }
  	th, td {
    	border: 1px solid #A6A6A6;
    	text-align: center;
  }
	.total{
		width: 800px;
 		margin: auto;
 		text-align: center;
	}
	 a{
   		color: black;
   		text-decoration: none;
    }
    button {
 	cursor:pointer;
	width: 20%;
	background: white;
	border: 0;
		
	-webkit-transition-duration: 0.4s; 

 	transition-duration: 0.4s;
    background-color: white;
    color: black;
  
  }
   button:hover {

  background-color: #e7e7e7;

  }
</style>
</head>
<body>
	<%@ include file="../default/header.jsp" %>
	<div class="total">
<h3>Q&A 리스트 </h3>
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
				<td><a href="${contextPath }/qna/contentView?num=${dto.num}">${dto.title}</a></td>
				<td>${dto.id}</td>
				<td>${dto.qDate}</td>
				
			</tr>
			</c:if>
			<c:if test="${dto.id!='admin'}">
				<tr>
				<td>${dto.num}</td>
				<td><a href="${contextPath }/qna/contentView?num=${dto.num}">${dto.title}</a></td>
				<td>${dto.id}</td>
				<td>${dto.qDate}</td>
				</tr>
			</c:if>
			</c:forEach>
		</table>
		<br><br>
		<button type="button" onclick="location.href='${contextPath }/qna/qnaForm'">작성</button>
	</div>
</body>
</html>