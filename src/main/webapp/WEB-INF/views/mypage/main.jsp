<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Four Season Hair</title>

<style type="text/css">
	html, body { margin: 0; height: 100%; }
	footer { position: absolute; bottom: 0; width: 100%; height: 90px; }
	#wrap { width: 800px; margin: auto; text-align: center; }
	.mypagewrap { width: 600px; margin: auto; margin-top: 100px; margin-bottom: 200px; }
	.mypagewrap button{
		width: 100%; height:50px; font-size:20px; padding: 10px;
		border: 0; cursor:pointer; -webkit-transition-duration: 0.4s; 
		transition-duration: 0.4s; background-color: white; color: black; border: 1px solid #e7e7e7;
	}
	.mypagewrap button:hover { background-color: #e7e7e7; }
</style>

</head>
<body> 
	
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<c:import url="../default/header.jsp"/> 
	
	<c:if test="${loginUser == null }">
		<script type="text/javascript">
			alert('로그인 먼저 진행해야합니다.');
			document.location.href="../member/login";
		</script>
	</c:if> 
	
	<div id="wrap">	
		<div class="mypagewrap">
			<button type="button" onclick="location.href='${contextPath }/mypage/infoModify?id=${loginUser }'">회원정보 수정</button><br><br>
			<button type="button" onclick="location.href='${contextPath }/mypage/likeShop?id=${loginUser}'">관심 매장</button><br><br>
			<button type="button" onclick="location.href='${contextPath }/mypage/history'">이용 내역</button><br><br>
			<button type="button" onclick="location.href='${contextPath }/review/reviewAllList'">리뷰 목록</button><br><br>
			<button type="button" onclick="location.href='${contextPath }/mypage/notice'">공지사항</button><br><br>
			<button type="button" onclick="location.href='${contextPath }/mypage/registerShop'">입점 신청</button><br><br>
			<button type="button" onclick="location.href='${contextPath }/mypage/secession'">회원 탈퇴</button><br><br>
			<c:if test="${dto.position != 0}">
				<button type="button" onclick="location.href='${contextPath }/mypage/booking?id=${loginUser }'">매장 관리</button>	
			</c:if>
		</div>
	</div>

</body>
</html>