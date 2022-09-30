<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Four Season Hair</title>
<style>
  .wrap{
    width: 800px;
    margin: auto;
 	text-align: center;
  }
   table {
    width: 100%;
    border-top: 1px solid #A6A6A6;
    border-bottom: 1px solid #A6A6A6;
    border-collapse: collapse;
  }
  th, td {
  	border-bottom: 1px solid rgb(0, 0, 0, 0.4);
  	border-right: 1px solid rgb(0, 0, 0, 0.4);
    text-align: center;
  }
</style>
<style type="text/css">
	a {
	text-decoration: none;
	color: black;
}
</style>
<script type="text/javascript">
	function func(id) {
		var test = document.getElementById("po"+id).value
		location.href = "positionModify?position=" + test + "&id="+id
				
	}
</script>
<style>
 
 button {
	width: 100%;
	background: white;
	border: 0;
		
	-webkit-transition-duration: 0.4s; 

  transition-duration: 0.4s;
  background-color: white;
  color: black;
  
}
button:hover {

  background-color: #e7e7e7;

}
.del_B{
	border-right: none;
} 
.table_wrap{
	margin-top: 50px;
}
</style>

</head>
<body>
<%@ taglib prefix="c" 
				uri="http://java.sun.com/jsp/jstl/core" %>
				<c:set var="contextPath" 
			value="${ pageContext.request.contextPath}"/>
<%@ include file="../default/header.jsp" %>
<div class="wrap">
   <div class="table_wrap">
	<img src="${contextPath }/resources/images/member.png" style="margin-left: 100px;height: 80px;"></img>
	
	<br><br>
	<table style="margin:auto; text-align: left ;">
			<tr>
				<th width="60px">아이디</th>
				<th width="60px">이름</th>
				<th>이메일</th>
				<th width="120px">전화번호</th>
				<th>주소</th>
				<th width="100px">회원 분류</th>
				<th>등급 변경</th>
				<th>변경</th>
				<th class="del_B">탈퇴</th>
				
			</tr>
			<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.id }</td>
				<td>${dto.name}</td>
				<td>${dto.email}</td>
				<td>${dto.phone}</td>
				<td>${dto.addr }</td>
				<td hidden="">${dto.position}</td>
				<td>
				<c:if test="${dto.position==0}">
					<span class="user">일반 이용자</span>
				</c:if>	
				<c:if test="${dto.position==1}">
					<span class="shop">매장 관리자</span>
				</c:if>
				<c:if test="${dto.position==2}">
					<span class="admin">총 관리자</span>
				</c:if>
				</td>
				
				
				<td>
				<c:if test="${!dto.id.equals('admin')}">
				<select id="po${dto.id}">
					<option value="0"id="0">일반 이용자</option>
					<option value="1"id="1">매장 관리자</option>
				</select>
				</c:if>
				
				<c:if test="${dto.id.equals('admin')}">
				<select hidden="">
					<option value="0"id="0">일반 이용자</option>
					<option value="1"id="1">매장 관리자</option>
				</select>
				</c:if>
				
				</td>
				
				<c:if test="${!dto.id.equals('admin')}">
				<td><button type="button" onclick="func('${dto.id}')">변경</button></td>
				</c:if>
				<c:if test="${dto.id.equals('admin')}">
				<td></td>
				</c:if>
		
				
				<c:if test="${!dto.id.equals('admin')}">
				<td class="del_B"><button type="button" onclick="location.href='${contextPath }/member/del?id=${dto.id}'">탈퇴</button></td>
				</c:if>
				<c:if test="${dto.id.equals('admin')}">
				<td class="del_B"></td>
				</c:if>
				
			</tr>
			</c:forEach>
		</table>
								<!-- 관리자는 탈퇴 버튼이 안보이게 설정 -->
	</div>						
</div>

</body>
</html>