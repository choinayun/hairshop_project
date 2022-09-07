<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function daumPost(){
    new daum.Postcode({
        oncomplete: function(data) {
        	console.log(data.roadAddress)
            console.log(data.jibunAddress)
        	
        	 if(data.addressType=="R"){
	            	var s_addr=data.roadAddress
	            }else{
	            	var s_addr=data.jibunAddress
	            }
        	document.getElementById("s_addr").value=s_addr
        }
    }).open();
}
</script>
<style type="text/css">
a{
	text-decoration: none;
	color: black;
}
</style>
<style>
  table {
    width: 100%;
    border: 1px solid #A6A6A6;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #A6A6A6;
  }
  input{
   	border: 0;
  }

 Button {
	width: 20%;
	background: white;
	border:1px solid #e7e7e7;	
	-webkit-transition-duration: 0.4s; 
	transition-duration: 0.4s;
  	background-color: white;
 	color: black;
  
}
Button:hover {

  background-color: #e7e7e7;

}
 #Button {
 	margin-left:300px;
	width: 20%;
	background: white;
	border:1px solid #e7e7e7;	
	-webkit-transition-duration: 0.4s; 
	transition-duration: 0.4s;
  	background-color: white;
 	color: black;
  
}
#Button:hover {

  background-color: #e7e7e7;

}

  
</style>
</head>
<body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<%@ include file="../default/header.jsp" %>
<%@ taglib prefix="c" 
				uri="http://java.sun.com/jsp/jstl/core" %>
				
<div class="wrap">
<h3 style="margin:auto;text-align: left;">샵 수정하기</h3>
<br>
<form action="modify" method="post" enctype="multipart/form-data">
	<table>
	<tr>
	<th>고유 번호</th>
	<td>
		<input type="text" value="${dto.s_num}" id="s_num"name="s_num" readonly="readonly" width="10px">
		<h4 style="color: red;">※변경 불가</h4>
	</td>
	

	<th>아이디</th>
	<td>
		<input type="text" value="${dto.id}" name="id" id="id"readonly="readonly">
		<h4 style="color: red;">※변경 불가</h4>
	</td>
	</tr>
	
	<tr>
	<th>샵 이름</th>
	<td><input type="text" value="${dto.s_name}" name="s_name" id="s_name"></td>
	
	
	<th rowspan="2">샵 주소</th>
	<td rowspan="2">
		<input type="text" value="${dto.s_addr}" name="s_addr"id="s_addr" readonly="readonly">
		<button type="button" onclick="daumPost()">검색</button>
	</td>
	</tr>
	
	<tr>
	<th>매장 번호</th>
	<td><input type="text" value="${dto.s_phone}" name="s_phone" id="s_phone"></td>
	</tr>
	
	<tr>
		<th>사진1</th>
			<td>
			<c:if test="${ dto.img1 == 'nan' }"> <b>이미지가 없습니다</b> </c:if>
			<c:if test="${ dto.img1 != 'nan' }">
				<img width="100px" height="100px" 
				src="${contextPath}/admin/download?img=${dto.img1}">
			</c:if><br>
				<input type="file" name="img" id="img1" value="변경"></td>
				
	
	
		<th>사진2</th>
		<td>
			<c:if test="${ dto.img1 == 'nan' }"> <b>이미지가 없습니다</b> </c:if>
			<c:if test="${ dto.img1 != 'nan' }">
				<img width="100px" height="100px" 
				src="${contextPath}/admin/download?img=${dto.img2}">
			</c:if><br>
			<input type="file" name="img" id="img2" value="변경">
		</td>
	</tr>
	<tr>
	<th>사진3</th>
		<td>
			<c:if test="${ dto.img1 == 'nan' }"> <b>이미지가 없습니다</b> </c:if>
			<c:if test="${ dto.img1 != 'nan' }">
				<img width="100px" height="100px" 
				src="${contextPath}/admin/download?img=${dto.img3}">
			</c:if><br>
			<input type="file" name="img" id="img3" value="변경">
		</td>
	<th>사진4</th>
		<td>
			<c:if test="${ dto.img1 == 'nan' }"> <b>이미지가 없습니다</b> </c:if>
			<c:if test="${ dto.img1 != 'nan' }">
				<img width="100px" height="100px" 
				src="${contextPath}/admin/download?img=${dto.img4}">
			</c:if><br>
			<input type="file" name="img" id="img4" value="변경">
		</td>
	</tr>
	</table>
	<input type="hidden" name="originName" value="${dto.img1}">
	<input type="hidden" name="originName" value="${dto.img2}">
	<input type="hidden" name="originName" value="${dto.img3}">
	<input type="hidden" name="originName" value="${dto.img4}">
	
	<br>
	<div id="mButton">
	<input type="submit" value="수정하기" id="Button">
	<button type="button" onclick="history.back()">취소</button>
	</div>

</form>



</div>
</body>
</html>