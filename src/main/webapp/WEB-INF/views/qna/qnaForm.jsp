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
.wrap{
	height: 500px;
	width: 800px;
 	margin: auto;
 	text-align: center;
	
}
	a { text-decoration: none; color: black; }
	table { border-collapse: collapse; margin: auto; }
	h1 { margin: auto; font-size: 30px; }
	.img_1 { display: none; }
	textarea { border: none; resize: none; }
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
		
		<div class="wrap">
		
			<div class="top">
					<a href="${contextPath }/mypage/main"><span>뒤로가기</span></a>
					<a href="${contextPath }/"><span>홈</span></a>
			</div>
			<br><br>
			
			<div class="qnawrap">
			<h1>문의하기</h1>
			<br>
			<form action="${contextPath }/qna/qnaSave" method="post"
										 enctype="multipart/form-data">
			<table border="1">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" value="${loginUser }" readonly ></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="content" rows="10" cols="50"></textarea></td>
				</tr>
				<tr>
					<th>이미지 첨부</th>
					<td>
						<input type="file" name="img" onchange="readURL(this);" ><br>
						<img id="preview" src="#" width=100 class="img_1"
									  height=100 alt="선택된 이미지가 없습니다" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="제출하기">
					</td>
				</tr>
			</table>
			</form>
			</div>
		</div>
		<br><br>

	<c:import url="../default/footer.jsp"/>
		
</body>
</html>