<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Four Season Hair</title>
<style type="text/css">
.reply_form{
	margin-top: 200px;
}
.write_form{
	margin-top: 10px;
	border: none;
}
	.total{
		width: 800px;
 		margin: auto;
 		text-align: center;
	}
	.tab { width: 650px; margin: auto; margin-top: 50px;}
	textarea { width: 630px; height: 150px; }
	table {
    	width: 100%;
    	border: 1px solid #A6A6A6;
    	border-collapse: collapse;
 		}
  	th{
  		background-color:#D5D5D5;
    	border: 1px solid #A6A6A6;
    	text-align: center;
 	 }
 	 td{
 	 	border: 1px solid #A6A6A6;
    	text-align: center;
 	 }
</style>

</head>
<body>
<%@ include file="../default/header.jsp" %>
	<div class="total">
	
		<table border="1" class="tab">
			<tr>
				<th width="100">글 번호</th>
				<td width="200">${dto.num}</td>
				<th width="100">작성자</th>
				<td width="200">${dto.id}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${dto.title}</td>
				<th>등록일자</th>
				<td>${dto.qDate}</td>
			</tr>
			
			<tr>
				<td colspan="4">
					${dto.content}<br>
						<c:if test="${ dto.img != 'nan' }">
						<img width="300px" height="300px" 
							 src="${contextPath}/admin/download?img=${dto.img}">
					</c:if>
				
				</td>
				
			</tr>


		</table>

		


<div class="reply_form">
<c:if test="${reply != null}">
	<table class="tab">
		<c:forEach var="reply" items="${reply}">
			<tr>
				<td style="width: 20%; background-color: #D5D5D5;">관리자</td>
				<td>${reply.content}</td>
				<td style="width: 30%;margin: auto;">${reply.qDate}
				<c:if test="${loginUser.equals('admin')}">
				<img src="${contextPath }/resources/images/delete.png" style="margin-left: 50px;position: relative; top:2px;" onclick="location.href='${contextPath }/qna/delreply?num=${reply.num}&groupNum=${reply.groupNum }'"></img>
				</c:if>
				</td>
				
			</tr>
		</c:forEach>
	</table>
</c:if>
</div>

<div class="write_form">
<img src="${contextPath }/resources/images/reply.png" style="margin-top: 50px;float: left;margin-left: 80px;" ></img><br>
		<c:if test="${loginUser.equals('admin')}">
			<form method="post" action="${contextPath}/qna/reply">
				<table class="tab">
					<tr>
						<td colspan="4"><textarea name="content"></textarea></td>
					</tr>
					<tr>
						<td><input type="hidden" name="id" value="admin"></td>
						<td><input type="hidden" name="num" value="${dto.num}"></td>
						<td><input type="hidden" name="groupNum" value="${dto.num}"></td>
						
					</tr>
				</table>
				<input type="submit" value="reply">
			</form>
		</c:if>

</div>

	</div>

</body>
</html>