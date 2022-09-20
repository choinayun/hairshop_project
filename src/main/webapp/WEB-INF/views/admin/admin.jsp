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
a {
	text-decoration: none;
	color: black;
}
button{
	width: 80%;
	height:50px;
	font-size:20px;
	border: 0;
	cursor:pointer;
	-webkit-transition-duration: 0.4s; 

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
<div class="wrap">
	
	<br>
	<br>
	<br>
	<button type="button"onclick="location.href='${contextPath }/admin/shoplist'">매장 목록 불러오기</button><br><br>
	<button type="button"onclick="location.href='${contextPath }/admin/newshop'">매장 등록 신청 목록</button><br><br>
	<button type="button"onclick="location.href='${contextPath }/admin/noticeWrite'">공지사항 작성</button><br><br>
	<button type="button"onclick="location.href='${contextPath }/member/memberinfo'">회원관리</button><br><br>
	<button type="button"onclick="location.href='${contextPath }/admin/shoplist'">Q&A</button><br><br>
	<button type="button"onclick="location.href='${contextPath }/admin/reservation'">예약 리스트 확인</button>
	<!-- Q&A위치 다시 잡기 -->
	<!-- 진행현황(이용취소,예약,시술완료[-1,0,1]) -->
	
	<br><br>
	
</div>
</body>
</html>