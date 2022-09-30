<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Four Season Hair</title>

<style type="text/css">
	a { text-decoration: none; color: black; }
	h1 { margin: 50px 100px 20px 100px; text-align: center; }
	.title { font-size: 20px; }
	.ndate { font-size: 13px; color: #A6A6A6; }
	.part {		
		width: 800px;
		height: 100%;
		margin: 30px auto 42px; }
	.part ul { padding: 20px; border-top: 1px solid rgb(0, 0, 0, 0.2); cursor: pointer; }
	.part ul:last-child { border-bottom: 1px solid rgb(0, 0, 0, 0.2); }
	.part ul li { list-style: none; }
</style>

</head>
<body>

	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<c:import url="../default/header.jsp"/> 
		
		<div class="noticeWrap">	

			<h1>공지사항</h1>
			
			<div class="part">
				<c:forEach var="dto" items="${list }">
					<ul onclick="location.href='${contextPath }/mypage/noticeView?num=${dto.num }'">
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