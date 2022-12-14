<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 날짜 선택</title>
<style type="text/css">
.mInfo{
   border: 0; solid: black;
}
.time{
 	width: 100px;
 	height: 30px;
 	border-style: none;
 	border-radius: 20px; cursor: pointer;
 	background-color: rgb(0, 0, 0, 0.1);
 }
.bottomvar{
 	position: fixed; bottom: 0; left: 50%; transform: translate(-50%, 0);
 	display: flex; width: 700px; padding: 15px 15px 0 15px; margin: auto;  
}
.priceSum { text-align: left; width: 50%; }
.sum { color: rgb(0, 0, 0, 0.6); font-weight: bold; font-size: 12pt; }
.price { font-weight: bold; font-size: 17pt; }
.resbtn { 
 	width: 300px; padding: 20px 10px 20px 10px; background-color: rgb(0, 0, 0, 0.2); color: white; 
 	font-size: 15pt; font-weight: bold; border-radius: 6px;  
}
#wrap { text-align: center; margin-top: 60px; }
#timetable { margin: auto; }
#timetable tr td { 
	padding: 10px; border-radius: 20%;
}
#timetable tr td input { width: 120px; height: 40px; }
#calendar { 
	margin: auto; width: 650px; padding: 10px; 
	font-size: 12pt; font-weight: 500;
}
#calendar tr td { cursor: pointer; width: 30px; height: 30px; padding: 5px; }
#calendar tr td { border-radius: 50%; }
#calendar tr td:first-child { background-color: black; color: white; }
.div_width { 
	width: 650px; margin: auto; text-align: left;
	padding: 10px; font-size: 12pt; font-weight: 800;
}
</style>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
var today = new Date();
//today 보조. 고정
var date = new Date();

//선택되있던 셀 객체 저장
var selectedCell;

var time = moment().format("HHmm")

//오늘에 해당하는 월
var realMonth = date.getMonth()+1;
var realToDay = date.getDate();

var todayTime = date.getFullYear() + "" + ('0' + (date.getMonth() + 1)).slice(-2) + "" + ('0' + date.getDate()).slice(-2)

$.ajax({
    url:'${contextPath}/reservation/dateCheck?ymd='+todayTime+'&sNum=${param.sNum}', //Controller에서 요청 받을 주소///member/
    type:'get', //get 방식으로 전달
    dataType : 'json',
    success:function(data){ // 해당 날짜의 예약정보 리스트를 받음
		$("#selectDate").val(todayTime)
    	for(var i = 0; i < data.length; i++){
 			// 예약된 시간이 있으면 disabled 처리함.
			$('#time_'+data[i].rTime.split("~")[0].replace(":", "")).attr("disabled", true)
			$('#time_'+data[i].rTime.split("~")[0].replace(":", "")).css({ backgroundColor: 'rgb(0, 0, 0, 0.1)', color: 'black', opacity: '0.5' })
    	}
    	setTime()
    },
    error:function(){
        alert("에러");
    }
});

function setTime(){
	
	for(var i = 0; i < 12; i++){
		var getTime = $("input[name=time]").eq(i).val().split("~")[0].replace(":", "")
		var getTime2 = $("input[name=time]").eq(i).val().split("~")[1].replace(":", "")
		
		if(time >= getTime2){
			$('#time_' + getTime).attr("disabled", true)
			$('#time_' + getTime).css({ backgroundColor: 'rgb(0, 0, 0, 0.1)', color: 'black', opacity: '0.5' })
		}
	}
}

//사용자가 클릭한 일자의 월, 일 객체
var selectedMonth = null;
var selectedDate = null;

nowMonth = today.getMonth()+1;

function buildCalendar(){
  var row = null
  var cnt = 0;
//달력 객체
  var calendarTable = document.getElementById("calendar");
  var lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0); // 해당월의 마지막 날짜
  //alert("이번달 마지막 날짜 lastDate >>>" + lastDate.getDate());
  
   //현재 참조중인 월 
   nowMonth = today.getMonth()+1;
   
   //현재 참조중인 일
   nowDate = today.getDate();
   
   
//셀 입력을 위해 테이블 개행
  row = calendarTable.insertRow();
	
