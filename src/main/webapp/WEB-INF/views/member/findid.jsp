<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
background-color:rgba(234,234,234,0.12);

}
  table {
    
    width: 580px;
    height: 100%;
    margin: 100px auto 42px;
    padding: 0 69px;
    border: 0px solid rgba(0,0,0,0.12);
    font-size: 12px;
    box-sizing: border-box;
    border: 0px solid #444444;
    border-collapse: collapse;
  }
  th, td {
   position: relative;
    z-index: 1;
    width: 100%;
    
    padding: 10px 0 8px;
    border: 0 none;
    margin-left:10px;
    line-height: 25px;
    color: #191919;
    background-color: transparent;
    letter-spacing: 0;
    box-sizing: border-box;
    outline: 0 none;
    caret-color: #191919;
    opacity: 1;
    
  }
  input{
  margin-left:10px;
  	
  	height: 50px;
  	width: 90%;
  	font-size: 40;
  }
  a{
   color: black;
   text-decoration: none;
  }
  #findButton{
   text-align:center;
   width: 50%;
   padding-right:20px;
   margin: 10px 230px 20px;
  }
  </style>

</head>
<body>
<%@ include file="../default/header.jsp" %>
<div class="wrap">
	
	<form action="find_id" method="post">
		<table border="1">
			<tr>
				<td>이름</td>
			</tr>
			<tr>
			<td><input type="text" name="name" id="name" size="20" placeholder="name"></td>
			</tr>
			<tr>
				<td>핸드폰 번호</td>
			</tr>
			<tr>
				<td><input type="text" name="phone" id="phone" size="20" placeholder="phone"></td>
			</tr>
		</table>
		<div id="findButton">
		<input type="submit" value="아이디 찾기" >
		<input type="button" value="취소하기" onclick="history.back()">
		</div>
	</form>





</div>
</body>
</html>