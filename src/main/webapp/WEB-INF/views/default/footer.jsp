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
	color: rgb(0, 0, 0, 0.7);
	text-align: center;
	margin: 0 auto;
	width: 1000px;
	font-size: 7pt;
	z-index: 2;
	bottom: 0;
	padding: 10px 10px 0 10px;
}

.f_text a { font-weight: bold; text-decoration: none; color: black; }

.ht { height: 100%; }

.copyright { font-size: 9pt; border-top: 1px solid rgb(0, 0, 0, 0.4); padding-top: 10px; padding-bottom: 10px; }

.topBtn {
	position: fixed;
	bottom: 130px;
	right: 20px;
	z-index: 3
}

#wrap {
	min-height: 100%;
	position: relative;
	padding-bottom: 60px;
}
</style>
</head>
<body class="ht">
<c:set var="contextPath" value="${ pageContext.request.contextPath}"/>
<footer>
	<div class="container">
		<div class="f_text">
				<a href="#">문의사항</a> · <a class="a" href="#">공지사항</a> · <a href="${contextPath}/hairshop_policy">이용약관</a> · <a href="#">개인정보처리방침</a>
		</div>
		<div class="f_copy">
			<p>
				회사이름 : HairShop ㅣ 대표 : 최나윤 ㅣ 사업자등록번호 : 123-45-67890 ㅣ 주소 : 서울특별시 종로구 돈화문로 26 (단성사빌딩 3층)ㅣ 전화 : 02)123-4567 ㅣ 이메일 : hairshop@naver.com
			</p>
		</div>
		<div class="copyright">
			COPYRIGHTⓒHair Shop All rights reserved.
		</div>
	</div>
</footer>
</body>
</html>