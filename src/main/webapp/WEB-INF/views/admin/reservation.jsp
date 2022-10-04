<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Four Season Hair</title>
<style>
  .wrap{
  	width: 1200px;
 	margin: auto;
 	text-align: center;
  }
  table {
    width: 100%;
    text-align: center;
	border: 1px solid #fff;
	border-spacing: 1px;
	font-family: 'Cairo', sans-serif;
	margin: auto;
  }
  th{
  	background-color: #A6A6A6;
    color: #F6F6F6;
	padding: 10px;
  }
  td{
  	padding: 10px;
	background-color: #F6F6F6;
  
  }
</style>
<style type="text/css">
	a{
	text-decoration: none;
	color: black;
	}
	
 button {
 	cursor:pointer;
	width: 100%;
	background: none;
	border: 0;
		
	-webkit-transition-duration: 0.4s; 

  transition-duration: 0.4s;
  background-color: none;
  color: black;
  
}
button:hover {

  color: white;

}
.del_B{
 border-right: none;
}
.table_wrap{
	margin-top: 50px;
}	
</style>
<script type="text/javascript">
	function func(num) {
		var test = document.getElementById("booking" + num).value
		location.href = "bookingModify?status=" + test + "&num="+num
				}
</script>
</head>
<body>
<%@ include file="../default/header.jsp" %>
<div class="wrap">
	<div class="table_wrap">
	<h3 style="margin: auto; text-align: center;">예약 정보 확인 및 수정</h3>
	<br>
	<form method="post" action="bookingModify">
	<table style="margin: auto;">
			<tr style="background-color:#D5D5D5;">
				<th>회원 아이디</th>
				<th>회원 이름</th>
				
				<th>예약 날짜</th>
				<th>예약 시간</th>
				<th>예약 정보</th>
				<th>가격</th>
				<th>매장 번호</th>
				<th>예약 상태</th>
				<th>예약 상태</th>
				
				<th>저장</th>
				<th class="del_B">삭제</th>
			</tr>
			
			<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.id}</td>
				<td>${dto.name}</td>
				<td>${dto.rDate}</td>
				<td>${dto.rTime}</td>
				<td>${dto.info}</td>
				<td>${dto.price}원</td>
				<td>${dto.sShop}</td>
				
				<td hidden="">${dto.status}</td>
				<td>
				<c:if test="${dto.status==0}">
					<span class="booking">예약중</span>
				</c:if>	
				<c:if test="${dto.status==1 || dto.status==3}">
					<span class="bookingDone">이용완료</span>
				</c:if>
				<c:if test="${dto.status==2}">
					<span class="bookingCancel">취소 요청</span>
				</c:if>
				</td>
				<td>
				<select id="booking${dto.num}">
					<option value="0"id="0">예약중</option>
					<option value="1"id="1">이용완료</option>
					<option value="2"id="2">예약 취소</option>
				</select>
				</td>
				
				<!-- 
				
				status에 넘어오는 값에 따라서
				0:예약중
				1:이용 완료
				2:예약 취소 요청으로 나오게 함
				
				 -->
				
				<td><button type="button" onclick="func('${dto.num}')" >변경</button></td>
				<td class="del_B"><button type="button" onclick="location.href='${contextPath }/admin/bookingDel?num=${dto.num}'">삭제</button></td>
			</tr>
			</c:forEach>
		</table>

</form>
</div>
</div>

</body>
</html>