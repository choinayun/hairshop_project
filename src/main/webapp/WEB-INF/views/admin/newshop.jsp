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
.wrap{
		width: 800px;
 		margin: auto;
 		text-align: center;
}
a{
	text-decoration: none;
	color: black;
}
</style>
<style>
  table {
    width: 100%;
    border: 1px solid #A6A6A6;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #A6A6A6;
  }

 button {
 	cursor:pointer;
	width: 100%;
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
<div class="wrap">
	<h3 style="text-align: left;">매장 등록 신청</h3>
	
	<br>
	
	<br>
	<table border="1" style="margin: auto;">
	
			<tr>
				<th>매장 번호</th>
				<th>매장 아이디</th>
				<th>매장 이름</th>
				<th>매장 주소</th>
				<th>매장 전화번호</th>
				<th>등록 수락</th>
				<th>등록 거부</th>
			</tr>
	
			<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.num}</td>
				<td>${dto.id}</td>
				<td>${dto.sName}</td>
				<td>${dto.sAddr}</td>
				<td>${dto.sPhone}</td>
				
				<td><button type="button" onclick="location.href='newshopOK?num=${dto.num}&id=${dto.id}'">등록</button></td>
				<td><button type="button" onclick="location.href='newshopNO?num=${dto.num}'">삭제</button></td>
			</tr>
			</c:forEach>
		</table>

</div>

</body>
</html>