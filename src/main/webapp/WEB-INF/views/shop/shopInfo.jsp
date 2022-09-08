<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function load(){
		var grade = ${shopInfo.grade}
		var index = 0	
		if(grade > 0 && grade < 1) {
			$(".star_size").css({ width: '10%' })
		}else if(grade == 1) {
			$(".star_size").css({ width: '20%' })
		}else if(grade > 1 && grade < 2) {
			$(".star_size").css({ width: '30%' })
		}else if(grade == 2) {
			$(".star_size").css({ width: '40%' })
		}else if(grade > 2 && grade < 3){
			$(".star_size").css({ width: '50%' })
		}else if(grade == 3){
			$(".star_size").css({ width: '60%' })
		}else if(grade > 3 && grade < 4){
			$(".star_size").css({ width: '70%' })
		}else if(grade == 4) {
			$(".star_size").css({ width: '80%' })
		}else if(grade > 4 && grade < 5) {
			$(".star_size").css({ width: '90%' })
		}else if(grade == 5) {
			$(".star_size").css({ width: '100%' })
		}
		
		$.ajax({
			url: "${path}/review/getReview?sNum=${shopInfo.sNum}", type: "get",
			dataType: "json",
			success: function(data) {
				for(var i = 0; i < data.length; i++){
					if(index == 6) {
						return
					}
					
					if(data[i].grade == 1) {
						$("." + data[i].num).css({ width: '20%' })
					}else if (data[i].grade == 2){
						$("." + data[i].num).css({ width: '40%' })
					}else if(data[i].grade == 3){
						$("." + data[i].num).css({ width: '60%' })
					}else if(data[i].grade == 4){
						$("." + data[i].num).css({ width: '80%' })
					}else if(data[i].grade == 5){
						$("." + data[i].num).css({ width: '100%' })
					}
					index++
				}
			},error: function() {
				alert("ERROR")
			}
		})
		
	}
	

	function starClick() {
		$.ajax({
			url: "${path}/likelist/likeCheck?id=${loginUser}&sNum=${shopInfo.sNum}", type: "get",
			success: function(data) {
				let obj = $(".like")
				
				if(data == "true"){
					obj.css({ color: 'red' })
					obj.text("♥")
				}else if(data == "false"){
					obj.css({ color: 'black' })
					obj.text("♡")
				}
			},error: function() {
				alert('error')
			}
		})
	}
	
	var index = 0
	var img = ["${shopInfo.img1}", "${shopInfo.img2}", "${shopInfo.img3}", "${shopInfo.img4}"]
	function arrow_left_click(){
		if(index > 0 && img[index - 1] != 'nan'){
			index--
			$(".img_slide").attr("src", "${path}/shop/download?fileName=" + img[index])
		}
	}
	
	function arrow_right_click(){
		if(index < 3 && img[index + 1] != 'nan'){
			index++
			$(".img_slide").attr("src", "${path}/shop/download?fileName=" + img[index])
		}
</script>

<style type="text/css">
	#wrap { 
		margin: 0 auto; width: 1200px; text-align:center;
		-ms-user-select : none;
		-moz-user-select: -moz-none;
		-khtml-user-select: none;
		-webkit-user-select: none;
		user-select: none; 
	}
	#shop_img_area { height: 300px; }
	#shop_info_area { width: 700px; margin: auto; }
	#shop_info { text-align: left; margin-top: 20px; }
	#shop_info div { margin-bottom: 20px; }
	#reservation_area { width: 100%; position: fixed; bottom: 0; left: 50%; transform: translate(-50%, 0); background-color: #FFFFFF; }
	.reser_btn { 
		background-color: #FF4848; width: 650px; height: 80px; 
		border-radius: 10px; 
		color: white; font-size: 20pt;
	}
	.like { font-size: 28pt; margin-right: 30px; }
	#menu_list { margin-top: 30px; }
	.menu_info { border-bottom: 1px solid rgba(0, 0, 0, 0.1); font-size: 18pt; text-align: left; padding: 20px 10px 20px 10px;
	}
	.list_all_btn { 
		border-radius: 6px; padding: 10px; margin-top: 20px; margin-bottom: 60px;
		border: 1px solid rgba(0, 0, 0, 0.6); background-color: white;
		cursor: pointer;
	}
	.menu { font-size: 14pt; text-align: left; padding: 20px 10px 20px 10px; border-bottom: 1px solid rgba(0, 0, 0, 0.1); }
	#review_area { 
		margin: auto; height: 800px; width: 700px;
		border-top: 1px solid rgba(0, 0, 0, 0.1); 
		text-align: left;
	}
	.review_info { border-bottom: 1px solid rgba(0, 0, 0, 0.1); padding-top: 20px; padding-bottom: 20px; }
	.review_id dl { margin: 0; }
	.review_id dd { margin: 0; margin-right: 20px; display: inline-block; }
	.btn_area { text-align: center; }
	.arrow { 
		position: relative; color: white; font-size: 36pt; cursor: pointer; 
		display: inline-block; background-color: gray; height: 80px; opacity: 0.6; 
	}
	.arrow_btn_left { position: relative; top: -65%; left: -44.5%; }
	.arrow_btn_right { position: relative; top: -65%; left: 44.5%; }
	.star { width: 80px; }
	.star,.star span { 
			display:inline-block; height:16px; 
			overflow: hidden; background: url(${path}/resources/images/star.png)no-repeat; }
	.star span{ background-position:left bottom;  line-height:0; vertical-align:top; }
