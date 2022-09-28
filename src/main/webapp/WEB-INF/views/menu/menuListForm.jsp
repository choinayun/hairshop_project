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
	#wrap { margin: auto; text-align: center; width: 1200px; height: 2300px; }
	.menu { 
		font-size: 14pt; text-align: left; 
		padding-top: 20px; padding-bottom: 20px;
		border-bottom: 1px solid rgba(0, 0, 0, 0.1); 
	}
	#menu_list { margin: auto; margin-top: 30px; height: 1000px; width: 800px; }
	.menu_info { 
		border-bottom: 1px solid rgba(0, 0, 0, 0.1); font-size: 18pt; 
		text-align: left; padding: 10px; cursor: pointer; 
	}
</style>
</head>
<body>
<c:import url="../default/header.jsp"/>
<div id="wrap">
	<div id="menu_list">
		<div class="menu"><strong>커트</strong></div>
		<c:forEach var="menu" items="${menuList}">
			<c:if test="${menu.category == 0}">
				<div class="menu_info" onclick="location.href='${path}/menu/infoChoice'">
					<div class="menu_name">${menu.info}</div>
					<div class="menu_price">${menu.price}</div>
				</div>
			</c:if>
		</c:forEach>
		<div class="menu"><strong>펌</strong></div>
		<c:forEach var="menu" items="${menuList}">
			<c:if test="${menu.category == 1}">
				<div class="menu_info" onclick="location.href='${path}/menu/infoChoice'">
					<div class="menu_name">${menu.info}</div>
					<div class="menu_price">${menu.price}</div>
				</div>
			</c:if>
		</c:forEach>
		<div class="menu"><strong>염색</strong></div>
		<c:forEach var="menu" items="${menuList}">
			<c:if test="${menu.category == 2}">
				<div class="menu_info" onclick="location.href='${path}/menu/infoChoice'">
					<div class="menu_name">${menu.info}</div>
					<div class="menu_price">${menu.price}</div>
				</div>
			</c:if>
		</c:forEach>
		<div class="menu"><strong>클리닉</strong></div>
		<c:forEach var="menu" items="${menuList}">
			<c:if test="${menu.category == 3}">
				<div class="menu_info" onclick="location.href='${path}/menu/infoChoice'">
					<div class="menu_name">${menu.info}</div>
					<div class="menu_price">${menu.price}</div>
				</div>
			</c:if>
		</c:forEach>
		<div class="menu"><strong>스타일링</strong></div>
		<c:forEach var="menu" items="${menuList}">
			<c:if test="${menu.category == 4}">
				<div class="menu_info" onclick="location.href='${path}/menu/infoChoice'">
					<div class="menu_name">${menu.info}</div>
					<div class="menu_price">${menu.price}</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
</div>
<c:import url="../default/footer.jsp"/>
</body>
</html>