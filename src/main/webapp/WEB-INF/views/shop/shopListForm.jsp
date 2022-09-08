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
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fe7ed52025268bb4958928de839fbbf4&libraries=services"></script>
<script type="text/javascript">
   	var memberLoc, shopLoc 
   	
   	// 주소-좌표 변환 객체를 생성합니다
   	var geocoder = new kakao.maps.services.Geocoder();

   	var index = 0
   	var arr = [] 
	var polyline = new kakao.maps.Polyline({
		path : []
	});
   	geocoder.addressSearch("${userAddr}", function(result, status) {
   	    // 정상적으로 검색이 완료됐으면 
   	     if (status === kakao.maps.services.Status.OK) {
   	    	memberLoc = new kakao.maps.LatLng(result[0].y, result[0].x);
			$.ajax({
				url: "${path}/shop/getShopList?result=${result}", type: "get",
				dataType: "json",
				success: function(data) {
					console.log(data)
					arr = data
					distance()
				},error: function(){
					alert("Error")
				}
			})
   	    } 
   	})
   	
   	function listAdd(info){
   		var num = index
		geocoder.addressSearch(info.sAddr, function(result, status) {
			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
				shopLoc = new kakao.maps.LatLng(result[0].y, result[0].x);
				polyline.setPath([memberLoc, shopLoc]);
				
				if(Math.round(polyline.getLength()) <= 1000){
					var html = ""
					
					$.ajax({
						url: "${path}/review/getReviewCnt?sNum=" + info.sNum, type: "get",
						success: function(cnt) {
							html += "<div class='shop'><div class='shop_img'><a href='${path}/shop/shopInfo?sNum="+info.sNum+"'>"
							html += "<img class='img_img' src='${path}/shop/download?fileName="+info.img1+"'/>"
							html += "</a></div>"
							
							html += "<div class='info_area'><a href='${path}/shop/shopInfo?sNum="+info.sNum+"'>"
							html += "<div><strong>"+info.sName+"</strong></div>"
							html += "<div><dl><dt class='star'>★</dt><dd>"+parseFloat(info.grade).toFixed(1)+"("+cnt+")</dd><dd>"+info.sAddr+"</dd></dl></div>"
							html += "<div><dd>"+info.sPhone+"</dd></div>"
							html += "</a></div></div>"
							$("#shop_area").append(html)
						},error: function() {
							alert("불러오기 실패")
						}
					})
				}
			}
			index++
			if(num + 1 == index) {
				distance()
			}
		})
   	}
   	
   	function distance() {
   		if(index == arr.length) {
   			return false
   		}
		listAdd(arr[index])
   	}
   	
	function slide_block(){
		$("#align_select_wrap").css({ display: 'block' })
	}
	
	function slide_none() {
		$("#align_select_wrap").css({ display: 'none' })
	}
	
	function slide_align_select(num) {
		location.href = "${path}/shop/shopListForm?result="+num;
	}
	
	function search_btn() {
		let word = $("#word").val()
		if(window.event.keyCode == 13){
			location.href = "${path}/shop/shopSearch?word=" + word
		}
	}
</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function addrUpdate() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	var address = ""
	            if(data.addressType == 'R'){
	            	address = data.roadAddress
	            }else if(data.addressType == 'J') {
	            	address = data.jibunAddress
	            }
	        	location.href = "${path}/member/addrUpdate?addr="+address
	        }
	    }).open();
	}
</script>

<style type="text/css">
	#wrap { margin: auto; width: 600px; text-align: center; }
	.img_img { width: 600px; height: 250px; margin-bottom: 10px; border-radius: 3px; }
	strong { color: black; }
	dd { display: inline-block; margin-left: 2px; color: black; }
	dt { display: inline-block; color: black; }
	dl { display: inline-block; margin: 0px; color: black; }
	.star { color: #F2CB61; }
	.info_area { width: 600px; text-align: left; margin: auto; }
	.shop { padding-top: 50px; padding-bottom: 30px; border-bottom: 1px solid rgb(0, 0, 0, 0.1); }
	a { text-decoration: none; }
	.address_area {
		width: 300px;
		cursor: pointer;
		background-color: gray; 
	}
	#align_select {
		position: fixed; bottom: 0; left: 50%;
		transform: translate(-50%, 0); 
		width: 600px; background-color: rgb(234, 234, 234);
		font-size: 22pt;
	}
	.align_select_set { padding-top: 10px; padding-bottom: 10px; cursor: pointer; }
	#shop_list { width:100%; height: 100%; }
	#align_select_wrap { display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgb(0, 0, 0, 0.4); z-index: 9; }
</style>
</head>
<body>
<c:import url="../default/header.jsp"/>
<div id="wrap">
	<div class="address_area" onclick="addrUpdate()">
		<p class="addr">주소를 입력해주세요</p>
	</div>
	<div class="alignment">
		<input type="button" value="정렬 선택" onclick="slide_block()">
	</div>
	<div id="search">
		<input type="text" id="word" placeholder="Search" onkeyup="search_btn()"><input type="button" value="검색">
	</div>
	<div id="shop_area">
		
	</div>
</div>
<div id="align_select_wrap">
	<div id="align_select">
		<div onclick="slide_none()" class="align_select_set">정렬 선택</div>
		<div onclick="slide_align_select(1)" class="align_select_set">평점 높은 순</div>
		<div onclick="slide_align_select(2)" class="align_select_set">평점 낮은 순</div>
		<div onclick="slide_align_select(3)" class="align_select_set">리뷰 많은 순</div>
		<div onclick="slide_align_select(4)" class="align_select_set">리뷰 적은 순</div>
	</div>
</div>
<c:import url="../default/footer.jsp"/>
</body>
</html>