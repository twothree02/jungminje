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
	/*  border: 1px solid black; */
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
	width: 100%;
	height: 50%;
	margin :auto;
	
}

.infoTable{width: 35%; margin-left: 10px; margin-right: 30px;}
.grade_info{
	display: flex; width: 100%; height: 60%;
}
.semester_grade{width: 50%; overflow: auto;}
.detail_grade{width: 50%; overflow: auto;}
.total_grade{width: 50%; margin-top: 5px;}
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
			<c:if test="${info.imageFile == 'nan'}">
				<img class="navbar-brand rounded-circle"
					src="../resources/img/nan.png" width=150px; height=150px; style="margin-left: 15px; margin-right: 15px;">
			</c:if>
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
				<div class="grade_info">
				<div class="semester_grade">
				<div style="height: 15%;">
				<span class="badge badge-success">학기성적</span>
				</div>
					<table class="table" style="text-align: center;">
						<thead class="thead-dark">
							<tr>
								<th>학년/학기</th>
								<th>신청학점</th>
								<th>취득학점</th>
								<th>취득학점 평균</th>
								<th>석  차</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><a href="#">101</a></td>
								<td>12</td>
								<td>12</td>
								<td>4.5</td>
								<td>1/40</td>
							</tr>
							<tr>
								<td><a href="#">102</a></td>
								<td>12</td>
								<td>12</td>
								<td>4.5</td>
								<td>1/40</td>
							</tr>
														<tr>
								<td><a href="#">102</a></td>
								<td>12</td>
								<td>12</td>
								<td>4.5</td>
								<td>1/40</td>
							</tr>
														<tr>
								<td><a href="#">102</a></td>
								<td>12</td>
								<td>12</td>
								<td>4.5</td>
								<td>1/40</td>
							</tr>
						</tbody>
					</table>

				</div>
				<div class="detail_grade">
				<div style="height: 15%;">
				<span class="badge badge-success">교과목별 성적</span>
				</div>
				<table class="table" style="text-align: center;">
						<thead class="thead-dark">
							<tr>
								<th>번호</th>
								<th>학년/학기</th>
								<th>교과목</th>
								<th>취득학점</th>
								<th>평점</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>101</td>
								<td>경영학원론</td>
								<td>3</td>
								<td>4.0</td>
							</tr>
							<tr>
								<td>2</td>
								<td>101</td>
								<td>회계원리</td>
								<td>3</td>
								<td>4.0</td>
							</tr>
							<tr>
								<td>3</td>
								<td>101</td>
								<td>경제학원론</td>
								<td>3</td>
								<td>4.0</td>
							</tr>
							<tr>
								<td>4</td>
								<td>101</td>
								<td>거시경제학</td>
								<td>3</td>
								<td>4.0</td>
							</tr>
						</tbody>
					</table>
				</div>
				</div>
				<div class="total_grade">
				<div style="height: 15%; margin-bottom: 5px;">
				<span class="badge badge-success">누적성적</span>
				</div>
				<table class="table" style="text-align: center;">
						<thead class="thead-dark">
							<tr>
								<th>신청학점</th>
								<th>취득학점</th>
								<th>평균평점</th>
								<th>환산점수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>24</td>
								<td>24</td>
								<td>4.25</td>
								<td>95</td>
							</tr>
						</tbody>
					</table>
				
				</div>
			
			
			</div>

		</div>
</body>
</html>