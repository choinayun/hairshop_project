<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Four Season Hair</title>
<style type="text/css">

 button {
 	
	width: 20%;
	background: white;
	cursor:pointer;
	border: 1px solid #e7e7e7;	
	-webkit-transition-duration: 0.4s; 

    transition-duration: 0.4s;
    background-color: white;
    color: black;
  
}
button:hover {

  background-color: #e7e7e7;

}
}
</style>

</head>
<body>

<%@ include file="../default/header.jsp" %>
	<div class="wrap">
	
		<c:if test="${id.equals('없음')}">
			<h3 style="text-align: center; margin-top: 150px;">가입된 정보가 없습니다.</h3>
		</c:if>
		
		<c:if test="${!id.equals('없음')}">
			<h3 style="text-align: center; margin-top: 150px;">회원님의 아이디는[ ${id} ]입니다.</h3>
		</c:if>
		
		

 <br>
 <br>
 <br>
 <br>

 <button style="margin-left: 300px;" type="button"onclick="location.href='${contextPath }/member/login'">로그인으로 이동</button>
 <button type="button" onclick="location.href='${contextPath }/member/findpw'">비밀번호 찾기</button>
</div>
</body>
</html>