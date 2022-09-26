<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
<style type="text/css">
	a { color: black; }
	table { border-collapse: collapse; }
	h1 { margin: auto; font-size: 30px; }
</style>

</head>
<body>

	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<c:import url="../default/header.jsp"/> 
	
	<div class="wrap">
	
		<div class="top">
			<a href="${contextPath }/mypage/main"><span>뒤로가기</span></a>
			<a href="${contextPath }/"><span>홈</span></a>
		</div>
		<br><br>
		<h1>리뷰 목록</h1>
		<br>
		<div class="rlistwrap">
			<table border="1">
				<tr>
					<th>글 번호</th>
					<th>작성자</th>
					<th>헤어샵</th>
					<th>시술정보</th>
					<th>별점</th>
					<th>날짜</th>
				</tr>
				<c:if test="${reviewList.size() == 0}" >
					<tr>
						<td colspan="6">
							<font color="#A6A6A6">
							작성된 리뷰가 없습니다.<br>
							리뷰를 작성해주세요. </font>
						</td>
					</tr>
				</c:if>
				<c:if test="${reviewList.size() != 0 }" >
				<c:forEach var="dto" items="${reviewList}">
					<tr>
						<td>
							<a href="${contextPath }/review/contentView?num=${dto.num }">${dto.num }</a>
						</td>
						<td>${dto.id }</td>						
						<td>${dto.sName }</td>						
						<td>${dto.info }</td>						
						<td><c:forEach begin="1" end="${dto.grade}">★</c:forEach></td>						
						<td>${dto.rDate }</td>										
					</tr>
				</c:forEach>
				<tr>
					<td colspan="6">
						<div align="center">
							<c:forEach var="num" begin="1" end="${repeat }">
								<a href="reviewAllList?num=${num }">[${num }]</a>&nbsp;							
							</c:forEach>
						</div>
					</td>
				</tr>
				</c:if>
			</table>
		</div>
	</div>


</body>
</html>