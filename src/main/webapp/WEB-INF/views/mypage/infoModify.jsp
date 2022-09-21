<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	a { text-decoration: none; color: black; }
	h1 { margin: auto; font-size: 30px; text-align: center; }
	table {
		width: 580px;
		height: 100%;
		margin: 10px auto 42px;
		padding: 0 69px;
		border: 0px solid rgba(0,0,0,0.12);
		font-size: 15px;
		box-sizing: border-box;
		border: 0px solid #444444;
		border-collapse: collapse; }
	th, td {
		position: relative;
		z-index: 1;
		width: 100%;  
		padding: 2px 3px 5px;
		border: 0 none; 
		line-height: 25px;
		color: #191919;
		background-color: transparent;
		letter-spacing: 0;
		box-sizing: border-box;
		outline: 0 none;
		caret-color: #191919;
		opacity: 1; }	
	input {
  		border: 1;
  		height: 50px;
  		width: 90%;
  		font-size: 30;
  		margin-bottom: 20; }		
  		
	.pw_ok{ color:#008000; display: none; }
	.pw_no{ color:#FF0000; display: none; }
	
</style>

</head>
<body>

	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
		function pwchk() {
	    	var p1 = document.getElementById('pw').value;
	    	var p2 = document.getElementById('pw2').value;
	      
			if( p1 != p2 ) {
		        //alert("비밀번호가 일치 하지 않습니다");
		        $('.pw_no').css("display","inline-block"); 
		        $('.pw_ok').css("display", "none");
		        return false;
		    } else{ 
		    	//alert("비밀번호가 일치합니다");
		    	$('.pw_ok').css("display","inline-block"); 
		        $('.pw_no').css("display", "none");
		        return true;
		    }
		}
	</script>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		function daumPost(){
    		new daum.Postcode({
	        	oncomplete: function(data) {
	        		console.log(data.roadAddress)
	           		console.log(data.jibunAddress)
	      
					if(data.addressType=="R"){
						var addr=data.roadAddress
					}else{
						var addr=data.jibunAddress
			        }
        		
        		document.getElementById("addr").value=addr }
			}).open();
		}
	</script>	
	
	<script type="text/javascript">
		function modifychk() {
		    var pw = $("#pw").val();
		    var name = $("#name").val();
		    var email = $("#email").val();
		    var phone = $("#phone").val();
		    var addr = $("#addr").val();
		
		    if(pw.length == 0){
		        alert("비밀번호를 입력해 주세요"); 
		        $("#pw").focus();
		        return false;
		    }
	
		    if(name.length == 0){
		        alert("이름을 입력해주세요");
		        $("#name").focus();
		        return false;
		    }
		    
		    if(email.length == 0){
		        alert("이메일을 입력해주세요");
		        $("#email").focus();
		        return false;
		    }
		    
		    if(phone.length == 0){
		        alert("전화번호를 입력해주세요");
		        $("#phone").focus();
		        return false;
		    }
		    
		    if(addr.length == 0){
		        alert("주소를 입력해주세요");
		        $("#addr").focus();
		        return false;
		    }
		}
	</script>
	
 	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<c:import url="../default/header.jsp"/> 
		
		<div class="wrap">
		
			<div class="top">
					<a href="${contextPath }/mypage/main"><span>뒤로가기</span></a>
					<a href="${contextPath }/"><span>홈</span></a>
			</div>
			<br><br>
			
			<div id="modifyWrap">
			<h1>회원 정보 수정</h1>
			<br>
		
			<form action="memberInfoModify" method="post">
			<table border="1">
				<tr>
					<td>아이디<br></td> 
					</tr>
				<tr>
					<td><input type="text" name="id" id="id" size="20"  value="${loginUser }" readonly></td>
				</tr>
				<tr>
					<td>비밀번호<br></td> 
				</tr>
				<tr>
					<td><input type="password" name="new_pw" id="pw" size="20" >
					<input type="hidden" value="${dto.pw }" name="old_pw"></td>
				</tr>
				<tr>
					<td>비밀번호 확인<br></td> 
				</tr>
				<tr>
					<td><input type="password" name="new_pw2" id="pw2" size="20" onchange="pwchk()"></td>
				</tr>
				<tr>
					<td colspan="2">
						<span class="pw_ok">비밀번호가 일치합니다.</span>
						<span class="pw_no">비밀번호가 일치하지 않습니다.</span>
					</td>
				</tr>
				<tr>
					<td>이름<br></td> 
				</tr>
				<tr>
					<td><input type="text" name="name" id="name" size="20" value="${dto.name }"></td>
				</tr>
				<tr>
					<td>이메일<br></td> 
				</tr>
				<tr>
					<td><input type="text" name="email" id="email" size="20" value="${dto.email }"></td>
				</tr>
				<tr>
					<td>지역 설정<br></td> 
				</tr>
				<tr>
					<td><input type="text" name="addr" id="addr" size="20"  value="${dto.addr }" readonly="readonly">
					<button type="button" id="search" onclick="daumPost()">검색</button></td>
				</tr>
				<tr>
					<td>전화번호<br></td> 
				</tr>
				<tr>
				<td><input type="text" name="phone" id="phone" size="20" value="${dto.phone }"></td>
				</tr>
			</table>
			
			<input type="submit" value="수정하기" onclick="modifychk();">
				
			</form>
			</div>
		</div>	

</body>
</html>