<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body { margin: 0; }
	#header { margin: 0 auto; border-bottom: 1px solid rgb(0, 0, 0, 0.2); }
	#header_flex { margin: auto; width: 1300px; height: 100px; text-align: center; display: flex; padding: 20px 0 20px 0; }
	#header_area { margin: auto; }
	#title { margin-right: 80px; }
	#nav { margin-top: 20px; margin: auto; }
	#nav ul { padding: 0; margin-right: 0; list-style: none; display: flex; }
	#nav ul li { width: 200px; padding-top: 10px; padding-bottom: 10px; font-size: 14pt; cursor: pointer; }
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div id="header">
	<div id="header_flex">
		<div id="header_area">
			<div id="title">
				<a href="${path}/"><img src="${path}/resources/images/title1.png" width="150px" height="100px"></a>
			</div>
		</div>
		<div id="nav">
			<ul>
				<li onclick="location.href='${path}/'" class="nav_btn1 nav_btn">HOME</li>
				
				<li onclick="location.href='${path}/shop/shopListForm'" class="nav_btn2 nav_btn">AROUND</li>
				<li onclick="location.href='${path}/qna/qnaList'" class="nav_btn3 nav_btn">Q&A</li>
				<c:if test="${loginUser.equals('admin')}">
					<li onclick="location.href='${path}/admin/admin'" class="nav_btn4 nav_btn">MANAGER</li>
				</c:if> 
				<c:if test="${!loginUser.equals('admin')}">
					<li onclick="location.href='${path}/mypage/main'" class="nav_btn4 nav_btn">MYPAGE</li>
				</c:if>
				<c:if test="${loginUser == null}">
					<li onclick="location.href='${path}/member/login'" class="nav_btn5 nav_btn">LOGIN</li>
				</c:if>
				<c:if test="${loginUser != null}">
					<li onclick="location.href='${path}/member/logout'" class="nav_btn5 nav_btn">LOGOUT</li>
				</c:if>
			</ul>
		</div>
	</div>
</div>
</body>
</html>