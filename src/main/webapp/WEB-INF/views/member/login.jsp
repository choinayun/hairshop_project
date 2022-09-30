<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Four Season Hair</title>
<style>
  table {
    text-align:center;
    width: 580px;
    height: 100%;
    margin: 200px auto 42px;
    padding: 0 69px;
    border: 1px solid rgba(0,0,0,0.12);
    font-size: 12px;
    box-sizing: border-box;
    border: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
   position: relative;
    z-index: 1;
    width: 100%;
    
    padding: 10px 0 8px;
    border: 0 none;
    
    line-height: 25px;
    color: #191919;
    background-color: transparent;
    letter-spacing: 0;
    box-sizing: border-box;
    outline: 0 none;
    caret-color: black;
    opacity: 1;
    
  }
  input{
  	border: none;
  	height: 50px;
  	width: 90%;
  	font-size: 40;
  }
  a{
   color: black;
   text-decoration: none;
  }
 
  #loginB{
   width: 80%;
	background: white;
	border:1px solid #e7e7e7;
		
	-webkit-transition-duration: 0.4s; 

  transition-duration: 0.4s;
  background-color: white;
  color: black;
  }
  #loginB:hover{
   background-color: #e7e7e7;
  }
  </style>
  
</head>
<body>
<%@ include file="../default/header.jsp" %>
<div class="wrap">

  <div>
	<form action="<%=request.getContextPath() %>/member/login_chk" method="post">
	
		<table border="1" >
			<tr>
				<td><input type="text" name="id" id="id" size="40" placeholder="id"> </td>
		
			</tr>
			<tr>
			<td><hr></td>
			</tr>
			
			<tr>
				<td><input type="password" name="pw" id="pw" size="40" placeholder="password"> </td>
			
			</tr>
			<tr>
			<td><hr></td>
			</tr>
	 		<tr>
	 			<td><input type="submit" value="로그인" id="loginB"><br>
	 			<div id="atag">
	 			<a href="<%=request.getContextPath()%>/member/findid">아이디 </a>
	 			·
	 			<a href="<%=request.getContextPath()%>/member/findpw">비밀번호 찾기</a><br>
	 			
	 			<a href="<%=request.getContextPath()%>/member/join">회원가입</a>
	 			</div>
	 			</td>
	 		</tr>
	 		
		</table>

	</form>
  </div>
  </div>
</body>
</html>