//현재날짜부터 14일까지 가져오기
	for(i = 0; i < 15; i++){ // 14일 후까지의 날짜를 가져오기 위한 loop
	   var nextDate = new Date();
 		nextDate.setDate(nextDate.getDate()+i); // 오늘 기준으로 1일후, 2일후 ~ 14일후까지의 날짜 객체
		

 		var yyyyMMdd = (nextDate.getFullYear()) + ("0" + (1 + nextDate.getMonth())).slice(-2) + ("0" + (nextDate.getDate())).slice(-2);  // yyyyMMdd 포멧의 14일 후까지의 날짜
 		
		cell = row.insertCell();

		if(i <= lastDate.getDate()){
			cell.setAttribute('id', yyyyMMdd); // 오늘부터 14일간의 날짜 세팅
			cell.innerHTML = ("0" + (nextDate.getDate())).slice(-2); // 일자 정보 세팅
		}
		
		cell.align = "center";
		cell.onclick = function(){jsDateClick(this)}; // 날짜를 생성한 td 영역의 객체
	}
}
</script>
<body>

<div class="mInfo">
	<form>
	<input type="hidden" name="id" value="${loginUser }">
	<input type="hidden" value="${dto.mNum }">
	<input type="hidden" name="sNum" value="${param.sNum}">
	<input type="hidden" name="phone" value="${phone}">
	<input type="hidden" name="sName" readonly="readonly" value="${param.sName }">
	<input type="hidden" name="info" readonly="readonly" id="info" value="${dto.info }">
	<!-- 선택한 예약일시를 출력할 위치 -->
	<input  type="hidden" id="selectDate" readonly="readonly" name ="rDate">
	<input  type="hidden" id="selectTime" readonly="readonly" name="rTime" >
	<div id="btn_div">
		<div class="bottomvar" id="etc_view">
			<div class="priceSum">
				<div class="sum">총 결제금액</div>
				<div class="price" id="price">${dto.price}원</div>
		</div> 
			<input class="resbtn" type="button" value="결제하기" onclick="payment()" disabled="disabled">
		</div>
	</div>
	</form>
</div> 
<c:import url="../default/header.jsp"/>
<div id="wrap">
	<div class="div_width">날짜 선택</div>
	<table id="calendar">
		<script type="text/javascript">buildCalendar();</script>
	</table>
	<div class="div_width" style="margin-top: 50px;">시간 선택</div>

	<table id="timetable">
		<tr>
			<td><input type="button" class="time" name="time"
				value="09:00~10:00" id="time_0900" onclick="timeChoice(this)"></td>
			<td><input type="button" class="time" name="time"
				value="10:00~11:00" id="time_1000" onclick="timeChoice(this)"></td>
			<td><input type="button" class="time" name="time"
				value="11:00~12:00" id="time_1100" onclick="timeChoice(this)"></td>
		</tr>
		<tr>
			<td><input type="button" class="time" name="time"
				value="13:00~14:00" id="time_1300" onclick="timeChoice(this)"></td>
			<td><input type="button" class="time" name="time"
				value="14:00~15:00" id="time_1400" onclick="timeChoice(this)"></td>
			<td><input type="button" class="time" name="time"
				value="15:00~16:00" id="time_1500" onclick="timeChoice(this)"></td>
		</tr>
		<tr>
			<td><input type="button" class="time" name="time"
				value="16:00~17:00" id="time_1600" onclick="timeChoice(this)"></td>
			<td><input type="button" class="time" name="time"
				value="17:00~18:00" id="time_1700" onclick="timeChoice(this)"></td>
			<td><input type="button" class="time" name="time"
				value="18:00~19:00" id="time_1800" onclick="timeChoice(this)"></td>
		</tr>
		<tr>
			<td><input type="button" class="time" name="time"
				value="19:00~20:00" id="time_1900" onclick="timeChoice(this)"></td>
			<td><input type="button" class="time" name="time"
				value="20:00~21:00" id="time_2000" onclick="timeChoice(this)"></td>
			<td><input type="button" class="time" name="time"
				value="21:00~22:00" id="time_2100" onclick="timeChoice(this)"></td>
		</tr>
	</table>
</div>

<script type="text/javascript">

function timeChoice(time){
	var choiceTime = $(time).val()
	$(".time").css({ backgroundColor: 'rgb(0, 0, 0, 0.1)', color: 'black' })
    $("#selectTime").val(choiceTime)
    $(time).css({ backgroundColor: 'black', color: 'white' })
    $(".resbtn").removeAttr("disabled")
    $(".resbtn").css({ backgroundColor: 'black', cursor: 'pointer' })
}

/*
 * 날짜 영역의 객체를 받아서 년월일의 파라미터로 해당 날짜의 예약정보를 리턴받음 
 */
