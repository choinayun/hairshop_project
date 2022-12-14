<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Four Season Hair</title>
<style type="text/css">
	.wrapper {
    max-width:2000px;
    width:100%;
    height:700px;
    margin:0 auto;
	}

	.swiper {
    max-width: 2000px;
    width:100%;
    height: 100%;
    position: relative;
    overflow: visible;
	}

	.swiper-wrapper{
		display: flex;
	}
	.swiper-slide {
    max-width: 2000px;
    width:100%;
    height:100%;
    text-align: center;
    font-size: 18px;
    background: #fff;
    border-radius: 10px;

    /* Center slide text vertically */
    display: -webkit-box;
    display: -ms-flexbox;
    display: -webkit-flex;
    display: flex;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    -webkit-justify-content: center;
    justify-content: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    -webkit-align-items: center;
    align-items: center;
	}

	.swiper-slide img {
    display: block;
    width: 100%;
    height: 100%;
    /* object-fit: cover; */
	}

	/**/

	.swiper-slide {opacity:0.5; transition:opacity 0.5s;}
	.swiper-slide-active {opacity:1;}

	.changing {
    transition:opacity 0.3s;
    pointer-events:none;
 	 }
  
	  .changed {  
 	   transition:none;
	  }


	/* pagination */
	.mySwiper .swiper-pagination {
	    position: absolute;
 	   bottom: -20px;
 	   text-align:center;
    
	}

	.custom-fraction {text-align:right; margin:15px 5px 0 0;}
	.btn-wrapper {
	    margin-top:50px;
	}
	
	#wrap { margin: 0 auto; margin-bottom: 100px; text-align: center; }
	#main_img_area { position: relative; text-align: center; margin-bottom: 100px; }
	#main_img_area img { border-bottom-left-radius: 10px; border-bottom-right-radius: 10px; }
	#grade_img_area { width: 1300px; margin: auto; margin-top: 60px; }
	#review_img_area { width: 1300px; margin: auto; margin-top: 60px; }
	#img_area h2 { padding: 10px; }
	.img_div { 
		display: inline-block; width: 45%; text-align: left; 
		margin-top: 5px; border: 1px solid rgb(0, 0, 0, 0.6); border-radius: 10px; 
	}
	.img_div div img { border-radius: 10px; vertical-align: bottom; }
	.img_div .img_flex { display: flex; height: 196px; cursor: pointer; }
	.swiper-button-prev img { margin-top: 25px; margin-left: 35px;}
	.swiper-button-next img { margin-top: 30px; margin-right: 35px;}
	.swiper-button-next::after,
	.swiper-button-prev::after {
 	 display: none;
 	 
	}
	.swiper-rtl .swiper-button-next::after {
	 left:30px;
	 right: auto;
	}
	
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
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<div id="wrap">
	<div class="wrapper">
	  <!-- Swiper -->
	  <div class="swiper mySwiper">
	    <div class="swiper-wrapper">
	 	  <div class="swiper-slide"><img src="${path}/resources/images/main_img5.png" width="1370px" height="700px"  class="main_img"></div>
	      <div class="swiper-slide"><img src="${path}/resources/images/main_img4.png" width="1370px" height="700px" class="main2_img"></div>
	      <div class="swiper-slide"><img src="${path}/resources/images/main_img6.png" width="1370px" height="700px" class="main3_img"></div>
	    </div>
	    <div class="swiper-pagination"></div>
	    <div class="swiper-button-next"><img src="${path}/resources/images/main_arrow_right.png" style="width: 80px; height: 70px; "></div>
	    <div class="swiper-button-prev"><img src="${path}/resources/images/main_arrow_left.png" style="width: 80px; height: 70px; "></div>
	  	
	  </div>
	  <!-- ?????? ?????? ??????
	  <div class="btn-wrapper">
	    <button class="auto-start" style="width: 40px; height: 20px; text-align: center; font-weight: bold; margin: 0 auto;" >play</button>
	    <button class="auto-stop" style="width: 40px; height: 20px; text-align: center; font-weight: bold; margin: 0 auto;">stop</button>
	  </div>
	  -->	
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
								<dl><dt style="color: rgb(0, 0, 0, 0.7);">???</dt><dd>${grade.grade}</dd></dl>
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
								<dl><dt style="color: rgb(0, 0, 0, 0.7);">???</dt><dd>${review.grade}</dd></dl>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<c:import url="default/footer.jsp"/>
<script type="text/javascript">
$("document").ready(function () {
    // ????????? dom??? ????????????
    // .mySwiper ???????????? swiper ??????????????? ??????
    // ????????? swiper????????? ???????????? ????????? ??????????????? ????????? ?????? ??????.
    var swiper = new Swiper(".mySwiper", {
        slidesPerView: 'auto',
        spaceBetween: 80,
        loop: true,

        // pagination ????????? bullet
        pagination: {
            el: ".swiper-pagination"
        },

        // ?????? ????????? navigation element ??????
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev"
            
        },
        // ?????????
        breakpoints: {
            // 600px ????????? ?????? ???????????? ??? ????????? 0??????
            600: {
                spaceBetween: 0
            },
        },

        on: {
            init: function() {
                $('.swiper-slide').addClass('changed');

                // fraction??? ?????? ???????????? ?????? ????????? ??????
                // this.loopedSlides??? loop, slidesPerView: 'auto'??? ??? ????????? ??????
                $('.custom-fraction .current').text(this.realIndex + 1);
                $('.custom-fraction .all').text(this.loopedSlides);
                // console.log(this);
                // console.log(this.loopedSlides)
            },

            slideChangeTransitionStart: function() {
                // ??????????????? ???????????? swiper-slide-active ???????????? ?????????
                // css transition ??????????????? ?????? ????????????.
                // ?????? ?????? ????????? ????????? ?????? ????????? ?????? slide??? ??????????????? ?????????,
                // ??? ??? ??????????????? ????????? ??? ??????.
                // css transition??? ?????? ????????? ????????? changed, changing ???????????? ??????
                $('.swiper-slide').addClass('changing');
                $('.swiper-slide').removeClass('changed');

                // ????????? ????????? ????????? fraction ?????? ????????? ??????
                $('.custom-fraction .current').text(this.realIndex + 1);
            },

            slideChangeTransitionEnd: function() {
                // changing : transition O
                // changed : transition X
                $('.swiper-slide').removeClass('changing');
                $('.swiper-slide').addClass('changed');
            }
        },
    });

    // ???????????? ????????? swiper??? ???????????? ??????
    $(".auto-start").on("click", function() {
        // ?????? ???????????? autoplay ??????
        console.log("autoplay start");
        swiper.autoplay.start();
    });

    $(".auto-stop").on("click", function() {
        console.log("autoplay stop");
        swiper.autoplay.stop();
    });
});

</script>
</body>
</html>