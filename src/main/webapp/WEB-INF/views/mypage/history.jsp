<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$.ajax({
		url: "${contextPath}/shop/shopList", type: "get",
		dataType: "json",
		success: function(data){
			
		},error: function(){
			alert("ERROR")
		}
	})
</script>
</head>
<body>
<c:import url="../default/header.jsp"/>
<div id="wrap">		
	<h1>최근 이용내역</h1>
	<div class="historyWrap">
		<table border="1">
			<tr>
				<th>글번호</th>	<th>매장 이름</th>	<th>시술 정보</th>	<th>예약 날짜</th>	<th>예약 상태</th>	<th>기타</th>	
			</tr>
			<c:forEach var="list" items="${list}">
			<c:if test="${list.status == 0}">
				<tr>
					<td>${list.num}</td>	<td class="${list.sShop}"></td>	<td>${list.info}</td>	<td>${list.rDate}</td>	<td>예약대기</td>	<td><input type="button" value="취소" onclick="location.href='${contextPath}/mypage/statusUpdate?num=${list.num}'"></td>
				</tr>
			</c:if>
			<c:if test="${list.status == 1}">
				<tr>
					<td>${list.num}</td>	<td class="${list.sShop}"></td>	<td>${list.info}</td>	<td>${list.rDate}</td>	<td>이용완료</td>	<td><input type="button" value="리뷰작성" onclick="location.href='${contextPath}/review/reviewForm?num=${list.num}&sNum=${list.sShop}'"></td>
				</tr>
			</c:if>
			<c:if test="${list.status == 2}">
				<tr>
					<td>${list.num}</td>	<td class="${list.sShop}"></td>	<td>${list.info}</td>	<td>${list.rDate}</td>	<td>취소완료</td>	<td></td>
				</tr>
			</c:if>
			<c:if test="${list.status == 3}">
				<tr>
					<td>${list.num}</td>	<td class="${list.sShop}"></td>	<td>${list.info}</td>	<td>${list.rDate}</td>	<td>이용완료</td>	<td><input type="button" value="리뷰작성" disabled></td>
				</tr>
			</c:if>
			</c:forEach>
		</table>
	</div>
</div>
</body>
</html>