</style>
</head>
<body onload="load()">
<c:import url="../default/header.jsp"/>
<div id="wrap">
	<div id="shop_info_area">
		<div id="reservation_area">
			<c:choose>
				<c:when test="${like eq null}">
					<span class="like" style="color: black;" onclick="starClick()">♡</span>
				</c:when>
				<c:otherwise>
					<span class="like" style="color: red;" onclick="starClick()">♥</span>
				</c:otherwise>
			</c:choose>
			<input type="button" value="예약하기" onclick="location.href='${path}/menu/infoChoice?id=${loginUser}&sName=${shopInfo.sName}'" class="reser_btn">
		</div>
		<div id="shop_img_area">
			<img src="${path}/shop/download?fileName=${shopInfo.img1}" width="100%" height="300px" class="img_slide">
			<div class="arrow_btn_left arrow" onclick="arrow_left_click()"><b>&lt;</b></div>
			<div class="arrow_btn_right arrow" onclick="arrow_right_click()"><b>&gt;</b></div>
		</div>
		<div id="shop_info">
			<strong>${shopInfo.sName}</strong>
			<div class="shop_grade">
				<span class='star'>
					<span style="width:0%" class="star_size"></span>
				</span>
				<span>${shopInfo.grade}</span>
			</div>
			<div>
				<b>TEL</b><br>
				<span>${shopInfo.sPhone}</span>
			</div>
			<div>
				<b>매장 주소</b><br>
				<span>${shopInfo.sAddr}</span>
			</div>
		</div>
		<div id="menu_list">
			<div class="menu"><strong>메뉴</strong></div>
			<c:forEach var="menu" items="${menu}" begin="1" end="6">
				<div class="menu_info">
					<div class="menu_name">${menu.info}</div>
					<div class="menu_price">${menu.price}</div>
				</div>
			</c:forEach>
			<input type="button" onclick="location.href='${path}/menu/menuListForm'" value="메뉴 전체보기" class="list_all_btn">
		</div>
	</div>
	<div id="review_area">
		<c:forEach var="review" items="${review}" begin="0" end="5">
			<div class="review_info">
				<div><b>${review.info}</b></div>
				<div>
					<span class="star">
						<span style="width: 0%" class="review_star_size ${review.num}"></span>
					</span>
					<span>${review.grade}</span>
				</div>
				<div class="review_content">${review.content}</div>
				<div class="review_id">
					<dl>
						<dd>${review.id}</dd><dd>${review.rDate}</dd>
					</dl>
				</div>
				<c:if test="${review.img != 'nan'}">
					<div class="review_img">
						<img src="${path}/shop/download?fileName=${review.img}" width="100px" height="100px" style="border-radius: 6px; margin-top: 10px;">
					</div>
				</c:if>
			</div>
		</c:forEach>
		<div class="btn_area">
			<input type="button" onclick="location.href='${path}/review/reviewListForm?sNum=${shopInfo.sNum}'" value="리뷰 전체보기" class="list_all_btn">
		</div>
	</div>
</div>
<c:import url="../default/footer.jsp"/>
</body>
</html>