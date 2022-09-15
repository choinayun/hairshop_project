<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
<style type="text/css">
a{
	text-decoration: none;
	color: black;
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
	<h3 style="text-align: left;">매장 리스트</h3>
	<br>
	
	<br>
	<table border="1" style="margin: auto;">
			<tr>
				<th>매장 아이디</th>
				<th>매장 이름</th>
				<th width="300px">매장 주소</th>
				<th>매장 번호</th>
				
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.sNum}</td>
				<td>${dto.sName}</td>
				<td>${dto.sAddr}</td>
				<td>${dto.sPhone}</td>
				
				<td><button type="button"onclick="location.href='${contextPath }/admin/modifyshop?sNum=${dto.sNum}'">수정</button></td>
				<td><button type="button"onclick="location.href='${contextPath }/admin/deleteshop?sNum=${dto.sNum}'">삭제</button></td>
			</tr>
			</c:forEach>
		</table>
	
<!-- <a href="modifyshop?sNum=${dto.sNum}">
<a href="deleteshop?sNum=${dto.sNum}"> -->
</div>

</body>
</html>