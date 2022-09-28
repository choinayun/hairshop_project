<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Four Season Hair</title>

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
		
		<c:if test="${like_list.size() == 0}">
			<div class="likeshop_empty">
				<b><font color="#A6A6A6" size="5px">관심 매장이 없습니다.</font></b>
			</div>		
		</c:if> 
		<div class="likeWrap">
			<c:if test="${like_list.size() != 0 }">
				<table>
					<c:forEach var="dto" items="${like_list}">
					
						<tr>
							<td rowspan="2">
								<img width="200px" height="150px"
									src="${contextPath}/mypage/download?img=${dto.img1}">
							</td>
						</tr>
						<tr>
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
	</div>


</body>
</html>