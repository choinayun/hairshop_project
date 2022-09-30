<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Four Season Hair</title>
<style>
.id_ok{
color:#008000;
display: none;
}

.id_no{
color:#FF0000;
display: none;
}
</style>

<style>
.pw_ok{
color:#008000;
display: none;
}

.pw_no{
color:#FF0000;
display: none;
}
</style>

<style>
  .wrap{
	width: 800px;
 	margin: auto;
 	text-align: center;
	}
  body{
    background-color:rgba(234,234,234,0.12);

   }
  table {
  	
    width: 580px;
    height: 100%;
    margin: 10px auto 42px;
    padding: 0 69px;
    border: 0px solid rgba(0,0,0,0.12);
    font-size: 15px;
    box-sizing: border-box;
    border: 0px solid #444444;
    border-collapse: collapse;
  }
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
    opacity: 1;
    
  }
  input{
 	
  	border: 1;
  	height: 50px;
  	width: 90%;
  	font-size: 30;
  	margin-bottom: 20;
  }
  a{
   color: black;
   text-decoration: none;
  }
  #search{
  margin: 0 0 0;
  padding: 0;
  }
  #joinbutton{
  	width: 50%;
  	margin: auto;
  }
  </style>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
function id_chk(){
    var id = $('#id').val();
    $.ajax({
        url:'idchk', //Controller에서 요청 받을 주소///member/
        type:'post', //POST 방식으로 전달
        data:{id:id},
        success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
            if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                $('.id_ok').css("display","inline-block"); 
                $('.id_no').css("display", "none");
            }else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                $('.id_no').css("display","inline-block");
                $('.id_ok').css("display", "none");

                $('#id').val('');
            }
        },
        error:function(){
            alert("에러");
        }
    });
    };

</script>


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
    	  $('.pw_ok').css("display","inline-block"); 
          $('.pw_no').css("display", "none");
        //alert("비밀번호가 일치합니다");
        return true;
      }

    }
  </script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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
        	document.getElementById("addr").value=addr
        }
    }).open();
}
</script>
<script type="text/javascript">
function userchk() {
    
    var id = $("#id").val();
    var pw = $("#pw").val();
    var name = $("#name").val();
    var email = $("#email").val();
    var phone = $("#phone").val();
    var addr = $("#addr").val();
   
    if(id.length == 0){
        alert("아이디를 입력해주세요"); 
        $("#id").focus();
        return false;
    }
    
    if(pw.length == 0){
        alert("비밀번호를 입력해주세요"); 
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

</head>
<body>
<%@ include file="../default/header.jsp" %>
<div class="wrap">
	
	<div id="joinInput">
		<form action="register" method="post">
			<table border="1">
			
				<tr>
					<td>아이디<br></td> 
					</tr>
				<tr>
					<td><input type="text" name="id" id="id" size="20"  onchange="id_chk()"></td>
				</tr>
				
				<tr>	
					<td colspan="2">
						<span class="id_ok">사용 가능한 아이디입니다.</span>
						<span class="id_no">사용중인 아이디 입니다.</span>
					</td>
					
				
				</tr>
				
				<tr>
					<td>비밀번호<br></td> 
				</tr>
				<tr>
					<td><input type="password" name="pw" id="pw" size="20" ></td>
				</tr>
				
				<tr>
					<td>비밀번호 확인<br></td> 
				</tr>
				<tr>
					<td><input type="password" name="pw2" id="pw2" size="20" onchange="pwchk()"></td>
					
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
					<td><input type="text" name="name" id="name" size="20" placeholder="이름을 입력해주세요"></td>
				</tr>
				
				<tr>
					<td>이메일<br></td> 
				</tr>
				<tr>
					<td><input type="text" name="email" id="email" size="20" placeholder="****@***.com"></td>
				</tr>
				
				<tr>
					<td>지역 설정<br></td> 
				</tr>
				
				<tr>
					<td><input type="text" name="addr" id="addr" size="20" placeholder="서울특별시  종로구 홍길동로 123길" 
					readonly="readonly"onclick="daumPost()"style="cursor:pointer;">
				
				</tr>
				
				
				
				
				<tr>
					<td>전화번호<br></td> 
				</tr>
				<tr>
				<td><input type="text" name="phone" id="phone" size="20" placeholder="010-****-****"></td>
				</tr>
			</table>
		</div>
			
		    <div id="joinbutton">
		<input type="submit" value="회원가입" onclick="userchk();">
		   
		</form>
 </div>
	
</div>
</body>
</html>