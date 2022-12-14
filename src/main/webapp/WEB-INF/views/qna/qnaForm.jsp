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
	a { text-decoration: none; color: black; }
	.wrap{ height: 500px; width: 800px; margin: auto; text-align: center; }
	textarea { resize: none; }
	.img_1 { display: none; }
	h1 { margin: 50px 100px 40px 100px; text-align: center; }
	.qnaForm_div { 
		width: 580px;
		height: 100%;
		margin: 10px auto 42px; }
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
  		width: 98%;
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
</style>

</head>
<body>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		function readURL(input) {
			var file = input.files[0]
			console.log(file)
			if (file != ''){
				var reader = new FileReader();
				reader.readAsDataURL(file);
				reader.onload = function (e){
					$('#preview').attr('src', e.target.result); 
					$('.img_1').css({ display: 'block' })
				}
			}
		}
	</script>

	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<c:import url="../default/header.jsp"/> 

		<div class="qnaForm_div">
			<h1>?????? ??????</h1>

			<form action="${contextPath }/qna/qnaSave" method="post"
										 enctype="multipart/form-data">
			<table border="1">
				<tr>
					<td><b>?????????</b></td>
				</tr>
				<tr>					
					<td><input type="text" name="id" value="${loginUser }" readonly ></td>
				</tr>
				<tr>
					<td><b>??????</b></td>
				</tr>
				<tr>	
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<td><b>??????</b></td>
				</tr>
				<tr>	
					<td><textarea name="content" rows="10" cols="79"></textarea></td>
				</tr>
				<tr>
					<td><b>????????? ??????</b></td>
				</tr>
				<tr class="border">	
					<td>
						<input type="file" name="img" onchange="readURL(this);" ><br>
						<img id="preview" src="#" width=100 class="img_1"
									  height=100 alt="????????? ???????????? ????????????" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" class="sub" value="????????????">
					</td>
				</tr>
			</table>
			</form>
		</div>

		
</body>
</html>