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
    border: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #444444;
    text-align: center;
  }
</style>
<style type="text/css">
a{
	text-decoration: none;
	color: black;
}
 button {
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
				<td>${dto.s_num}</td>
				<td>${dto.s_name}</td>
				<td>${dto.s_addr}</td>
				<td>${dto.s_phone}</td>
				
				<td><button type="button"><a href="modifyshop?s_num=${dto.s_num}">수정</a></td>
				<td><button type="button"><a href="deleteshop?s_num=${dto.s_num }">삭제</a></td>
			</tr>
			</c:forEach>
		</table>
	

</div>

</body>
</html>