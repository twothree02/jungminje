<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<c:set var="conetxtPath" value="<%=request.getContextPath()%>" />

	<nav class="navbar navbar-expand-sm bg-dark navbar-dark"
		style="padding: 5;">
		<!-- Brand -->
		<a href="main"><img class="navbar-brand rounded-circle"
			src="resources/img/5.jpg" width=80px; height=80px;></a>

		<!-- Links -->
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<ul class="navbar-nav">
			
				<li class="nav-item"><a class="nav-link" href="studentMain">마이페이지</a></li>
				<li class="nav-item"><a class="nav-link" href="professorMain">종합관리시스템(교수)</a></li>
				<li class="nav-item"><a class="nav-link"  href="adminMain">종한관리시스템(행정)</a>
				</li>
			</ul>
		</nav>
		</nav>	

		



</body>
</html>