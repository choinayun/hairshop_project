<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
function userchk(){
    var id = $("#id").val();
    $.ajax({
        url:'userchk?id='+id, //Controller에서 요청 받을 주소///member/
        type:'get', //POST 방식으로 전달

        success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
            if(cnt == 1){ //cnt가 1이면 -> 해당 유저의 이메일로 이메일 전송
            	console.log(cnt)
               alert('회원님의 이메일로 인증번호를 발송하였습니다.');
            }else { // cnt가 0일 경우 -> 가입한 이력이 없는 아이디
               alert('입력하신 정보를 확인해주세요');

                $('#id').val('');
            }
        },
        error:function(){
            alert("에러");
        }
    });
    };


</script>
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

<body>
<%@ include file="../default/header.jsp" %>
<div class="wrap">

<form action="userchk" method="post">
	<table border="1">
		<tr>
			<td>아이디</td>
		</tr>
		
		<tr>
		<td><input type="text" name="id" id="id" size="20" placeholder="아이디를 입력하세요" ></td>
		</tr>
		</table>
<div id="findButton">
	<button type="button"onclick="userchk()">비밀번호 찾기</button>
	<button type="button"onclick="history.back()">취소</button>
</div>

</form>

</div>
</body>
</html>