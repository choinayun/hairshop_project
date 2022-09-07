<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  table {
    width: 100%;
    border: 1px solid #A6A6A6;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #A6A6A6;
  }
</style>
<style type="text/css">
	a{
	text-decoration: none;
	color: black;
	}
	
 button {
	width: 100%;
	background: white;
	border: 0;
		
	-webkit-transition-duration: 0.4s; 

  transition-duration: 0.4s;
  background-color: white;
  color: black;
  
}
button:hover {

  background-color: #e7e7e7;

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
	<h3 style="margin: auto; text-align: left;">예약 정보 확인 및 수정 페이지</h3>
	<br>
	<form method="post" action="bookingModify">
	<table border="1"style="margin: auto;">
			<tr>
				<th>예약 번호</th>
				<th>회원 아이디</th>
				<th>회원 이름</th>
				
				<th>예약 날짜</th>
				<th>예약 시간</th>
				<th>예약 정보</th>
				<th>가격</th>
				<th>매장 고유 번호</th>
				<th>예약 상태</th>
				<th>예약 상태 변경</th>
				
				<th>변경 사항 저장</th>
				<th>예약 취소</th>
			</tr>
			
			<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.num}</td>
				<td>${dto.id}</td>
				<td>${dto.name}</td>
				<td>${dto.rDate}</td>
				<td>${dto.rTime}</td>
				<td>${dto.info}</td>
				<td>${dto.price}</td>
				<td>${dto.sShop}</td>
				
				<td hidden="">${dto.status}</td>
				<td>
				<c:if test="${dto.status==0}">
					<span class="booking">예약중</span>
				</c:if>	
				<c:if test="${dto.status==1}">
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
				<td><button type="button"><a href="bookingDel?num=${dto.num}">삭제</a></td>
			</tr>
			</c:forEach>
		</table>

</form>

</div>

</body>
</html>