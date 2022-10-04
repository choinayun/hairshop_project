<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Four Season Hair</title>
<style type="text/css">

.wrap{
	width: 800px;
 	margin: auto;
 	text-align: center;
}
a {
	text-decoration: none;
	color: black;
}
button{
	width: 600px;
	font-size:20px;
	margin-top:30px;
	border: 0;
	cursor:pointer;
	-webkit-transition-duration: 0.4s; 
	padding: 10px;
	
  transition-duration: 0.4s;
  background-color: white;
  color: black;
  border: 1px solid #e7e7e7;
}
button:hover {

  background-color: #e7e7e7;

}

</style>

</head>
<body>
<%@ include file="../default/header.jsp" %>


<c:set var="contextPath" 
			value="${ pageContext.request.contextPath}"/>
<div class="wrap">
	<img src="${contextPath }/resources/images/admin.png" style="margin-top: 50px;"></img>
	
	<div class="icon1">
		
		<button type="button"onclick="location.href='${contextPath }/admin/shoplist'">매장 목록 불러오기</button>
	</div>
	<div class="icon2">
		
		<button type="button"onclick="location.href='${contextPath }/admin/newshop'">매장 등록 신청 목록</button>
	</div>
	
	<div class="icon3">
		
		<button type="button"onclick="location.href='${contextPath }/admin/noticeWrite'">공지사항 작성</button>
	</div>
	
	<div class="icon4">
		
		<button type="button"onclick="location.href='${contextPath }/member/memberinfo'">회원관리</button>
	</div>
	
	<div class="icon5">
		
		<button type="button"onclick="location.href='${contextPath }/admin/reservation'">예약 리스트 확인</button>
	</div>
	
	<br><br>
	
</div>

</body>
</html>