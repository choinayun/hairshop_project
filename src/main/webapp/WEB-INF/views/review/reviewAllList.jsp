<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Four Season Hair</title>
	
<style type="text/css">
	a { color: black; }
	h1 { margin: 50px 100px 20px 100px; text-align: center; }
	table {
	    width: 900px;
	    text-align: center;
	    border: 1px solid #fff;
	    border-spacing: 1px;
	    font-family: 'Cairo', sans-serif;
	  	margin: auto;
	}
	table tr { cursor:pointer; }
	table th {
   		background-color: #A6A6A6;
   		color: #F6F6F6;
	    padding: 10px;
	}
	table td {
	    padding: 10px;
	    background-color: #F6F6F6;
	}
	.number { background-color: white; border-left: none; }
	.border { border-left: none; }
	.border a { text-decoration: none; }
</style>

</head>
<body>

	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<c:import url="../default/header.jsp"/> 
	
	<div class="wrap">

		<h1>리뷰 목록</h1>

		<div class="rlistwrap">
			<table border="1">
				<thead>
					<tr>
						<th>글 번호</th>
						<th>작성자</th>
						<th>헤어샵</th>
						<th>시술정보</th>
						<th>별점</th>
						<th>날짜</th>
					</tr>
				</thead>
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
					<tr onclick="location.href='${contextPath }/review/contentView?num=${dto.num }'">
						<td class="border">
							<a>${dto.num }</a>
						</td>
						<td>${dto.id }</td>						
						<td>${dto.sName }</td>						
						<td>${dto.info }</td>						
						<td><c:forEach begin="1" end="${dto.grade}">★</c:forEach></td>						
						<td>${dto.rDate }</td>										
					</tr>
				</c:forEach>
				<tr>
					<td colspan="6" class="number">
						<div align="center">
							<c:forEach var="num" begin="1" end="${repeat }">
								<a href="${contextPath }/review/reviewAllList?num=${num}&id=${loginUser}">[${num }]</a>&nbsp;							
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