function jsDateClick(obj){ // obj는 yyyyMMdd 포멧의 오늘날짜
	var ymd = obj.id;
	$("#calendar tr td").css({ backgroundColor: "white", color: 'black'  })
	$(obj).css({ backgroundColor: "black", color: 'white'  })
	$("#selectDate").val(ymd);
	$(".time").css({ backgroundColor: 'rgb(0, 0, 0, 0.1)', color: 'black', opacity: '1.0' })
	$("#selectTime").val("")
	
	$("input[name=time]").attr("disabled",false); // 달력의 disabled를 false
	// 입력받은 날짜를 파라미터로 해당 날짜에 예약된 시간대를 가져옴[list json]
	$.ajax({
	    url:'${contextPath}/reservation/dateCheck?ymd='+ymd+"&sNum=${param.sNum}", //Controller에서 요청 받을 주소///member/
	    type:'get', //get 방식으로 전달
	    success:function(data){ // 해당 날짜의 예약정보 리스트를 받음
	 		$.each(data, function(i, item) {
	 			// 예약된 시간이 있으면 disabled 처리함.
				$('#time_'+item.rTime.split("~")[0].replace(":", "")).attr("disabled", true);
				$('#time_'+item.rTime.split("~")[0].replace(":", "")).css({ backgroundColor: 'rgb(0, 0, 0, 0.1)', color: 'black', opacity: '0.5' });
	 		});
	    },
	    error:function(){
	        alert("에러");
	    }
	});
	console.log(todayTime)
	if(ymd == todayTime){
		setTime()
	}
}
</script>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">
var price = ${dto.price.replace(',','')}
var phone = ${phone.replace('-','')}
var name = "${name}"
var email ="${email}"
function payment(){
	const data={
			payMethod : 'card', 
			sName : $("input[name='sName']").val(),
			sNum : $("input[name='sNum']").val(), 
			id : $("input[name='id']").val(), 
			rDate : $("input[name='rDate']").val(), 
			rTime : $("input[name='rTime']").val(), 
			info : $("input[info='info']").val(), 
			email : email,
			name : name, 
			amount : price, 
			tel : phone
	}
	if(!data.rDate){
		alert('날짜를 선택해주세요');
		return;
	}
	if(!data.rTime){
		alert('시간을 선택해주세요');
		return;
	}
	
// 	alert(JSON.stringify(data));
// 	console.log(JSON.stringify(data));
	paymentCard(data);
}

//주문번호 만들기
function createReservNum(){
	$.ajax({
		url :'${contextPath}/reservation/numCheck',
	    type:'get', //get 방식으로 전달
	    dataType : 'json',
	    success:function(){ 
	    	alert("성공");
	    },
	    error:function(){
	        alert("에러");
	    }
	});
}

//카드 결제
function paymentCard(data) {
	// 모바일로 결제시 이동페이지
	const pathName = location.pathname;
	const href = location.href;
	const m_redirect = href.replaceAll(pathName, "");
	
  	const IMP = window.IMP; // 생략 가능reservation
  	// IMP.init("imp08025075");
  	IMP.init("imp84257421");
  	
	IMP.request_pay({ // param
		//pg: "html5_inicis",
		pg: "kcp",
	  	pay_method: data.payMethod,
	  	
	  	name: data.sName,
	  	num:data.sNum,
	  	rdate:data.rDate,
	  	rtime:data.rTime,
	  	menu : data.info,
	  	amount: data.amount,
	  	buyer_name : data.name,
	  	buyer_email : data.email,
	  	buyer_tel : data.phone,
	  	buyer_postcode : data.id,
	  	m_redirect_url: m_redirect, 
  	}, 
	function (rsp) { // callback
  	  console.log(rsp)
  	    $.ajax({
  	      type : "POST",
  	      url : "${contextPath}/verifyIamport/" + rsp.imp_uid
  	    }).done(function(data){
  	      
  	      if(rsp.paid_amount == data.response.amount){
  	        data.impUid = rsp.imp_uid;
  	        paymentComplete(data);  
  	      }else(
  	        alert("결제실패")
  	      )
  	    })
	});
}

//계산 완료
function paymentComplete(data){
	var dto = {
			
			sShop : $("input[name='sNum']").val(), 
			id : $("input[name='id']").val(), 
			rDate : $("input[name='rDate']").val(), 
			rTime : $("#selectTime").val(), 
			info : $("input[name='info']").val(), 
			name : name, 
			price : '${dto.price}', 
		}
	
	$.ajax({
		url:'${contextPath}/reservation/paymentComplete',
		method : "POST", contentType: "application/json; charset=utf-8", 
		data: JSON.stringify(dto),
		success: function() {
			alert("결제 성공")
			location.replace("${contextPath}/");
		},error: function(){
			alert("결제 실패")
		}
	})
	
}
</script>
</body>
</html>