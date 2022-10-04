<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Four Season Hair</title>
<style type="text/css">
	a { text-decoration: none; color: black; }
	h1 { margin: 50px 100px 40px 100px; text-align: center; }
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
  		width: 100%;
  		font-size: 30;
  		margin-bottom: 20; }
  	.sub {
	    position: relative;
	    border: none;
	    display: inline-block;
	    padding: 15px 30px;
	    border-radius: 15px;
	    font-family: "paybooc-Light", sans-serif;
	    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	    text-decoration: none;
	    font-weight: 600;
	    transition: 0.25s;
	    width: 100%;
	    margin: 30px auto 42px; }		
	.border { border-top: 1px solid rgb(0, 0, 0, 0.2); }
	.border td { padding: 10px; }
	.border_last { border-bottom: 1px solid rgb(0, 0, 0, 0.2); }
	#addr { cursor: pointer; }
</style>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function daumPost(){
   		new daum.Postcode({
        	oncomplete: function(data) {
				if(data.addressType=="R"){
					var addr=data.roadAddress
				}else{
					var addr=data.jibunAddress
		        }
       		
       		document.getElementById("addr").value=addr }
		}).open();
	}
</script>
</head>
<body>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		function readURL(input) {
			var file = input.files[0]
			if (file != ''){
				var reader = new FileReader();
				reader.readAsDataURL(file);
				reader.onload = function (e){
					var name = input.name
					if(name == "img1"){
						$('#preview1').attr('src', e.target.result);
						$('.img_1').css({ display: 'block' })
					}else if(name == "img2"){
						$('#preview2').attr('src', e.target.result); 
						$('.img_2').css({ display: 'block' }) 
					}else if(name == "img3"){
						$('#preview3').attr('src', e.target.result); 
						$('.img_3').css({ display: 'block' }) 
					}else if(name == "img4"){
						$('#preview4').attr('src', e.target.result); 
						$('.img_4').css({ display: 'block' }) 
					}
				}
			}
		}
	</script>

		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		function daumPost(){
    		new daum.Postcode({
	        	oncomplete: function(data) {
					if(data.addressType=="R"){
						var addr=data.roadAddress
					}else{
						var addr=data.jibunAddress
			        }
        		
        		document.getElementById("addr").value=addr }
			}).open();
		}
	</script>
	
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<c:import url="../default/header.jsp"/> 
		
		<div class="registerwrap">
			<h1>입점 신청서 작성</h1>
			
			<form action="${contextPath }/mypage/registerSave" method="post"
										 enctype="multipart/form-data">
			<table border="1">
				<tr>
					<td><b>아이디</b></td>
				</tr>
				<tr>
					<td><input type="text" name="id" value="${loginUser}" readonly></td>
				</tr>
				<tr>
					<td><b>매장 이름</b></td>
				</tr>
				<tr>	
					<td><input type="text" name="s_name"></td>
				</tr>
				<tr>
					<td><b>매장 주소</b></td>
				</tr>
				<tr>	
					<td><input type="text" name="s_addr" placeholder="주소 검색" readonly onclick="daumPost()" id="addr"></td>
				</tr>
				<tr>
					<td><b>매장 번호</b></td>
				</tr>
				<tr>	
					<td><input type="text" name="s_phone"></td>
				</tr>		
				<tr>
					<td><b>이미지 첨부</b></td>
				</tr>
				<tr class="border">	
					<td>
						<input type="file" name="img1" onchange="readURL(this);"><br>
						<img id="preview1" src="#" width=100 style="display: none;" class="img_1"
									  height=100 alt="선택된 이미지가 없습니다" />
					</td>
				</tr>
				<tr class="border">
					<td>
						<input type="file" name="img2" onchange="readURL(this);" ><br>
						<img id="preview2" src="#" width=100 style="display: none;" class="img_2"
									  height=100 alt="선택된 이미지가 없습니다" />
					</td>
				</tr>
				<tr class="border">
					<td>
						<input type="file" name="img3" onchange="readURL(this);" ><br>
						<img id="preview3" src="#" width=100 style="display: none;" class="img_3"
									  height=100 alt="선택된 이미지가 없습니다" />
					</td>
				</tr>	
				<tr class="border border_last">
					<td>
						<input type="file" name="img4" onchange="readURL(this);" ><br>
						<img id="preview4" src="#" width=100 style="display: none;" class="img_4"
									  height=100 alt="선택된 이미지가 없습니다" />
					</td>
				</tr>	
				<tr>
					<td colspan="2">
						<input type="submit" class="sub" value="제출하기">
					</td>
				</tr>
			</table>
			</form>
		</div>	
	
</body>
</html>