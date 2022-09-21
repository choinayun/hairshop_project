<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	* { margin: 0; }
	.mypagewrap { width: 1000px; margin: auto; text-align: center; }
	a { text-decoration: none; color: black; }
	button{ 
			width: 50%;
			height:50px;
			font-size:20px;
			border: 0;
			
			-webkit-transition-duration: 0.4s; 
		
		 	transition-duration: 0.4s;
		 	background-color: white;
		    color: black;
		    border: 1px solid #e7e7e7; }
	button:hover { background-color: #e7e7e7; }
	
</style>

</head>
<body> 

	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<c:import url="../default/header.jsp"/> 
	
	<c:if test="${loginUser == null }">
		<script type="text/javascript">
			alert('로그인 먼저 진행해야합니다');
			document.location.href="../member/login";
		</script>
	</c:if> 
	
	<c:if test="${loginUser != null }" > </c:if>
	<br><br>
	
		<div class="mypagewrap">
			<button type="button"><a href="${contextPath }/mypage/infoModify?id=${loginUser}">회원정보 수정</a></button><br><br>
			<button type="button"><a href="${contextPath }/mypage/likeShop">관심 매장</a></button><br><br>
			<button type="button"><a href="${contextPath }/mypage/booking">예약 현황</a></button><br><br>
			<button type="button"><a href="${contextPath }/mypage/history">이용 내역</a></button><br><br>
			<button type="button"><a href="${contextPath }/review/reviewAllList">리뷰 목록</a></button><br><br>
			<button type="button"><a href="${contextPath }/mypage/notice">공지사항</a></button><br><br>
			<button type="button"><a href="${contextPath }/mypage/registerShop">입점 신청</a></button><br><br>
			<button type="button"><a href="${contextPath }/mypage/secession">회원 탈퇴</a></button><br><br>
		</div>

</body>
</html>