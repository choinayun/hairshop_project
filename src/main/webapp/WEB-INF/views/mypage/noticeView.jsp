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
	h1 { margin: auto;  font-size: 30px; }
</style>

</head>
<body>

	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<c:import url="../default/header.jsp"/> 
		
		<div class="title">	
			<br>
			<h1>${dto.title }</h1>
			<h4>${dto.nDate }</h4>
			<br><hr>
		</div>	
		<div class="content">
			<p>${dto.content }</p>
			<c:if test="${ dto.img != 'nan' }">
				<img width="300px" height="300px"
					src="${contextPath}/admin/download?img=${dto.img }">
			</c:if>	
		</div>

</body>
</html>