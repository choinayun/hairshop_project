<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="ht">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
footer {
	position: relative;
	bottom: 0px;
	background-color: black;
	color: #dddddd;
	text-align: center;
	margin: auto 0;
	width: 100%;
	font-size: x-small;
	z-index: 2;
	bottom: 0;
}

.ht { height: 100%; }

.copyright {
	font-size: small;
}

.topBtn {
	position: fixed;
	bottom: 130px;
	right: 20px;
	z-index: 3
}

.a {
	text-decoration-line: none;
	color: white;
}

#wrap {
	min-height: 100%;
	position: relative;
	padding-bottom: 60px;
}
</style>
</head>
<body class="ht">
<c:set var="contextPath" 
			value="${ pageContext.request.contextPath}"/>
	<div class="topBtn">
		<input type="button" value="Top" onclick="location.href='#'" >
	</div>
<footer>
	<div class="container" style="padding: 30px 30px 0 30px;">
		<div class="f_text">
				<a class="a" href="member/memberQ&A">문의사항</a> ● <a class="a" href="#">공지사항</a> ● <a class="a" href="${contextPath}/hairshop_policy">이용약관</a> ● <a class="a" href="#">개인정보처리방침</a>
		</div>
		<div class="f_copy">
			<p>
				회사이름 : HairShop ㅣ 대표 : 최나윤 ㅣ 사업자등록번호 : 123-45-67890 ㅣ 주소 : 서울특별시 종로구 돈화문로 26 (단성사빌딩 3층)ㅣ 전화 : 02)123-4567 ㅣ 이메일 : hairshop@naver.com
			</p>
		</div>
		
		<hr style="margin: 30px 0 0 0;">
		<div class="copyright">
			COPYRIGHTⓒHair Shop All rights reserved.
		</div>
	</div>
</footer>
</body>
</html>