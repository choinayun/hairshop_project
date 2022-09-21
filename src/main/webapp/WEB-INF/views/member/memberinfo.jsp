<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  .wrap{
    width: 800px;
    margin: auto;
 	text-align: center;
  }
  table {
    width: 100%;
    border: 1px solid #A6A6A6;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #A6A6A6;
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
  
</style>

</head>
<body>
<%@ taglib prefix="c" 
				uri="http://java.sun.com/jsp/jstl/core" %>
				<c:set var="contextPath" 
			value="${ pageContext.request.contextPath}"/>
<%@ include file="../default/header.jsp" %>
<div class="wrap">
	<h3 style="margin:auto;text-align: left;">회원 정보 보기 및 탈퇴</h3>
	<br><br>
	<table border="1" style="margin:auto; text-align: left ;">
			<tr>
				<th>아이디</th>
				<th width="60px">이름</th>
				<th>이메일</th>
				<th width="120px">전화번호</th>
				<th>주소</th>
				<th width="100px">회원 분류</th>
				<th>회원 등급 변경</th>
				<th>변경</th>
				<th>탈퇴</th>
				
			</tr>
			<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.id }</td>
				<!-- <td>${dto.pw }</td> -->
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
				<td hidden=""><button type="button" onclick="func('${dto.id}')">변경</button></td>
				</c:if>
				
				
				<c:if test="${!dto.id.equals('admin')}">
				<td><button type="button" onclick="location.href='${contextPath }/member/del?id=${dto.id}'">탈퇴</button></td>
				</c:if>
				<c:if test="${dto.id.equals('admin')}">
				<td hidden=""><button type="button" onclick="location.href='${contextPath }/member/del?id=${dto.id}'">탈퇴</button></td>
				</c:if>
				
			</tr>
			</c:forEach>
		</table>
								<!-- 관리자는 탈퇴 버튼이 안보이게 설정 -->
						
</div>

</body>
</html>