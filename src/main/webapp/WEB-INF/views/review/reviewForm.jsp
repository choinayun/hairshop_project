<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	h1 { margin: auto; font-size: 30px; }
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
				}
			}
		}
	</script>
	
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<c:import url="../default/header.jsp"/> 
	
	<br><br>
	<div class="wrap">
		<h1>리뷰 작성</h1>
		<br>
		 
		<form action="${contextPath }/review/reviewSave" method="post"
										 enctype="multipart/form-data">
			<b>작성자</b>
			<input type="text" value="${loginUser }" name="id" readonly><br>
			<b>방문한 헤어샵</b>
			<input type="text" name="s_name" value="${shop.sName}" readonly><br>
			<b>시술 정보</b>
			<input type="text" name="info" value="${reservation.info}" readonly><br>
			
			<b>별점</b>
			<select name="grade">
				<option value="" selected>-- 선택 --</option>
				<option value="1">★</option>
				<option value="2">★★</option>
				<option value="3">★★★</option>
				<option value="4">★★★★</option>
				<option value="5">★★★★★</option>
			</select><br>
			
			<b>글쓰기</b><br>
			<textarea name="content" rows="10" cols="50"></textarea><br>
			<b>이미지 첨부</b><br>
			<input type="file" name="img" onchange="readURL(this);" ><br>
			<img id="preview" src="#" width=100
							  height=100 alt="선택된 이미지가 없습니다" />
			<br><hr> 						  
			<input type="hidden" name="s_num" value="${shop.sNum}">
			<input type="hidden" name="num" value="${reservation.num}">
			<input type="submit" value="작성하기">
			<input type="button" value="목록보기" 
				   onclick="location.href='${contextPath }/review/reviewAllList'">
		</form>
	</div>
	

</body>
</html>