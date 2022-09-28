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
	h1 { margin: auto; text-align: center; font-size: 30px; }
	table { margin: auto; }
</style> 
	
</head>
<body>

	<script type="text/javascript">
	   function func(num) {
	      var test = document.getElementById("booking" + num).value
	      location.href = "bookingModify?status=" + test + "&num="+num
	   }
	</script>
	
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<c:import url="../default/header.jsp"/> 
			
	<br><br>
	<h1>예약 리스트 확인</h1>
	<br>
	   
	<div class="booingWrap">
		<form action="bookingModify" method="post">
		<table border="1">
			<tr>
				<td>예약 번호</td>
				<td>회원 아이디</td>
				<td>회원 이름</td>
				
	            <td>예약 날짜</td>
	            <td>예약 시간</td>
	            <td>시술 정보</td>
	            <td>예약 상태</td>
	            <td>예약 상태 변경</td>
	            
	            <td>변경 사항 저장</td>
	            <td>예약 취소</td>
			</tr>
			<c:if test="${list.size() == 0 }">
				<tr>
					<th colspan="10">
						<font color="#A6A6A6">예약 내역이 없습니다.</font>
					</th>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${list}">
			<tr>
	            <td>${dto.num}</td>
	            <td>${dto.id}</td>	            
	            <td>${dto.name}</td>	            
	            <td>${dto.rDate}</td>
	            <td>${dto.rTime}</td>
	            <td>${dto.info}</td>
	            
	            <td hidden="">${dto.status}</td>
				<td>
					<c:if test="${dto.status == 0}">
						<span class="booking">예약중</span>
					</c:if>	
					<c:if test="${dto.status == 1}">
						<span class="bookingDone">이용완료</span>
					</c:if>
					<c:if test="${dto.status == 2}">
						<span class="bookingCancel">예약 취소</span>
					</c:if>
				</td>
				
				<td>
				<select id="booking${dto.num}">
					<option value="0"id="0">예약중</option>
					<option value="1"id="1">이용완료</option>
					<option value="2"id="2">예약 취소</option>
				</select>
				</td>
				
	            <td><button type="button" onclick="func('${dto.num}')" >변경</button></td>
	            <td><button type="button" onclick="location.href='${contextPath}/mypage/bookingDel?num=${dto.num}'">삭제</button></td>
	            
			</tr>
			</c:forEach>
		</table>
		</form>
	</div>

</body>
</html>