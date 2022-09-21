<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	a { text-decoration: none; color: black; }
	table { border-collapse: collapse; }
	h1 { margin: auto; font-size: 30px; }
	.registerwrap { height: 500px; }
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
					$('#preview1').attr('src', e.target.result); 
					$('#preview2').attr('src', e.target.result); 
					$('#preview3').attr('src', e.target.result); 
					$('#preview4').attr('src', e.target.result); 
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
			<div class="registerwrap">
			<h1>입점 신청서 작성</h1>
			<br>
			<form action="${contextPath }/mypage/registerSave" method="post"
										 enctype="multipart/form-data">
			<table border="1">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" value="${loginUser }" readonly></td>
				</tr>
				<tr>
					<th>매장 이름</th>
					<td><input type="text" name="s_name"></td>
				</tr>
				<tr>
					<th>매장 주소</th>
					<td><input type="text" name="s_addr"></td>
				</tr>
				<tr>
					<th>매장 번호</th>
					<td><input type="text" name="s_phone"></td>
				</tr>		
				<tr>
					<th rowspan="4">이미지 첨부</th>
					<td>
						<input type="file" name="img1" onchange="readURL(this);" ><br>
						<img id="preview1" src="#" width=100
									  height=100 alt="선택된 이미지가 없습니다" />
					</td>
				</tr>
				<tr>
					<td>
						<input type="file" name="img2" onchange="readURL(this);" ><br>
						<img id="preview2" src="#" width=100
									  height=100 alt="선택된 이미지가 없습니다" />
					</td>
				</tr>
				<tr>
					<td>
						<input type="file" name="img3" onchange="readURL(this);" ><br>
						<img id="preview3" src="#" width=100
									  height=100 alt="선택된 이미지가 없습니다" />
					</td>
				</tr>	
				<tr>
					<td>
						<input type="file" name="img4" onchange="readURL(this);" ><br>
						<img id="preview4" src="#" width=100
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

	
</body>
</html>