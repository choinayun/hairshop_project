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
	h1 { margin: 50px 100px 20px 100px; text-align: center; }
	table {
	    width: 850px;
	    text-align: center;
	    border: 1px solid #fff;
	    border-spacing: 1px;
	    font-family: 'Cairo', sans-serif;
	  	margin: auto; }
	table th {
   		background-color: #A6A6A6;
   		color: #F6F6F6;
	    padding: 10px; }
	table td {
	    padding: 10px;
	    background-color: #F6F6F6;
	}
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
	
	<div class="booing_div">		
	
		<h1>예약 리스트 확인</h1>
	
		<form action="bookingModify" method="post">
		<table border="1">
			<tr>
				<th>예약<br>번호</th>
				<th>회원<br>아이디</th>
				<th>회원<br>이름</th>
				
	            <th>예약<br>날짜</th>
	            <th>예약<br>시간</th>
	            <th>시술<br>정보</th>
	            <th>예약<br>상태</th>
	            <th>예약상태<br>변경</th>
	            
	            <th>변경사항<br>저장</th>
	            <th>예약<br>취소</th>
			</tr>
			<c:if test="${list.size() == 0 }">
				<tr>
					<td colspan="10">
						<font color="#A6A6A6">예약 내역이 없습니다.</font>
					</td>
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