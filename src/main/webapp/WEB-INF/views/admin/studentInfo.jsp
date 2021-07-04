<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 정보</title>
<style type="text/css">
.title {
	width: 90%;
	height: 10% margin:auto;
	margin-top: 10px;
}

.officerInfo {
	width: 90%;
	height: 30%;
	display: flex;
	margin: auto;
	margin-top: 5px;
}

.menuBar {
	width: 100%;
	height: 8%;
	margin: auto;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

.imgdiv {
	
}

.content {
	width: 90%;
	height: 50%;
	margin: auto;
}

.infoTable {
	width: 35%;
	margin-left: 10px;
	margin-right: 30px;
	text-align: center;
}
</style>
</head>
<body>
	<c:import url="../default/adminHeader.jsp" />
	<div class="wrap">
		<div class="title">
			<h1 style="text-align: center; margin-bottom: 25px;">학생 정보</h1>
		</div>
		<hr>
		<div class="officerInfo">
			<div class="imgDiv">
				<img class="navbar-brand rounded-circle"
					src="../resources/img/nan.png" width=150px; height=150px;
					style="margin-left: 0px; margin-right: 80px;">
			</div>
			<div class="infoTable">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">학 번</th>
							<td scope="col">${dto.idNum}</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">주 민 등 록 번 호</th>
							<td>${dto.residentNum}</td>
						</tr>
						<tr>
							<th scope="row">이 메 일</th>
							<td>${dto.email}</td>
						</tr>
						<tr>
							<th scope="row">학 년 - 반</th>
							<td>${dto.grade} - ${dto.class_}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="infoTable">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">이 름</th>
							<td scope="col">${dto.name}</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">생 년 월 일</th>
							<td>${dto.birthDate}</td>
						</tr>
						<tr>
							<th scope="row">학 과</th>
							<td>${dto.major}</td>
						</tr>
						<tr>
							<th scope="row">국 적</th>
							<td>${dto.country}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div class="container">
			<div class="menuBar">
			</div>
			<div class="badge1" style="margin-top: 10px;">
				<span class="badge badge-success" style="margin-left: 50px;">기본정보 </span>
			</div>
		</div>
		<div class="container" style="display: flex;">
			<div class="content">
				<div class="infoTable2" style="margin-left: 50px;">
					<table class="table">
						<thead>
							<tr>
								<th scope="col" style="width: 150px;">지 도 교 수</th>
								<td scope="col">${dto.mentor}</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">SMS 발 송 여 부</th>
								<td>${dto.smsSend}</td>
							</tr>
							<tr>
								<td></td><td></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="container">
				<div class="infoTable2" style="margin-left: 50px;">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">주 소</th>
								<td scope="col">${dto.addr} ${dto.detailAddr}</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row" style="width: 150px;">우편발송여부</th>
								<td>${dto.zipcodeSend}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>