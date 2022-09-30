<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Four Season Hair</title>

<style type="text/css">
	h1 { margin: 50px 100px 20px 100px; text-align: center; }
	table {
	    width: 700px;
	    text-align: center;
	    border: 1px solid #fff;
	    border-spacing: 1px;
	    font-family: 'Cairo', sans-serif;
	  	margin: auto;
	}
	table th {
   		background-color: #A6A6A6;
   		color: #F6F6F6;
	    padding: 10px;
	}
	table td {
	    padding: 10px;
	    background-color: #F6F6F6;
	}		
	
</style>

<body>
<c:import url="../default/header.jsp"/>

	<div class="history_div">
	<h1>최근 이용내역</h1>
	
		<table>
			<thead>
				<tr>
					<th>글번호</th><th>매장 이름</th><th>시술 정보</th>
					<th>예약 날짜</th>	<th>예약 상태</th>	<th>기타</th>
				</tr>
			</thead>
			<c:forEach var="list" items="${list}">
				<c:if test="${list.status == 0}">
					<tr>
						<td>${list.num}</td><td>${list.sName}</td><td>${list.info}</td>
						<td>${list.rDate}</td><td>예약대기</td><td><input type="button" value="취소" onclick="location.href='${contextPath}/mypage/statusUpdate?num=${list.num}'"></td>
					</tr>
				</c:if>
				<c:if test="${list.status == 1}">
					<tr>
						<td>${list.num}</td><td>${list.sName}</td><td>${list.info}</td>
						<td>${list.rDate}</td><td>이용완료</td><td><input type="button" value="리뷰작성" onclick="location.href='${contextPath}/review/reviewForm?num=${list.num}&sNum=${list.sShop}'"></td>
					</tr>
				</c:if>
				<c:if test="${list.status == 2}">
					<tr>
						<td>${list.num}</td><td>${list.sName}</td><td>${list.info}</td>
						<td>${list.rDate}</td><td>취소완료</td><td></td>
					</tr>
				</c:if>
				<c:if test="${list.status == 3}">
					<tr>
						<td>${list.num}</td><td>${list.sName}</td><td>${list.info}</td>
						<td>${list.rDate}</td><td>이용완료</td><td></td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</div>
	
</body>
</html>