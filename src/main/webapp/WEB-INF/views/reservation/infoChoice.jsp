<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Four Season Hair</title>
<style type="text/css">
	body{
	 margin: 0 auto; text-align: center;
	}
    .swiper-container {
      width: 100%;
      margin-top: 20px;
      
    }
    .swiper-slide {
      text-align: left;
      font-size: 18px;
      background: #fff;

      /* Center slide text vertically */
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }

.swiper-container-vertical>.swiper-pagination-bullets{
    top: unset !important;
    bottom: 10px;
    left: 0;
    width: 100%;
}

.swiper-container-vertical>.swiper-pagination-bullets .swiper-pagination-bullet{
  display : inline-block !important;
  margin: 6px 2px !important;
}

.selectMenu { 
	height:800px;
	width: 100%;
	position: left;
	margin-left:10px; 
 }
 .bottomvar{
 	position: fixed; bottom: 0; left: 50%; transform: translate(-50%, 0);
 	display: flex; width: 700px; padding: 15px; margin: auto;  
 }
 .priceSum { text-align: left; width: 50%; }
 .sum { color: rgb(0, 0, 0, 0.6); font-weight: bold; font-size: 12pt; }
 .price { font-weight: bold; font-size: 17pt; }
 .Menubtn { 
 	width: 300px; padding: 20px 10px 20px 10px; background-color: black; color: white; 
 	font-size: 15pt; font-weight: bold; border-radius: 6px; cursor: pointer; 
 }
 #btn_div { display: none; }
#menuNav { width: 800px; margin: auto; text-align: center; margin-top: 60px; margin-bottom: 60px; }
#menuNav ul { padding: 20px; margin-right: 0; list-style: none; display: flex; }
#menuNav ul li { width: 20%; padding-top: 10px; padding-bottom: 10px; font-size: 14pt; cursor: pointer;  }
hr { 
	width: 800px;
	border: 1px solid #EAEAEA;
	margin: 0 auto;
	
}
.menu_list { 
	width: 840px;  margin: 0 auto; text-align:left; font-size: 14pt; font-weight: bold; 
	margin-top: 10px;  
}
.menu_info { 
	width: 800px; margin: auto; padding: 20px; 
    border-bottom: 1px solid rgb(0, 0, 0, 0.2);
	cursor: pointer;
}
.first1, .first5, .first12, .first16, .first21 { border-top: 1px solid rgb(0, 0, 0, 0.2); }
.listAll { font-size: 10pt; border-bottom: 2px solid rgb(0, 0, 0, 0.4); }
.list1 { font-weight: bold; border-bottom: 2px solid black; }
</style>
</head>
<body>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<c:set var="contextPath" 
			value="${ pageContext.request.contextPath}"/>
<div id="menuNav">
<ul >
  <li class="list1 listAll">컷</li>
  <li class="list2 listAll">펌</li>
  <li class="list3 listAll">염색</li>
  <li class="list4 listAll">클리닉</li>
  <li class="list5 listAll">스타일링</li>
</ul>
</div>
<p class="menu_list">메뉴</p>
<!-- swiper슬라이더 메인컨테이너 -->

<div class="selectMenu" >
<div class="swiper-container">
  <!-- 보여지는 영역 -->
  
  <div class="swiper-wrapper">
    <!-- div class="swiper-slide" 를 추가하면된다 -->
    <div class="swiper-slide">
    	
    		<c:forEach var="dto" begin="0" end="3" items="${mInfo }">
    			<div class="menu_info first${dto.mNum}" onclick="func('${dto.price}', ${dto.mNum})">
	  				<input type="radio" id="cut" name="num" value="${dto.mNum }" class="${dto.mNum}">
	  						${dto.info } <br>
			  				&nbsp;&nbsp;&nbsp; ${dto.price}원 <br>
	    		</div>
    		</c:forEach>
    </div>
    <div class="swiper-slide">
	    <c:forEach var="dto" begin="4" end="10" items="${mInfo }">
		    <div class="menu_info first${dto.mNum}" onclick="func('${dto.price}', ${dto.mNum})">
    			<input type="radio" id="cut" name="num" value="${dto.mNum}" class="${dto.mNum}">
						${dto.info } <br>
  						&nbsp;&nbsp;&nbsp; ${dto.price}원 <br>
			</div>
	 	</c:forEach>
    </div>
    <div class="swiper-slide">
	    <c:forEach var="dto" begin="11" end="14" items="${mInfo }">
		    <div class="menu_info first${dto.mNum}" onclick="func('${dto.price}', ${dto.mNum})">
   				<input type="radio" id="cut" name="num" value="${dto.mNum }" class="${dto.mNum}">
 						${dto.info } <br>
 						&nbsp;&nbsp;&nbsp; ${dto.price}원 <br>
			</div>
	  	</c:forEach>
    </div>
    <div class="swiper-slide">
	    <c:forEach var="dto" begin="15" end="19" items="${mInfo }">
		    <div class="menu_info first${dto.mNum}" onclick="func('${dto.price}', ${dto.mNum})">
		 		<input type="radio" id="cut" name="num" value="${dto.mNum }" class="${dto.mNum}">
				${dto.info } <br>
				&nbsp;&nbsp;&nbsp; ${dto.price}원 <br>
			</div>
		</c:forEach>
    </div>
    <div class="swiper-slide">
    <c:forEach var="dto" begin="20" end="21" items="${mInfo }">
    	<div class="menu_info first${dto.mNum}" onclick="func('${dto.price}', ${dto.mNum})">
   			<input type="radio" id="cut" name="num" value="${dto.mNum }" class="${dto.mNum}">
 						${dto.info } <br>
 						&nbsp;&nbsp;&nbsp; ${dto.price}원 <br>
		</div>
 	</c:forEach>
    </div>
  </div>
</div>
<div id="btn_div">
	<div class="bottomvar" id="etc_view">
		<div class="priceSum">
			<div class="sum">총 결제금액</div>
			<div class="price"></div>
		</div> 
		<input class="Menubtn" type="submit" id="showbtn" value="예약하기" onclick="reserv()">
	</div>
</div>
</div>
<script type="text/javascript">
const swiper = new Swiper('.swiper-container', {
	  direction: 'horizontal',
	  slidesPerView: 1,
	  debugger: true,
	  mousewheel: false,
	  loop: false,
	  centeredSlides: true,
	});

	$('ul li').click(function(){
	  var index = $(this).index();
	  $("ul li").css({ fontWeight: 'normal', borderBottom: '2px solid rgb(0, 0, 0, 0.4)' })
	  $(this).css({ fontWeight: 'bold', borderBottom: '2px solid black' })
	  swiper.slideTo(index);
	})
	
	function reserv(){
		var id = $('input[name="num"]:checked').attr('id');
		var value = $('input[name="num"]:checked').val();
		location.href = "${contextPath}/reservation/dateChoice?mNum="+ value+"&sNum=${param.sNum}&sName=${param.sName}";
	}
	
	
	//선택한 시술의 가격
    function func(price, mNum) {
		$("." + mNum).prop("checked", true)
    	$(".price").text(price+"원")
    	$("#btn_div").css({ display: 'block' })
    }
</script>

<!--  <c:import url="../default/footer.jsp"/> -->
</body>
</html>