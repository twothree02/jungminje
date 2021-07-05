<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>종합 정보 조회</title>
<style type="text/css">
div {
	/* border: 1px solid black; */
	
}

.title {
	width: 90%;
	height: 10% margin:auto;
	margin-top: 10px;
}

.memberInfo {
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
}
</style>

</head>
<body>
	<c:import url="../default/professorHeader.jsp" />
	<div class="wrap">
		<div class="title" style="align-content: center">
			<h1 style="margin-left: 30px; margin-bottom: 25px;">종합 정보 조회</h1>
		</div>
		<hr style="border: inset 5px lightgray">
		<div class="memberInfo">
			<div class="imgDiv">
				<img class="navbar-brand rounded-circle"
					src="../resources/img/nan.png" width=150px; height=150px;
					style="margin-left: 0px; margin-right: 80px;">
			</div>
			<div class="infoTable">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">사 번</th>
							<td scope="col">${myInfo.idNum}</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">주 민 등 록 번 호</th>
							<td>${myInfo.residentNum}</td>
						</tr>
						<tr>
							<th scope="row">이 메 일</th>
							<td>${myInfo.email}</td>
						</tr>
						<tr>
							<th scope="row">직 급</th>
							<td>${myInfo.position}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="infoTable">

				<table class="table">
					<thead>
						<tr>
							<th scope="col">이 름</th>
							<td scope="col">${myInfo.name}</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">계 좌 번 호</th>
							<td>${myInfo.accountNum}</td>
						</tr>
						<tr>
							<th scope="row">학 과</th>
							<td>${myInfo.major}</td>
						</tr>
						<tr>
							<th scope="row">국 적</th>
							<td>${myInfo.country}</td>
						</tr>
					</tbody>
				</table>

			</div>
		</div>

		<div class="container">
			<div class="menuBar"></div>
			<div class="badge1" style="margin-top: 10px;">
				<span class="badge badge-success" style="margin-left: 50px;">기본정보</span>
			</div>
		</div>
		<div class="container" style="display: flex;">
			<div class="content">
					<div class="infoTable2" style="margin-left: 50px;">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">휴 대 폰</th>
									<td scope="col">${myInfo.phoneNum}</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">자 택</th>
									<td>${myInfo.addr}</td>
								</tr>
							</tbody>
						</table>
					</div>
			</div>
			<div class="content">
				<div class="infoTable2" style="margin-left: 50px;">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">전 화</th>
								<td scope="col">${myInfo.telNum}</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">사 무 실</th>
								<td>${myInfo.officeAddr}</td>
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