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
}

.imgdiv {
	
}

.content {
	width: 90%;
	height: 50%;
	margin: auto;
}

.infoTable {
	width: 38%;
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
			<h1 style="text-align: center;">학생 정보</h1>
		</div>
		<hr>
		<div class="officerInfo">
			<div class="imgDiv">
				<img class="navbar-brand rounded-circle"
					src="../resources/img/nan.png" width=150px; height=150px;
					style="margin-left: 15px; margin-right: 15px;">
			</div>
			<div class="infoTable">
				<table class="table">
					<tbody>
						<tr>
							<th scope="col">학 번</th>
							<td scope="col">${dto.idNum}</td>
						</tr>
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
						<tr>
							<td></td>
							<td></td>
						</tr>

					</tbody>
				</table>
			</div>
			<div class="infoTable">
				<table class="table" style = "margin-right: 20%;">
					<tbody>
						<tr>
							<th scope="col">이 름</th>
							<td scope="col">${dto.name}</td>
						</tr>
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
						<tr>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>

			</div>
		</div>

		<div class="menuBar">
			<div class="btn-group" role="group" aria-label="Basic example"
				style="margin-top: 7px; margin-left: 25px; margin-bottom: 7px;">
			</div>
		</div>
		<div class="content">
			<span class="badge badge-success"
				style="width: 100px; height: 30px; padding-top: 1%; padding-bottom: 2%; margin-top: 2%;">
				기본정보 </span> <br>
		</div>
		<div class="officerInfo" style="padding-top: 20px;">
			<div class="infoTable">
				<table class="table">
					<tbody>
						<tr>
							<th scope="col">지 도 교 수</th>
							<td scope="col">${dto.mentor}</td>
						</tr>
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
			<div class="infoTable">
				<table class="table">
					<tbody>
						<tr>
							<th scope="col">주 소</th>
							<td scope="col">${dto.addr} ${dto.detailAddr}</td>
						</tr>
						<tr>
							<th scope="row">우편발송여부</th>
							<td>${dto.zipcodeSend}</td>
						</tr>
						<tr>
							<td></td><td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>