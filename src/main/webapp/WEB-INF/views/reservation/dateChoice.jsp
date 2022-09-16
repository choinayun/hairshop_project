<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 날짜 선택</title>
<style type="text/css">
.mInfo{
   border: 0; solid: black;
}
.resbtn{
 	position: fixed;
 	bottom: 20px;
 	right: 30px;
 	height: 50px;
 	width: 500px;
 	z-index: 4;
 }
  .price{
 	position: fixed;
 	bottom: 20px;
 	left: 30px;
 	width: 300px;
 	height: 50px;
 	z-index: 4;
 	text-align: center;
 }
 .bottomvar{
 	display: flex;
 }
</style>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
var today = new Date();
//today 보조. 고정
var date = new Date();

//선택되있던 셀 객체 저장
var selectedCell;

//오늘에 해당하는 월
var realMonth = date.getMonth()+1;
var realToDay = date.getDate();

//사용자가 클릭한 일자의 월, 일 객체
var selectedMonth = null;
var selectedDate = null;

nowMonth = today.getMonth()+1;

function buildCalendar(){
  var row = null
  var cnt = 0;
//달력 객체
  var calendarTable = document.getElementById("calendar");
//달력의 타이틀 객체 획득
  var calendarTableTitle = document.getElementById("calendarTitle");
//타이틀 수정
  calendarTableTitle.innerHTML = today.getFullYear()+"년"+(today.getMonth()+1)+"월";
  
  var firstDate = new Date(today.getFullYear(), today.getMonth(), 1);
  var lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0);
  
   //현재 참조중인 월 
   nowMonth = today.getMonth()+1;
   
   //현재 참조중인 일
   nowDate = today.getDate();
   
   //테이블 초기화
  while(calendarTable.rows.length > 2){
     calendarTable.deleteRow(calendarTable.rows.length -1);
  }
   
//셀 입력을 위해 테이블 개행
  row = calendarTable.insertRow();
//달의 첫 날 전까지 빈 셀 생성
  for(i = 0; i < firstDate.getDay(); i++){
     cell = row.insertCell();
     cnt += 1;
  }

//요일 입력 (셀 생성)
  for(i = 1; i <= lastDate.getDate(); i++){
   //예약하지 못하는 조건일경우 +1씩 되므로, noCount가 0일 시에만 클릭함수를 적용 
    noCount = 0;
     cell = row.insertCell();
   //셀 생성 후 count 증가
     cnt += 1;
   console.log("cnt >>>" + cnt);
   //cell에 id 부여
    cell.setAttribute('id', i);
    //cell.setAttribute('onClick', "alert();");
     cell.innerHTML = i;
     cell.align = "center";

     
    cell.onclick = function(){jsDateClick(this)}; // 날짜를 생성한 td 영역의 객체
    if (cnt % 7 == 1) {
       cell.innerHTML = "<font color=red>" + i + "</font>";
    }

    if (cnt % 7 == 0){
       cell.innerHTML = "<font color=blue>" + i + "</font>";
       row = calendar.insertRow();
    }
  }

  if(cnt % 7 != 0){
     for(i = 0; i < 7 - (cnt % 7); i++){
        cell = row.insertCell();
     }
  }
  
}
//전달 달력
function prevCalendar(){
   if (today.getMonth() < realMonth){
      alert("예약은 금일기준 다음날부터 30일 이후까지만 가능합니다.");   
      return false;
   }
   today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
   buildCalendar();
}
//다음달 달력
function nextCalendar(){
   if(today.getMonth()+1 == (realMonth + 1)){
      alert("예약은 금일기준 다음날부터 30일 이후까지만 가능합니다.");
      return false;
   }
   today = new Date(today.getFullYear(), today.getMonth()+1, today.getDate());
   buildCalendar();
}
</script>
<body>
<c:import url="../default/header.jsp" />
<c:set var="contextPath" 
			value="${ pageContext.request.contextPath}"/>
<hr>
<div class="mInfo">
 <form>
<input type="hidden" name="id" value="${loginUser }">
<input type="hidden" value="${dto.mNum }">
<input type="hidden" name="sNum" value="${param.sNum}">
매장 : <input type="text" name="sName" readonly="readonly" value="${param.sName }"><br>
메뉴 : <input type="text" name="info" readonly="readonly" id="info" value="${dto.info }"><br>
<input class="price" type="text" readonly="readonly" id="price" name="price" value="${dto.price }">
<!-- 선택한 예약일시를 출력할 위치 -->
예약날짜 : <input id="selectDate" name="rDate" readonly="readonly" name ="selectDate"><br>
예약시간 : <input id="selectTime" name="rTime" readonly="readonly" name="selectTime" >
 <input class="resbtn" type="submit" value="결제하기" onclick="payment()">
</form>
 

</div>
<hr>
<table id="calendar" align="center">
      <tr>
         <td align="center"><label onclick="prevCalendar()"> ◀ </label></td>
         <td colspan="5" align="center" id="calendarTitle">yyyy년 m월</td>
         <td align="center"><label onclick="nextCalendar()"> ▶ </label></td>
      </tr>
      <tr>
         <td align="center"><font color ="red">일</td>
         <td align="center">월</td>
         <td align="center">화</td>
         <td align="center">수</td>
         <td align="center">목</td>
         <td align="center">금</td>
         <td align="center"><font color ="blue">토</td>
      </tr>
      <script type="text/javascript">buildCalendar();</script>
   </table>

