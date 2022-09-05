<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	* { margin: 0; }
	.wrap { width: 1000px; margin: auto; }
	.header { width: 1000px; }
	.navdiv { width: 100%; background-color: none; }
	nav { background-color: none; width: 1000px;}
	nav ul { list-style: none; display: flex;
			justify-content: end; }
	nav ul li { padding: 10px; }
	
	nav ul li a { text-decoration:none; color:black; }
	nav ul li a:hover{
	color: black; border-bottom: 2px solid black;
	transition : all 0.25s; padding-bottom: 3px;
	}
	.title{ text-shadow: 10px 10px 15px black; 
	    
		font-size: 70pt;
		text-align: center;
		margin-top: 0; 
		padding-bottom: 20px;
		color: black;
		font-family: Gabriola;
	}
	.content { margin-top: 50px; }
</style>

</head>
<body>

<!--  넘어오는 아이디:${id }-->
	<div class="wrap">
		<div class="header">
			<h1 class="title">HAIR</h1>
		</div>
	</div>
<%@ taglib prefix="c"
			uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" 
		value="${pageContext.request.contextPath}"/>
	<div class="navdiv">
		<div class="wrap">
			<nav>
				<ul>
<li> <a href="${contextPath }/member/main">HOME</a> </li>

<li> 
	<c:if test="${loginUser.equals('admin')}">
	<a href="${contextPath }/admin/admin">관리자 페이지</a>
	</c:if>
	
	<c:if test="${!loginUser.equals('admin')}">
	<a href="${contextPath }/member/memberInfo">마이 페이지</a>
	</c:if>
	
</li>

<li> 
	<c:if test="${loginUser == null }">
		<a href="${contextPath }/member/login">LOGIN</a> 
	</c:if>
	<c:if test="${loginUser != null }">
		<a href="${contextPath }/member/logout">LOGOUT</a>
	</c:if>
</li>
				</ul>
			</nav>
		</div>
	</div>
</body>
</html>







