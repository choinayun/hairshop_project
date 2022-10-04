<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Four Season Hair</title>

<style type="text/css">
	h1 { margin: 50px 100px 20px 100px; text-align: center; }
	.reviewForm_div { 
		width: 580px;
		height: 100%;
		margin: 10px auto 42px; }
	input {
  		border: 1;
  		height: 50px;
  		width: 100%;
  		font-size: 30;
  		}	
  	.btn,.sub {
	    position: relative;
	    border: none;
	    display: inline-block;
	    padding: 15px 30px;
	    border-radius: 15px;
	    font-family: "paybooc-Light", sans-serif;
	    box-shadow: 0 15px 15px rgba(0, 0, 0, 0.2);
	    text-decoration: none;
	    font-weight: 600;
	    transition: 0.25s;
	    width: 100%;
	    margin: 10px auto 15px; }		
	b { font-size: 20px; }
	hr { 
	 	border: 0;
	 	border-top: 3px double #8c8c8c; } 
  		
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
					$('.img_').css({ display: 'block' })
				}
			}
		}
	</script>
	
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<c:import url="../default/header.jsp"/> 
	
	<div class="reviewForm_div">
		<h1>리뷰 작성</h1>
		 
		<form action="${contextPath }/review/reviewSave" method="post"
										 enctype="multipart/form-data">
			<b>작성자</b>
			<input type="text" value="${loginUser }" name="id" readonly><br><br>
			<b>방문한 헤어샵</b>
			<input type="text" name="s_name" value="${shop.sName}" readonly><br><br>
			<b>시술 정보</b>
			<input type="text" name="info" value="${reservation.info}" readonly><br><br>
			
			<b>별점</b>&nbsp;&nbsp;
			<select name="grade">
				<option value="1" selected>-- 선택 --</option>
				<option value="1">★</option>
				<option value="2">★★</option>
				<option value="3">★★★</option>
				<option value="4">★★★★</option>
				<option value="5">★★★★★</option>
			</select><br><br>
			
			<b>글쓰기</b><br>
			<textarea name="content" rows="10" cols="80"></textarea><br><br>
			
			<b>이미지 첨부</b><br>
			<input type="file" name="img" onchange="readURL(this);" >
			<img id="preview" src="#" width=100 style="display: none;" class="img_"
							  height=100 alt="선택된 이미지가 없습니다" />
			<br>
			<hr>					  
			<input type="hidden" name="s_num" value="${shop.sNum}">
			<input type="hidden" name="num" value="${reservation.num}">
			<input type="submit" value="작성하기" class="sub">
			<input type="button" value="목록보기" class="btn"
				   onclick="location.href='${contextPath }/review/reviewAllList?id=${loginUser}'">
		</form>
	</div>
	

</body>
</html>