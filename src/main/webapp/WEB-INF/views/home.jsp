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
	#wrap { margin: 0 auto; width:800px; margin-top: 20px; margin-bottom: 100px; text-align: center; }
	#main_img_area { text-align: center; }
	#main_img_area img { margin-top: 40px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px; }
	#img_area { background-color: rgb(189, 189, 189, 0.4); }
	.img_div { display: inline-block; width: 45%; border: 1px solid rgb(0, 0, 0, 0.6); border-radius: 10px; text-align: left; }
	.img_div img { border-radius: 10px; }
</style>
</head>
<body>

<c:import url="default/header.jsp"/>
<div id="wrap">
	<div id="main_img_area">
		<img src="${path}/resources/images/main_img.png" width="100%" height="500px" class="main_img">
	</div>
	<div id="img_area">
		<div id="grade_img_area">
			<c:forEach var="grade" items="${gradeImg}">
				<div class="grade_img_info img_div">
					<img src="${path}/shop/download?fileName=${grade.img1}" width="50%" height="100%">
				</div>
			</c:forEach>
		</div>
		<div id="review_img_area">
			<c:forEach var="review" items="${reviewImg}">
				<div class="review_img_info img_div">
					<img src="${path}/shop/download?fileName=${review.img1}" width="50%" height="100%">
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<c:import url="default/footer.jsp"/>

</body>
</html>