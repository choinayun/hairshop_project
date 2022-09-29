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
      display: -webkit-box;
      display: -ms-flexbox;
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
 .Menubtn {
 	position: fixed;
 	bottom: 20px;
 	right: 30px;
 	width: 500px;
 	z-index: 4;
 	background-color: #FF4848; width: 650px; height: 80px; 
	border-radius: 10px; cursor: pointer;
	color: white; font-size: 20pt;
 }
 .price{
 	position: fixed;
 	bottom: 20px;
 	left: 30px;
 	width: 300px;
 	height: 78px;
 	z-index: 4;
 	text-align: center;
 	border-radius: 10px;
 }
 .bottomvar{
 	display: flex;
 }
#menuNav { width: 800px; margin: 0 auto; text-align: center;  }
#menuNav ul { padding: 0; margin-right: 0; list-style: none; display: flex;  }
#menuNav ul li { width: 20%; padding-top: 10px; padding-bottom: 10px; font-size: 12pt; cursor: pointer;  }
hr { 
	width: 800px;
	border: 1px solid #EAEAEA;
	margin: 0 auto;
	
}
p{ width: 800px;  margin: 0 auto; text-align:left; font-size: 14pt; font-weight: bold; margin-top: 10px; }
label{
	cursor: pointer;
	height: 60px;
}
</style>
</head>
<body>
 <c:import url="../default/header.jsp" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<c:set var="contextPath" 
			value="${ pageContext.request.contextPath}"/>
<div id="menuNav">
<ul >
  <li >컷</li>
  <li >펌</li>
  <li >염색</li>
  <li >클리닉</li>
  <li >스타일링</li>
</ul>
</div>
<p>메뉴</p>
<hr>
<!-- swiper슬라이더 메인컨테이너 -->

<div class="selectMenu" >
<div class="swiper-container">
  <!-- 보여지는 영역 -->
  
  <div class="swiper-wrapper">
    <!-- div class="swiper-slide" 를 추가하면된다 -->
    <div class="swiper-slide">
    	
    		<c:forEach var="dto" begin="0" end="3" items="${mInfo }">
    		<label for="cut">
  				<input type="radio" id="cut" name="num" value="${dto.mNum }" onclick="func('${dto.price}')">
  				
  						${dto.info } <br>
  				&nbsp;&nbsp;&nbsp; ${dto.price}원 <br>
  				<hr>
    		</label>
    		</c:forEach>
    </div>
    <div class="swiper-slide">
    <c:forEach var="dto" begin="4" end="10" items="${mInfo }">
    <label for="perm">
    			<input type="radio" id="cut" name="num" value="${dto.mNum}" onclick="func('${dto.price}')">
    			
  						${dto.info } <br>
  						&nbsp;&nbsp;&nbsp; ${dto.price}원 <br>
  						<hr>
  						</label>
    		</c:forEach>
    </div>
    <div class="swiper-slide">
    <c:forEach var="dto" begin="11" end="14" items="${mInfo }">
    <label for="color">
    				<input type="radio" id="cut" name="num" value="${dto.mNum }" onclick="func('${dto.price}')">
    				
  						${dto.info } <br>
  						&nbsp;&nbsp;&nbsp; ${dto.price}원 <br>
  						<hr>
  						</label>
    		</c:forEach>
    </div>
    <div class="swiper-slide">
    <c:forEach var="dto" begin="15" end="19" items="${mInfo }">
    <label for="clinc">
    				<input type="radio" id="cut" name="num" value="${dto.mNum }" onclick="func('${dto.price}')">
    				
  						${dto.info } <br>
  						&nbsp;&nbsp;&nbsp; ${dto.price}원 <br>
  						<hr>
  						</label>
    		</c:forEach>
    </div>
    <div class="swiper-slide">
    <c:forEach var="dto" begin="20" end="21" items="${mInfo }">
    <label for="styling">
    			<input type="radio" id="cut" name="num" value="${dto.mNum }" onclick="func('${dto.price}')">
    			
  						${dto.info } <br>
  						&nbsp;&nbsp;&nbsp; ${dto.price}원 <br>
  						<hr>
  						</label>
    		</c:forEach>
    </div>
  </div>
</div>
<div class= "bottomvar"  id="etc_view" style="display:none;" >
<input class="price" type="text"  id="showbtn" readonly="readonly"> 
<input class="Menubtn" type="submit" id="showbtn" value="예약하기" onclick="reserv()" >
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
	  swiper.slideTo(index);
	})
	
	function reserv(){
		var id = $('input[name="num"]:checked').attr('id');
		var value = $('input[name="num"]:checked').val();
		location.href = "${contextPath}/reservation/dateChoice?mNum="+ value+"&sNum=${param.sNum}&sName=${param.sName}";
	}
	
	$(function (){
		 
		$('input[type="radio"][id="cut"]').on('click', function(){
		  var chkValue = $('input[type=radio][id="cut"]:checked').val();
		  if(chkValue == ""){
		             $('#etc_view').css({display:'none'});
		  }else{
		             $('#etc_view').css({display:'block'});
		  }
		 
		});
		 
		});
	//선택한 시술의 가격
    function func(price) {
    	$(".price").val(price)
    }
	
</script>

<!--  <c:import url="../default/footer.jsp"/> -->
</body>
</html>