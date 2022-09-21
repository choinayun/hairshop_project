<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	a { text-decoration: none; color: black; }
	h1 { margin: auto;  font-size: 30px; }
	.title { font-size: 20px; }
	.ndate { font-size: 13px; color: #A6A6A6; }
</style>

</head>
<body>

	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<c:import url="../default/header.jsp"/> 
		
		<div class="top">
			<a href="${contextPath }/mypage/main"><span>뒤로가기</span></a>
			<a href="${contextPath }/"><span>홈</span></a>
		</div>
		
		<div class="noticeWrap">	
			<br>
			<h1>공지사항</h1>
			<br>
			
			<div class="part">
				<c:forEach var="dto" items="${list }">
					<ul>
						<li>
							<a href="${contextPath }/mypage/noticeView?num=${dto.num }">
							<span class="title"><b>${dto.title }</b></span>
							</a><br>
							<span class="ndate">${dto.nDate }</span>
						</li>
					</ul>
				</c:forEach>
			</div>
		</div>
		
</body>
</html>