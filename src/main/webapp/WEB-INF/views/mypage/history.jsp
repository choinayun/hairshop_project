<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	h1 { margin: auto;  font-size: 30px; }
	a { text-decoration: none; color: black; }
</style>

</head>
<body>

 	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<c:import url="../default/header.jsp"/> 
		
		<div class="top">
			<a href="${contextPath }/mypage/main"><span>뒤로가기</span></a>
			<a href="${contextPath }/"><span>홈</span></a>
		</div>
		
		<br><br>
		<h1>최근 이용내역</h1><br>
				
		<div class="historyWrap">
			<table border="1">
				<tr>
					<th>이용 날짜</th>
					<th>이용 시간</th>
					<th>샵 이름</th>
					<th>시술 정보</th>
					<th>시술 가격</th>
				</tr>
				
				<c:if test="${list.size() == 0 }">
					<tr>
						<th colspan="5">
							<font color="#A6A6A6">최근 이용내역이 없습니다.</font>
						</th>
					</tr>
				</c:if>
				
				<c:forEach var="dto" items="${list}">
					<c:choose>
						<c:when test="${dto.status == 1 }">
							<tr>
								<th>${dto.rDate }</th>
								<th>${dto.rTime }</th>
								<th>${dto.sShop }</th>
								<th>${dto.info }</th>
								<th>${dto.price }</th>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<th colspan="5">
									<font color="#A6A6A6">최근 이용내역이 없습니다.</font>
								</th>
							</tr>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
			</table>
		</div>
	
	
</body>
</html>