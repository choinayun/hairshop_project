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
</style>
</head>
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
   //cell에 id 부여
    cell.setAttribute('id', i);
     cell.innerHTML = i;
     cell.align = "center";

    cell.onclick = function(){
       clickedYear = today.getFullYear();
       clickedMonth = ( 1 + today.getMonth() );
       clickedDate = this.getAttribute('id');

       clickedDate = clickedDate >= 10 ? clickedDate : '0' + clickedDate;
       clickedMonth = clickedMonth >= 10 ? clickedMonth : '0' + clickedMonth;
       clickedYMD = clickedYear + "-" + clickedMonth + "-" + clickedDate;

       opener.document.getElementById("date").value = clickedYMD;
       self.close();
    }

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
<hr>
<div class="mInfo">
<input type="hidden" value="${dto.mNum }"><br>
매장 : <input type="text" readonly="readonly" value=""><br>
메뉴 : <input type="text" readonly="readonly" id="info" value="${dto.info }"><br>
가격 : <input type="text" readonly="readonly" id="price" value="${dto.price }"><br>
<!-- 선택한 예약일시를 출력할 위치 -->
예약시간 : <input id="selectedDate" readonly="readonly" name="selectedDate" value="" >
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
   <form action="choiceSave" method="post">
<table id="timetable" align="center">
   <tr>
      <td><input type="button" name="time" value="09:00~10:00" onclick="timeChoice(1)"></td>
      <td><input type="button" name="time" value="10:00~11:00" onclick="timeChoice(2)"></td>
      <td><input type="button" name="time" value="11:00~12:00" onclick="timeChoice(3)"></td>
   </tr>
   <tr>
      <td><input type="button" name="time" value="13:00~14:00" onclick="timeChoice(4)"></td>
      <td><input type="button" name="time" value="14:00~15:00" onclick="timeChoice(5)"></td>
      <td><input type="button" name="time" value="15:00~16:00" onclick="timeChoice(6)"></td>
   </tr>
   <tr>
      <td><input type="button" name="time" value="16:00~17:00" onclick="timeChoice(7)"></td>
      <td><input type="button" name="time" value="17:00~18:00" onclick="timeChoice(8)"></td>
      <td><input type="button" name="time" value="18:00~19:00" onclick="timeChoice(9)"></td>
   </tr>
   <tr>
      <td><input type="button" name="time" value="19:00~20:00" onclick="timeChoice(10)"></td>
      <td><input type="button" name="time" value="20:00~21:00" onclick="timeChoice(11)"></td>
      <td><input type="button" name="time" value="21:00~22:00" onclick="timeChoice(12)"></td>
   </tr>
</table>

   
   <input type="submit" value="예약하기">
</form>


<script type="text/javascript">


function timeChoice(time){
   
   $("#time").val(time)
   
  
}

</script>
    <%-- <c:import url="../default/footer.jsp"/>  --%>
</body>
</html>