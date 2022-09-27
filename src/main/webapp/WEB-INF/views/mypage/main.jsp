<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	.mypagewrap { width: 1000px; margin: auto; text-align: center; }
	.mypagewrap button{ 
			width: 50%;
			height:50px;
			font-size:20px;
			border: 0;
			
			-webkit-transition-duration: 0.4s; 
		
		 	transition-duration: 0.4s;
		 	background-color: white;
		    color: black;
		    border: 1px solid #e7e7e7; }
	.mypagewrap button:hover { background-color: #e7e7e7; }
	.mypagewrap button { margin-bottom: 20px; padding: 10px; cursor: pointer; }
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
	
	<br><br> 
	
		<div class="mypagewrap">
			<button type="button" onclick="location.href='${contextPath }/mypage/infoModify?id=${loginUser }'">회원정보 수정</button>
			<button type="button" onclick="location.href='${contextPath }/mypage/likeShop'">관심 매장</button>
			<button type="button" onclick="location.href='${contextPath }/mypage/history'">이용 내역</button>
			<button type="button" onclick="location.href='${contextPath }/review/reviewAllList'">리뷰 목록</button>
			<button type="button" onclick="location.href='${contextPath }/mypage/notice'">공지사항</button>
			<button type="button" onclick="location.href='${contextPath }/mypage/registerShop'">입점 신청</button>
			<button type="button" onclick="location.href='${contextPath }/mypage/secession'">회원 탈퇴</button>
			<c:if test="${dto.position != 0}">
				<button type="button" onclick="location.href='${contextPath }/mypage/booking?id=${loginUser }'">매장 관리</button>	
			</c:if>
		</div>
	 <c:import url="../default/footer.jsp"/>
</body>
</html>