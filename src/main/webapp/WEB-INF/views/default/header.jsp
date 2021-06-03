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
		<a href="#"><img class="navbar-brand rounded-circle"
			src="resources/img/5.jpg" width=80px; height=80px;></a>

		<!-- Links -->
		<ul class="navbar-nav">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbardrop"
				data-toggle="dropdown"> 게시판 </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="${contextPath }/board/noties">공지사항</a>
					<a class="dropdown-item" href="#">학사공지</a> <a class="dropdown-item"
						href="${contextPath }/board/portal">포털공지</a> <a
						class="dropdown-item" href="${contextPath }/board/academic">학사일정</a>
				</div></li>
		</ul>
		<ul class="navbar-nav">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbardrop"
				data-toggle="dropdown"> 마이페이지 </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="${contextPath }/student/infoChk">종합정보조회</a>
					<a class="dropdown-item" href="${contextPath }/student/academicChk">학사관리</a> <a
						class="dropdown-item" href="${contextPath }/student/classChk">수강신청</a> 
						<a class="dropdown-item"href="${contextPath }/student/chkGrade">성적조회</a>
				</div></li>
		</ul>

		<ul class="navbar-nav">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbardrop"
				data-toggle="dropdown"> 종합관리시스템(교수) </a>
				<div class="dropdown-menu">
					<a class="dropdown-item"
						href="${contextPath }/professor/professorMain">교직원정보</a> <a
						class="dropdown-item" href="${contextPath }/professor/stuInfo">학생정보</a>
					<a class="dropdown-item" href="#">성적입력</a> <a class="dropdown-item"
						href="${contextPath }/professor/timeTable">시간표</a> <a
						class="dropdown-item"
						href="${contextPath }/professor/staffNetwork">연락망</a>
				</div></li>
		</ul>



		<ul class="navbar-nav">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbardrop"
				data-toggle="dropdown"> 종합관리시스템(행정) </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="${contextPath}/admin/adminInfo">교직원정보</a>
					<a class="dropdown-item" href="${contextPath }/admin/stuManagement">학생관리</a>
					<a class="dropdown-item" href="#">등록관리</a> <a class="dropdown-item"
						href="${contextPath }/admin/timeTable">시간표관리</a> <a
						class="dropdown-item" href="${contextPath }/admin/staffNetwork">연락망</a>
				</div></li>
		</ul>




	</nav>



</body>
</html>