<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Four Season Hair</title>
<script type="text/javascript">
	var main_index = 0
	var main_img = ["main_div_img1", "main_div_img2", "main_div_img3"]
	
	function main_left_btn(){
		if(main_index > 0) {
			main_index--
			$("." + main_img[main_index]).css({ position: 'absolute', top: '0', left: '0', transition: '0.5s' })
		}	
	}
	
	function main_right_btn(){
		if(main_index < 3) {
			main_index++
			$("." + main_img[main_index]).css({ position: 'absolute', top: '0', left: '100%', transition: '0.5s' })
		}		
	} 
</script>

<style type="text/css">
	#wrap { margin: 0 auto; margin-top: 20px; margin-bottom: 100px; text-align: center; }
	#main_img_area { position: relative; text-align: center; margin-bottom: 100px; }
	#main_img_area img { border-bottom-left-radius: 10px; border-bottom-right-radius: 10px; }
	#grade_img_area { width: 1300px; margin: auto; margin-bottom: 100px; }
	#review_img_area { width: 1300px; margin: auto; }
	#img_area h2 { padding: 10px; }
	.img_div { 
		display: inline-block; width: 45%; text-align: left; 
		margin-top: 5px; border: 1px solid rgb(0, 0, 0, 0.6); border-radius: 10px; 
	}
	.img_div div img { border-radius: 10px; vertical-align: bottom; }
	.img_div .img_flex { display: flex; height: 196px; cursor: pointer; }
	.main_arrow_left { 
		position: absolute; top: 50%; left: 0; transform: translate(0, -50%);
		display: inline-block; width: 100px; height: 100px; background-color: rgb(0, 0, 0, 0.4); 	
		cursor: pointer;
	}
	.main_arrow_right {  
		position: absolute; top: 50%; right: 0%; transform: translate(0, -50%);
		display: inline-block; width: 100px; height: 100px; background-color: rgb(0, 0, 0, 0.4);
		cursor: pointer;
	}
	.main_arrow_left img { margin-top: 30px; }
	.main_arrow_right img { margin-top: 30px; }
	.main_shop_info { width: 290px; margin: auto; text-align: left; }
	.main_shop_info div { padding: 10px; }
	.shop_info_icon { display: flex; }
	.shop_info_icon dl { display: flex; margin-right: 20px; }
	.shop_info_icon dd { margin-left: 10px; }
	.main_img_line { 
		position: absolute; bottom: 4%; left: 50%;
		transform: translate(-50%, 0);
	}
	.main_img_line div { display: inline-block; background-color: rgb(0, 0, 0, 0.4); width: 40px; height: 4px; }
	.main_img_line .line1 { background-color: black; }
</style>
</head>
<body>

<c:import url="default/header.jsp"/>
<div id="wrap">
	<div id="main_img_area">
		<img src="${path}/resources/images/main_img1.png" width="100%" height="700px" class="main_img1 main_img">
		<img src="${path}/resources/images/main_img2.png" width="100%" height="700px" class="main_img2 main_img">
		<img src="${path}/resources/images/main_img3.jpg" width="100%" height="700px" class="main_img3 main_img">
		<div class="main_arrow_left" onclick="main_left_btn()">
			<img src="${path}/resources/images/main_arrow_left.png" width="60%" height="50%">
		</div>
		<div class="main_arrow_right" onclick="main_right_btn()">
			<img src="${path}/resources/images/main_arrow_right.png" width="60%" height="50%">
		</div>
		<div class="main_img_line">
			<div class="line1 line"></div>
			<div class="line2 line"></div>
			<div class="line3 line"></div>
		</div>
	</div>
	<div id="img_area">
		<div id="grade_img_area">
			<div class="grade_title">
				<h2>GRADE ORDER</h2>
			</div>
			<c:forEach var="grade" items="${gradeImg}">
				<div class="grade_img_info img_div">
					<div class="img_flex" onclick="location.href='${path}/shop/shopInfo?sNum=${grade.sNum}'">
						<img src="${path}/shop/download?fileName=${grade.img1}" width="50%" height="100%">
						<div class="main_shop_info">
							<div class="shop_info"><b>${grade.sName}</b></div>
							<div class="shop_info">${grade.sAddr}</div>
							<div class="shop_info">${grade.sPhone}</div>
							<div class="shop_info_icon">
								<dl><dt><img src="${path}/resources/images/review_icon2.png"></dt><dd>${grade.cnt}</dd></dl>
								<dl><dt style="color: rgb(0, 0, 0, 0.7);">★</dt><dd>${grade.grade}</dd></dl>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div id="review_img_area">
			<div class="review_title">
				<h2>REVIEW ORDER</h2>
			</div>
			<c:forEach var="review" items="${reviewImg}">
				<div class="review_img_info img_div">
					<div class="img_flex" onclick="location.href='${path}/shop/shopInfo?sNum=${review.sNum}'">
						<img src="${path}/shop/download?fileName=${review.img1}" width="50%" height="100%">
						<div class="main_shop_info">
							<div class="shop_info"><b>${review.sName}</b></div>
							<div class="shop_info">${review.sAddr}</div>
							<div class="shop_info">${review.sPhone}</div>
							<div class="shop_info_icon">
								<dl><dt><img src="${path}/resources/images/review_icon2.png"></dt><dd>${review.cnt}</dd></dl>
								<dl><dt style="color: rgb(0, 0, 0, 0.7);">★</dt><dd>${review.grade}</dd></dl>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<c:import url="default/footer.jsp"/>
</body>
</html>