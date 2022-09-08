<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
</style>
</head>
<body>
<%@ include file="../default/header.jsp" %>


<div class="wrap" style="text-align: center;" >
<h3 style="text-align: left;">공지사항 작성</h3>

<br>
<br>
	
	<form action="N_F" method="post" enctype="multipart/form-data">
	<input type="text" name="title" id="title" size="30" placeholder="제목"><br>
	<br><br>
	<textarea rows="30px" cols="50px" id="content" name="content">
	</textarea>
	<br><br>
	<input type="file" name="img" id="img">
	<input type="submit" value="저장">
	<button type="button"onclick="history.back()">취소</button>
	</form>
	
</div>
</body>
</html>