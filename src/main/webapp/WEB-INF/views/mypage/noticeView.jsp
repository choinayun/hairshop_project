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
	h1 { margin: 50px 100px 20px 0; text-align: left; }
	.noticeView_div {
		width: 580px;
		height: 100%;
		margin: 10px auto 42px; }
</style>

</head>
<body>

	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<c:import url="../default/header.jsp"/> 
		
	<div class="noticeView_div">
		<h1>${dto.title }</h1>
		<h4>${dto.nDate }</h4>
		<hr>
		<p>${dto.content }</p>
		<c:if test="${ dto.img != 'nan' }">
			<img width="300px" height="300px"
				src="${contextPath}/admin/download?img=${dto.img }">
		</c:if>	
	</div>	
	
</body>
</html>