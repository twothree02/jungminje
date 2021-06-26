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
			<h1 style="text-align: center;">교수 / 관리자 상세정보</h1>
		</div>
		<div class="menuBar"></div>
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
							<th scope="col">사 번</th>
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
							<th scope="row">직 급</th>
							<td>${dto.position}</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
						</tr>

					</tbody>
				</table>
			</div>
			<div class="infoTable">
				<table class="table">
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
				<button type="button" class="btn btn-secondary">기본정보</button>
			</div>
		</div>
		<div class="content">
			<span class="badge badge-success"
				style="width: 100px; height: 30px; padding-top: 1%; padding-bottom: 2%; margin-top: 2%;">
				연락처 </span> <br>
		</div>
		<div class="officerInfo" style="padding-top: 20px; padding-left: 15%;">
			<div class="infoTable">
				<table class="table">
					<tbody>
						<tr>
							<th scope="col">휴 대 폰</th>
							<td scope="col">${dto.phoneNum}</td>
						</tr>
						<tr>
							<th scope="row">주 소 (자 택)</th>
							<td>${dto.addr}${dto.detailAddr}</td>
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
							<th scope="col">전 화</th>
							<td scope="col">${dto.telNum}</td>
						</tr>
						<tr>
							<th scope="row">주 소 (사 무 실)</th>
							<td>${dto.officeAddr}</td>
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