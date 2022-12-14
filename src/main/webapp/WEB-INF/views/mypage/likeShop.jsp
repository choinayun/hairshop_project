<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Four Season Hair</title>

<style type="text/css">
	h1 { margin: 50px 100px 40px 100px; text-align: center; }
	.likeshop_empty { height: 400px; text-align: center; margin: auto; }
	.like_div { margin: 20px 0 0 0; }
	table { 
		border-collapse: collapse;
		width: 800px;
		height: 100%;
		margin: 10px auto 42px; 
	}
	.like_div table tr { border-top: 1px solid rgb(0, 0, 0, 0.2); cursor: pointer; }
	.like_div table tr:last-child { border-bottom: 1px solid rgb(0, 0, 0, 0.2); } 
	.like_div table tr td { padding: 20px; text-align: center; }
</style>

</head>
<body>
 
 	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<c:import url="../default/header.jsp"/> 
	

		<h1>내 관심 매장</h1>
		
		<c:if test="${like_list.size() == 0}">
			<div class="likeshop_empty">
				<b><font color="#A6A6A6" size="5px">관심 매장이 없습니다.</font></b>
			</div>		
		</c:if> 
		
		<div class="like_div">	
		<c:if test="${like_list.size() != 0 }">
			<table>
				<c:forEach var="dto" items="${like_list}">
					
					<tr onclick="location.href='${contextPath}/shop/shopInfo?sNum=${dto.sNum}'">
						<td>
							<img width="200px" height="150px"
								src="${contextPath}/mypage/download?img=${dto.img1}">
						</td>
						<td>
							<b>${dto.sName }</b><br>
							${dto.grade } / ${dto.sAddr }<br>
							${dto.sPhone }<br></a>
						</td>
					</tr>
					
				</c:forEach>
			</table>
		</c:if>
		</div>

</body>
</html>