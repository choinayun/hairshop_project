<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Four Season Hair</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	var grade = ${shop.grade}
	
	if(grade > 0 && grade < 1) {
		$(".star_size").css({ width: '10%' })
	}else if(grade == 1) {
		$(".star_size").css({ width: '20%' })
	}else if(grade > 1 && grade < 2){
		$(".star_size").css({ width: '30%' })
	}else if(grade == 2) {
		$(".star_size").css({ width: '40%' })
	}else if(grade > 2 && grade < 3){
		$(".star_size").css({ width: '50%' })
	}else if(grade == 3){
		$(".star_size").css({ width: '60%' })
	}else if(grade > 3 && grade < 4){
		$(".star_size").css({ width: '70%' })
	}else if(grade == 4) {
		$(".star_size").css({ width: '80%' })
	}else if(grade > 4 && grade < 5) {
		$(".star_size").css({ width: '90%' })
	}else if(grade == 5) {
		$(".star_size").css({ width: '100%' })
	}
	
	$.ajax({
		url: "${path}/review/getGradeCnt?sNum=${shop.sNum}", type: "get",
		dataType: "json",
		success: function(data) {
			var cnt = 0
			for(var i = 0; i < data.length; i++) {
				$(".grade" + i).text(i+1+".0("+data[i]+")")
				cnt += data[i]
			}
			$(".review_cnt").text(cnt+"개")
		},error: function() {
			alert("ERROR")
		}
	})
	
	$.ajax({
			url: "${path}/review/getReview?sNum=${shop.sNum}", type: "get",
			dataType: "json",
			success: function(data) {
				for(var i = 0; i < data.length; i++){
					if(data[i].grade == 1) {
						$("." + data[i].num).css({ width: '20%' })
					}else if (data[i].grade == 2){
						$("." + data[i].num).css({ width: '40%' })
					}else if(data[i].grade == 3){
						$("." + data[i].num).css({ width: '60%' })
					}else if(data[i].grade == 4){
						$("." + data[i].num).css({ width: '80%' })
					}else if(data[i].grade == 5){
						$("." + data[i].num).css({ width: '100%' })
					}
				}
			},error: function() {
				alert("ERROR")
			}
		})

</script>

<style type="text/css">
	#wrap { margin-top: 100px; }
	#review_area { 
		margin: auto; height: 100%; width: 700px;
		border-top: 1px solid rgba(0, 0, 0, 0.1); 
		text-align: left; margin-bottom: 100px;
	}
	.review_info { border-bottom: 1px solid rgba(0, 0, 0, 0.1); padding-top: 20px; padding-bottom: 20px; }
	.review_id dl { margin: 0; }
	.review_id dd { margin: 0; margin-right: 20px; display: inline-block; }
	.review_cnt { opacity: 0.7; }
	.shop_grade { font-size: 34pt; }
	#total_area { text-align: center; width: 600px; height: 250px; margin: auto; margin-bottom: 40px; }
	#total_area table { margin: auto; }
	.grade_cnt { 
		background-color: rgb(234, 234, 234, 0.4);
		padding: 20px;
		margin-top: 40px;
	}
	.star { width: 80px; text-align: left; }
	.star,.star span { 
			display:inline-block; height:16px; 
			overflow: hidden; background: url(${path}/resources/images/star.png)no-repeat; 
	}
	.star span{ background-position:left bottom;  line-height:0; vertical-align:top; }
</style>
</head>
<body>
<c:import url="../default/header.jsp"/>
<div id="wrap">
	<div id="total_area">
		<div class="shop_grade"><strong>${shop.grade}</strong></div>
		<div class="shop_star">
			<span class='star'>
				<span style="width: 0%" class="star_size"></span>
			</span>
		</div>
		<div class="review_cnt"></div>
		<div class="grade_cnt">
			<table>
				<tr>
					<td>★★★★★</td><td class="grade4">5.0(0)</td><td>&emsp;</td><td>★★★★☆</td><td class="grade3">4.0(0)</td>
				</tr>
				<tr>
					<td>★★★☆☆</td><td class="grade2">3.0(0)</td><td>&emsp;</td><td>★★☆☆☆</td><td class="grade1">2.0(0)</td>
				</tr>
				<tr>
					<td>★☆☆☆☆</td><td class="grade0">1.0(0)</td>
				</tr>
			</table>
		</div>
	</div>
	<div id="review_area">
		<c:forEach var="review" items="${review}">
			<div class="review_info">
				<div><b>${review.info}</b></div>
				<div>
					<span class="star">
						<span style="width: 0%" class="review_star_size ${review.num}"></span>
					</span>
					<span>${review.grade}</span>
				</div>
				<div class="review_content">${review.content}</div>
				<div class="review_id">
					<dl>
						<dd>${review.id}</dd><dd>${review.rDate}</dd>
					</dl>
				</div>
				<c:if test="${review.img != 'nan'}">
					<div class="review_img">
						<img src="${path}/shop/download?fileName=${review.img}" width="100px" height="100px" style="border-radius: 6px; margin-top: 10px;">
					</div>
				</c:if>
			</div>
		</c:forEach>
	</div>
</div>
<c:import url="../default/footer.jsp"/>
</body>
</html>