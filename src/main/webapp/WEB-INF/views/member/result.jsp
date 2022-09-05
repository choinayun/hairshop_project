<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

 button {
 	
	width: 20%;
	background: white;
	
	border: 1px solid #e7e7e7;	
	-webkit-transition-duration: 0.4s; 

    transition-duration: 0.4s;
    background-color: white;
    color: black;
  
}
button:hover {

  background-color: #e7e7e7;

}

</style>
</head>
<body>
<%@ include file="../default/header.jsp" %>
<div class="wrap">
 <h3 style="text-align: center; margin-top: 150px;">회원님의 아이디는[ ${id} ]입니다.<br></h3>
 <br>
 <br>
 <br>
 <br>
 <button style="margin-left: 300px;"><a href="login" style="text-decoration:none;color: black;">로그인으로 이동</button>
 <button><a href="findpw"style="text-decoration:none;color: black;">비밀번호 찾기</button>
</div>
</body>
</html>