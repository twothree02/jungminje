<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>종합 정보 조회_기본 정보</title>
<style type="text/css">
div {
	 /*border: 1px solid black;*/
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
	height: 6.5%;
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
	<div class="wrap" style="overflow: auto;">
		<div class="title">
			<h1>종합 정보 조회</h1>
		</div>
		<div class="memberInfo">
			<div class="imgDiv">
			<c:choose>
			<c:when test="${info.imageFile == 'nan'}">	
				<img class="navbar-brand rounded-circle"
					src="../resources/img/nan.png" width=150px; height=150px; style="margin-left: 15px; margin-right: 15px;">
			</c:when>
			<c:otherwise>
			<img class="navbar-brand rounded-circle"
					src="${contextPath }/root/student/download?file=${info.imageFile}" width=150px; height=150px; style="margin-left: 15px; margin-right: 15px;">
			</c:otherwise>
			</c:choose>
			</div>			
			<div class="infoTable">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">학    번</th>
							<td scope="col">${info.idNum}</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">휴 대 폰</th>
							<td>${info.phoneNum}</td>
						</tr>
						<tr>
							<th scope="row">이 메 일</th>
							<td>${info.email}</td>
						</tr>
						<tr>
							<th scope="row">학년 - 반</th>
							<td>${info.grade}-${info.classInfo}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="infoTable">
			
							<table class="table">
					<thead>
						<tr>
							<th scope="col">이   름</th>
							<td scope="col">${info.name }</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">생 년 월 일</th>
							<td>${info.birthDate}</td>
						</tr>
						<tr>
							<th scope="row">학   과</th>
							<td>${info.major }</td>
						</tr>
						<tr>
							<th scope="row">국   적</th>
							<td>${info.country }</td>
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
			<div class="content">
				<div class="badge1" style="margin-top: 10px;">
				<span class="badge badge-success" style="margin-left: 50px;">기본정보</span>
				</div>
				<div class="ContentTable1" style="display: flex;">
				<div class="infoTable2" style="margin-left: 120px;">
			
							<table class="table">
					<thead>
						<tr>
							<th scope="col">주민등록 번호</th>
							<td scope="col">${info.residentNum}</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">우편 발송 여부</th>
							<td>${info.zipcodeSend}</td>
						</tr>
					</tbody>
				</table>
			</div>
			
						<div class="infoTable3" style="margin-left: 100px;">
			
							<table class="table">
					<thead>
						<tr>
							<th scope="col">지 도 교 수</th>
							<td scope="col">${info.mentor}</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">SMS 발송 여부</th>
							<td>${info.smsSend}</td>
						</tr>
					</tbody>
				</table>
			
			</div>
			
				</div>
<hr>
				<div class="badge2">
				<span class="badge badge-success" style="margin-left: 50px;">연락처</span>
				</div>
				<div class="ContentTable2" style="display: flex;">
				<div class="infoTable4" style="margin-left: 120px;">
			
							<table class="table" style="width: 185px;">
					<thead>

					</thead>
						<tr>
							<th scope="col">전   화</th>
							<td scope="col">${info.telNum }</td>
						</tr>
					<tbody>
					</tbody>
				</table>
			</div>
			
						<div class="infoTable5" style="margin-left: 185px;">
			
							<table class="table">
					<thead>

					</thead>
					<tbody>
							<tr>
							<th scope="col">주   소</th>
							<td scope="col">${info.addr}/${info.detailAddr}</td>
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