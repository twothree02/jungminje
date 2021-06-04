<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div {
	/* border: 1px solid black; */
}

.title {
	width: 90%;
	height: 10%
	margin :auto;
	margin-top: 10px;
	
}

.memberInfo {
	width: 90%;
	height: 30%;
	display: flex;
	margin :auto;
	margin-top: 5px;
}

.menuBar {
	width: 100%;
	height: 8%;
	margin :auto;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}
.imgdiv{}

.content {
	width: 90%;
	height: 50%;
	margin :auto;
}

.infoTable{width: 35%; margin-left: 10px; margin-right: 30px;}
</style>

</head>
<body>
	<c:import url="../default/studentheader.jsp" />
	<div class="wrap">
		<div class="title">
			<h1>종합정보 조회</h1>
		</div>
		<div class="memberInfo">
			<div class="imgDiv">
				<img class="navbar-brand rounded-circle"
					src="../resources/img/nan.png" width=150px; height=150px; style="margin-left: 15px; margin-right: 15px;">
			</div>
			<div class="infoTable">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">학    번</th>
							<td scope="col">123456</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">휴 대 폰</th>
							<td>Mark</td>
						</tr>
						<tr>
							<th scope="row">이 메 일</th>
							<td>Jacob</td>
						</tr>
						<tr>
							<th scope="row">학년 - 반</th>
							<td>Larry</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="infoTable">
			
							<table class="table">
					<thead>
						<tr>
							<th scope="col">이   름</th>
							<td scope="col">123456</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">생 년 월 일</th>
							<td>Mark</td>
						</tr>
						<tr>
							<th scope="row">학   과</th>
							<td>Jacob</td>
						</tr>
						<tr>
							<th scope="row">국   적</th>
							<td>Larry</td>
						</tr>
					</tbody>
				</table>
			
			</div>
			</div>

			<div class="menuBar">
			<div class="btn-group" role="group" aria-label="Basic example" style="margin-top: 7px; margin-left: 25px;">
				<button type="button" class="btn btn-secondary" onclick="location.href='${contextPath }/root/student/totalInquiry'">기본정보</button>
				<button type="button" class="btn btn-secondary" onclick="location.href='${contextPath }/root/student/totalInquiry_C'">수강</button>
				<button type="button" class="btn btn-secondary" onclick="location.href='${contextPath }/root/student/totalInquiry_G'">성적</button>
				<button type="button" class="btn btn-secondary" onclick="location.href='${contextPath }/root/student/totalInquiry_T'">등록/장학</button>
			</div>
		</div>
			<div class="content"></div>

		</div>
</body>
</html>