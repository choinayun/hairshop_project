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
		width: 400px;
 		margin: auto;
 		text-align: center;
}
textarea { resize: none; }
#title_ { width: 250px; }
</style>
</head>
<body>
<%@ include file="../default/header.jsp" %>


<div class="wrap" style="text-align: center;" >
<h2 style="text-align: center;">공지사항</h2>

	<form action="N_F" method="post" enctype="multipart/form-data">
	<input type="text" name="title" id="title_" placeholder="제목"><br>
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