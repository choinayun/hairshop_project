<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Four Season Hair</title>
<style>
.wrap{
	width: 800px;
 	margin: auto;
 	text-align: center;
 	margin-bottom: 100px;
}
  table {
        width: 100%;
    	text-align: center;
	    border: 1px solid #fff;
	    border-spacing: 1px;
	    font-family: 'Cairo', sans-serif;
	  	margin: auto;
  }
  th{
    	background-color: #A6A6A6;
   		color: #F6F6F6;
	    padding: 10px;
  }
  td{
  		padding: 10px;
	    background-color: #F6F6F6;
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
	background: none;
	border: 0;
		
	-webkit-transition-duration: 0.4s; 

 	transition-duration: 0.4s;
    background-color: none;
    color: black;
  
}
button:hover {

 	color: white;

}
.del_td { border-right: none; }
</style>
</head>
<body>
<%@ include file="../default/header.jsp" %>
<div class="wrap">
	<h3>매장 리스트</h3>
	
	<table style="margin: auto;">
			<tr style="background-color:#D5D5D5;">
				<th>매장 아이디</th>
				<th>매장 이름</th>
				<th width="300px">매장 주소</th>
				<th>매장 번호</th>
				
				<th>수정</th>
				<th class="del_td">삭제</th>
			</tr>
			<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.sNum}</td>
				<td>${dto.sName}</td>
				<td>${dto.sAddr}</td>
				<td>${dto.sPhone}</td>
				
				<td><button type="button"onclick="location.href='${contextPath }/admin/modifyshop?sNum=${dto.sNum}'">수정</button></td>
				<td class="del_td"><button type="button"onclick="location.href='${contextPath }/admin/deleteshop?sNum=${dto.sNum}'">삭제</button></td>
			</tr>
			</c:forEach>
		</table>
	
<!-- <a href="modifyshop?sNum=${dto.sNum}">
<a href="deleteshop?sNum=${dto.sNum}"> -->
</div>

</body>
</html>