<table id="timetable" align="center">
   <tr>
      <td><input type="button" name="time" value="09:00~10:00" id="time_0900" onclick="timeChoice(this.value)"></td>
      <td><input type="button" name="time" value="10:00~11:00" id="time_1000" onclick="timeChoice(this.value)"></td>
      <td><input type="button" name="time" value="11:00~12:00" id="time_1100" onclick="timeChoice(this.value)"></td>
   </tr>
   <tr>
      <td><input type="button" name="time" value="13:00~14:00" id="time_1300" onclick="timeChoice(this.value)"></td>
      <td><input type="button" name="time" value="14:00~15:00" id="time_1400" onclick="timeChoice(this.value)"></td>
      <td><input type="button" name="time" value="15:00~16:00" id="time_1500" onclick="timeChoice(this.value)"></td>
   </tr>
   <tr>
      <td><input type="button" name="time" value="16:00~17:00" id="time_1600" onclick="timeChoice(this.value)"></td>
      <td><input type="button" name="time" value="17:00~18:00" id="time_1700" onclick="timeChoice(this.value)"></td>
      <td><input type="button" name="time" value="18:00~19:00" id="time_1800" onclick="timeChoice(this.value)"></td>
   </tr>
   <tr>
      <td><input type="button" name="time" value="19:00~20:00" id="time_1900" onclick="timeChoice(this.value)"></td>
      <td><input type="button" name="time" value="20:00~21:00" id="time_2000" onclick="timeChoice(this.value)"></td>
      <td><input type="button" name="time" value="21:00~22:00" id="time_2100" onclick="timeChoice(this.value)"></td>
   </tr>
   </table>

<script type="text/javascript">


function timeChoice(time){
   alert('time >>>' + time);
   
   $("#selectTime").val(time)
}


/*
 * 날짜 영역의 객체를 받아서 년월일의 파라미터로 해당 날짜의 예약정보를 리턴받음 
 */
 

 
function jsDateClick(obj){
	// 닫력에서 선택한 년월일
	var ymd = today.getFullYear().toString() +  (nowMonth < 10 ? "0"+nowMonth : nowMonth).toString() + (obj.id < 10 ? "0"+obj.id : obj.id).toString(); 
	
	$("#selectDate").val(ymd)
	
	
	$("input[name=time]").attr("disabled",false); // 달력의 disabled를 false
	// 입력받은 날짜를 파라미터로 해당 날짜에 예약된 시간대를 가져옴[list json]
	$.ajax({
	    url:'${contextPath}/reservation/dateCheck?ymd='+ymd+"&sNum=${param.sNum}", //Controller에서 요청 받을 주소///member/
	    type:'get', //get 방식으로 전달
	    success:function(obj){ // 해당 날짜의 예약정보 리스트를 받음
	 		$.each(obj, function(i, item) {
	 			// 예약된 시간이 있으면 disabled 처리함.
				$('#time_'+item.rTime).attr("disabled", true);
	 		});
	    },
	    error:function(){
	        alert("에러");
	    }
	});
}
</script>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-{SDK-최신버전}.js"></script>
<script type="text/javascript">
function payment(){
	const data={
			payMethod : 'card',
			reservNum : createReservNum(),
			sName : $("input[name='sName']").val(),
			sNum : $("input[name='sNum']").val(),
			id : $("input[name='id']").val(),
			rDate : $("input[name='rDate']").val(),
			rTime : $("input[name='rTime']").val(),
			amount : $("input[name='price']").val()
	}
	if(!data.rDate){
		swal('날짜를 선택해주세요');
		return;
	}
	if(!data.rTime){
		swal('시간을 선택해주세요');
		return;
	}
	
	paymentCard(data);
}

//주문번호 만들기
function createReservNum(){
	const date = new Date();
	const year = date.getFullYear();
	const month = String(date.getMonth() + 1).padStart(2, "0");
	const day = String(date.getDate()).padStart(2, "0");
	
	let reservNum = year + month + day;
	for(let i=0;i<10;i++) {
		reservNum += Math.floor(Math.random() * 8);	
	}
	return reservNum;
}

//카드 결제
function paymentCard(data) {
	// 모바일로 결제시 이동페이지
	const pathName = location.pathname;
	const href = location.href;
	const m_redirect = href.replaceAll(pathName, "");
	
	  const IMP = window.IMP; // 생략 가능
	  IMP.init("imp08025075");
		
	IMP.request_pay({ // param
		pg: "html5_inicis",
	  	pay_method: data.payMethod,
	  	merchant_uid: data.reservNum,
	  	name: data.sName,
	  	num:data.sNum,
	  	rdate:data.rDate,
	  	rtime:data.rTime,
	  	amount: data.amount,
	  	buyer_postcode : data.id,
	  	m_redirect_url: m_redirect, 
  	}, 
	function (rsp) { // callback
		if (rsp.success) {
         // 결제 성공 시 로직,
	        data.impUid = rsp.imp_uid;
	        data.merchant_uid = rsp.merchant_uid;
	        paymentComplete(data);  
			
		} else {
          // 결제 실패 시 로직,
		}
	});
}

//계산 완료
function paymentComplete(data){
	$.ajax({
		url:'${contextPath}/reservation/complete',
		method : "POST",
		data: data,
	})
	.done(function(result){
		messageSend();
		swal({
			text:result,
			closeOnClickOutside : false
		})
		.then(function(){
			location.replace("${contextPath}/member/main");
		})
	})
	.fail(function(){
		alert("결제 실패");
		location.replace("/")
	})
}

</script>
    <%-- <c:import url="../default/footer.jsp"/>  --%>
</body>
</html>