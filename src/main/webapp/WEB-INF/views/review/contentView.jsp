<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	table { border: 1px solid #dadada; }
</style>

</head>
<body>

	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<c:import url="../default/header.jsp"/> 
	
	<div class="wrap">
	
		<table border="1">
			<caption>
				<font size="5"><b>상세리뷰</b></font>
			</caption>
			<tr>
				<th width="100">글 번호</th>
				<td width="200">${dto.num }</td>
				<th width="100">작성자</th>
				<td width="200">${dto.id }</td>
			</tr>
			<tr>
				<th>헤어샵</th>
				<td>${dto.sNum }</td>
				<th>시술 정보</th>
				<td>${dto.info }</td>
			</tr>
			<tr>
				<th>별점</th>
				<td>${dto.grade }</td>
				<th>등록날짜</th>
				<td>${dto.rDate }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${dto.content }</td>
				<td colspan="2">
					<c:if test="${ dto.img == 'nan' }">
						<b>이미지가 없습니다</b>
					</c:if>
					<c:if test="${ dto.img != 'nan' }">
						<img width="250px" height="200px"
							src="${contextPath}/review/download?img=${dto.img }">
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<c:if test="${ loginUser == dto.id }">
						<input type="button" 
							   onclick="location.href='delete?num=${dto.num }&img=${dto.img }'" value="삭제하기">
					</c:if>
					<input type="button" onclick="location.href='${contextPath }/review/reviewAllList'"
										 value="목록으로 돌아가기">
				</td>
			</tr>
		</table>
	</div>

</body>
</html>