<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<style type="text/css">
	h1 { margin: 50px 100px 20px 100px; text-align: center; }
	.secession_div {
		width: 800px;
		height: 100%;
		margin: 10px auto 42px; }	
  	.btn {
	    position: relative;
	    border: none;
	    display: inline-block;
	    padding: 15px 30px;
	    border-radius: 15px;
	    font-family: "paybooc-Light", sans-serif;
	    box-shadow: 0 15px 15px rgba(0, 0, 0, 0.2);
	    text-decoration: none;
	    font-weight: 600;
	    transition: 0.25s;
	    width: 100%;
	    margin: 20px auto 50px; }			
</style>

</head>
<body>
	
	<script type="text/javascript">
	
    	<!-- 체크박스가 체크되면 버튼 활성화 되게 만들기 -->
		function func() {
			if($("#chk").val() == 0){
				$(".btn").removeAttr("disabled")
				$("#chk").val(1)
			}else if($("#chk").val() == 1){
				$(".btn").attr("disabled", "disabled")
				$("#chk").val(0)
			}
		}
		
	</script>
 
 	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<c:import url="../default/header.jsp"/> 

	<div class="secession_div">
	
		<h1>회원 탈퇴</h1>
		<hr>
		
		<ul>
			<li>
				탈퇴 시, 헤어샵에서 예약한 내역, 관심 매장 등의 정보가 모두 삭제되며 이후 복구가 불가능 합니다.
			</li>
			<li>
				작성된 리뷰는 삭제되지 않으며, 원치 않을 경우에는 작성한 리뷰를 모두 삭제 후에 탈퇴해 주세요.
			</li>
			<li>
				서비스 탈퇴 후, 결제정보는 전자상거래 소비자 보호 법령에 의거 5년간 보관됩니다.
			</li>
		</ul>
		<hr>
		<br>
		
		<input type="checkbox" id="chk" onclick="func()" value="0">
			<label>
				<span>위 사실을 확인하였습니다.</span>
			</label>
				
		<div class="box">
    		<button class="btn" type="button" disabled="disabled"
    				onclick="location.href='${contextPath}/mypage/delete?id=${loginUser}'">서비스 탈퇴하기</button>
		</div>	
		
	 </div>
	
</body>
</html>