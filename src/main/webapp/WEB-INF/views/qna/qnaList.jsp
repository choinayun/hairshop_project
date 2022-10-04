<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Four Season Hair</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
	html, body { margin: 0; height: 100%; }
	footer { position: absolute; bottom: 0; width: 100%; height: 90px; }
	h1 { margin: 50px 100px 40px 100px; text-align: center; }
	
	table {
	    width: 900px;
	    text-align: center;
	    border: 1px solid #fff;
	    border-spacing: 1px;
	    font-family: 'Cairo', sans-serif;
	  	margin: auto;
	}
  	th {
    	background-color: #A6A6A6;
   		color: #F6F6F6;
	    padding: 10px; }
 	td {
 		padding: 10px;
	    background-color: #F6F6F6; }

	a {
   		color: black;
   		text-decoration: none; }
	.sub  {
		cursor:pointer;
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
	    background-color: #a3a1a1;
	    color: #e3dede;
	    margin: 20px auto 10px;  }
	.btn { text-align: center; }
  	button:hover { color: white; }
</style>
</head>
<body>
	<%@ include file="../default/header.jsp" %>
	<div class="table_div">
	
		<h1>문의하기 목록</h1>
	
		<table style="margin: auto;">
			<tr style="border-bottom:1px solid #A6A6A6; background-color:#D5D5D5">
				<th>글 번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성 날짜</th>
			</tr>
			<c:forEach var="dto" items="${list}">
			<c:if test="${dto.id == admin}">
			<tr hidden="">
				<td>${dto.num}</td>
				<td><a href="${contextPath }/qna/contentView?num=${dto.num}">${dto.title}</a></td>
				<td>${dto.id}</td>
				<td>${dto.qDate}</td>
				
			</tr>
			</c:if>
			<c:if test="${dto.id != admin}">
				<tr>
				<td>${dto.num}</td>
				<td><a href="${contextPath }/qna/contentView?num=${dto.num}">${dto.title}</a></td>
				<td>${dto.id}</td>
				<td>${dto.qDate}</td>
				</tr>
			</c:if>
			</c:forEach>
		</table>
		<div class="btn">
			<button type="button" class="sub" onclick="location.href='${contextPath }/qna/qnaForm'">작성</button>
		</div>
	</div>

</body>
</html>