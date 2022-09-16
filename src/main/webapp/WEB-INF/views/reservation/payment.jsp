<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
</head>
<body>
<c:import url="default/header.jsp"/>




<!-- 선택한 예약일시를 출력할 위치 -->
<input id="selectedDate" name="selectedDate" value="" readonly="readonly">

<!-- 총 예약금액을 출력할 위치  -->
<input id="totalPrice" name="totalPrice" value="" readonly="readonly">
<c:import url="default/footer.jsp"/>
</body>
</html>