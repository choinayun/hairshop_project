<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	h1 { margin: auto;  font-size: 30px; text-align: center; }
	.likeshop_empty { height: 400px; text-align: center; margin: auto; }
</style>

</head>
<body>
 
 	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<c:import url="../default/header.jsp"/> 
	
	<br><br>
	<div class="wrap">
	
		<h1>내 관심 매장</h1>
		<br><br>
		
		<c:if test="${like_list.size() == 0}"></c:if> 
			<div class="likeshop_empty">
				<b><font color="#A6A6A6" size="5px">관심 매장이 없습니다.</font></b>
			</div>		
		
		<c:if test="${like_list.size() != 0 }"></c:if>
		<c:forEach var="dto" items="${like_list}">
			<table>
				<tr>
					<td rowspan="3">
						<img width="100px" height="100px"
							src="${contextPath }/likelist/">
					</td>
				</tr>
			</table>
		</c:forEach>
		
	</div>


</body>
</html>