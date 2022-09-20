<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#header { margin: 0 auto; width: 800px; text-align: center; }
	#back_btn { position: relative; top: 0; left: -20px; width: 50px; height: 50px; }
	#back_btn img { cursor: pointer; }
	#header_area { padding: 0 50px 50px 50px; }
	#nav ul { list-style: none; display: flex; }
	#nav ul li { width: 150px; padding-top: 10px; padding-bottom: 10px; font-size: 14pt; cursor: pointer; }
	.nav_btn { border-bottom: 1px solid rgb(0, 0, 0, 0.2); }
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function headerLoad(){
		
		//shopList load
		$(".align_select_set").css({ fontWeight: 'normal' })
		if(${result == 1}){
			$(".align_btn1").css({ fontWeight: 'bold' })
		}else if(${result == 2}) {
			$(".align_btn2").css({ fontWeight: 'bold' })
		}else if(${result == 3}) {
			$(".align_btn3").css({ fontWeight: 'bold' })
		}else if(${result == 4}) {
			$(".align_btn4").css({ fontWeight: 'bold' })
		}else {
			$(".align_btn0").css({ fontWeight: 'bold' })
		}
		
		var path = window.location.pathname
		if("${path}/" == path){
			$("#back_btn").css({ display: 'none' })
			$("#header_area").css({ paddingTop: '50px' })
		}else {
			$("#back_btn").css({ display: 'block' })
			$("#header_area").css({ paddingTop: '0px' })
		}
		
		var arrPath = path.split("/")
		$(".nav_btn").css({ borderBottom: '1px solid rgb(0, 0, 0, 0.2)' })
		if(arrPath[2] == "") {
			$(".nav_btn1").css({ borderBottom: '2px solid black', fontWeight: 'bold' })
		}else if(arrPath[2] == "shop") {
			$(".nav_btn2").css({ borderBottom: '2px solid black', fontWeight: 'bold' })
		}else if(arrPath[2] == "reservation") {
			$(".nav_btn3").css({ borderBottom: '2px solid black', fontWeight: 'bold' })
		}else if(arrPath[2] == "mypage" || arrPath[2] == "admin"){
			$(".nav_btn4").css({ borderBottom: '2px solid black', fontWeight: 'bold' })
		}else if(arrPath[2] == "member") {
			$(".nav_btn5").css({ borderBottom: '2px solid black', fontWeight: 'bold' })
		}
	}
	
	function back_btn(){
		location.href = "../"
	}
	
</script>
</head>
<body onload="headerLoad()">
<div id="header">
	<div id="header_area">
		<div id="back_btn">
			<img src="${path}/resources/images/arrow.png" onclick="back_btn()">
		</div>
		<h1>HairShop</h1>
	</div>
	<div id="nav">
		<ul>
			<li onclick="location.href='${path}/'" class="nav_btn1 nav_btn" style="border-bottom: 2px solid black;">홈</li>
			
			<li onclick="location.href='${path}/shop/shopListForm'" class="nav_btn2 nav_btn">내주변</li>
			<li onclick="location.href='${path}/qna/qnaList'" class="nav_btn5 nav_btn">Q&A</li>
			<li onclick="location.href='${path}/'" class="nav_btn3 nav_btn">예약</li>
			<c:if test="${loginUser.equals('admin')}">
				<li onclick="location.href='${path}/admin/admin'" class="nav_btn4 nav_btn">관리자페이지</li>
			</c:if> 
			<c:if test="${!loginUser.equals('admin')}">
				<li onclick="location.href='${path}/'" class="nav_btn4 nav_btn">마이 페이지</li>
			</c:if>
			<c:if test="${loginUser == null}">
				<li onclick="location.href='${path}/member/login'" class="nav_btn5 nav_btn">로그인</li>
			</c:if>
			<c:if test="${loginUser != null}">
				<li onclick="location.href='${path}/member/logout'" class="nav_btn5 nav_btn">로그아웃</li>
			</c:if>
		</ul>
	</div>
</div>
</body>
</html>