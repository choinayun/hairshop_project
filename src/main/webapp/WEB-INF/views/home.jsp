<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
<c:import url="default/header.jsp"/>
<div id="wrap">

<p align="middle"><video width="700px" controls="controls" poster="${path}/resources/images/chahong1.png"  src="${path}/resources/video/chahong1.mp4"></video> </p>


</div>
<c:import url="default/footer.jsp"/>
</body>
</html>