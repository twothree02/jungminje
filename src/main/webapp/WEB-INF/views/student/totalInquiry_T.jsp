<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>종합 정보 조회_등록</title>
<style type="text/css">
div {
	/* border: 1px solid black;  */
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
	display: flex;
	justify-content: center;
}

.infoTable{width: 35%; margin-left: 10px; margin-right: 30px;}
.content1{width: 48%; height: 90%; margin-right: 5px;}
.content2{width: 48%; height: 90%;}
.content3{display: flex;}
</style>

</head>
<body>
	<c:set var="conetxtPath" value="<%=request.getContextPath()%>" />
	<c:import url="../default/studentheader.jsp" />
	<div class="wrap">
		<div class="title">
			<h1>종합정보 조회</h1>
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
			<div class="content" style="display: flex;">
			<div class="content1">
				<div style="height: 10%;">
					<span class="badge badge-success">등록정보</span>
				</div>
				<table class="table" style="text-align: center;">
						<thead class="thead-dark">
							<tr>
								<th>번호</th>
								<th>연도</th>
								<th>학기</th>
								<th>고지금액(만원)</th>
								<th>납부액(만원)</th>
								<th>등록</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<c:choose>
								<c:when test="${info.gradeSemester >= 1}">
								<c:if test="${tuition.grade101 != 'N' }">
								<td>${tuition.grade101}</td>
								</c:if>
								<c:if test="${tuition.grade101 == 'N' }">
								<td>-</td>
								</c:if>
								<td>101</td>
								<td>300</td>
								<td>300</td>
							    <c:if test="${tuition.grade101 == 'N' }">
								<td>${tuition.grade101}</td>
								</c:if>
								<c:if test="${tuition.grade101 != 'N' }">
								<td>Y</td>
								</c:if>
								</c:when>
								<c:otherwise>
								<td>-</td>
								<td>101</td>
								<td>-</td>
								<td>-</td>
								<td>N</td>
								</c:otherwise>
								</c:choose>
							</tr>
							
														<tr>
								<td>2</td>
								<c:choose>
								<c:when test="${info.gradeSemester >= 2}">
								<c:if test="${tuition.grade102 != 'N' }">
								<td>${tuition.grade102}</td>
								</c:if>
								<c:if test="${tuition.grade102 == 'N' }">
								<td>-</td>
								</c:if>
								<td>102</td>
								<td>300</td>
								<td>${300 - registerA.scholarship}</td>
							    <c:if test="${tuition.grade102 == 'N' }">
								<td>${tuition.grade102}</td>
								</c:if>
								<c:if test="${tuition.grade102 != 'N' }">
								<td>Y</td>
								</c:if>
								</c:when>
								<c:otherwise>
								<td>-</td>
								<td>102</td>
								<td>-</td>
								<td>-</td>
								<td>N</td>
								</c:otherwise>
								</c:choose>
							</tr>
							
														<tr>
								<td>3</td>
								<c:choose>
								<c:when test="${info.gradeSemester >= 3}">
								<c:if test="${tuition.grade201 != 'N' }">
								<td>${tuition.grade201}</td>
								</c:if>
								<c:if test="${tuition.grade201 == 'N' }">
								<td>-</td>
								</c:if>
								<td>201</td>
								<td>300</td>
								<td>${300 - registerB.scholarship}</td>
							    <c:if test="${tuition.grade201 == 'N' }">
								<td>${tuition.grade201}</td>
								</c:if>
								<c:if test="${tuition.grade201 != 'N' }">
								<td>Y</td>
								</c:if>
								</c:when>
								<c:otherwise>
								<td>-</td>
								<td>201</td>
								<td>-</td>
								<td>-</td>
								<td>N</td>
								</c:otherwise>
								</c:choose>
							</tr>
							
														<tr>
								<td>4</td>
								<c:choose>
								<c:when test="${info.gradeSemester >= 4}">
								<c:if test="${tuition.grade202 != 'N' }">
								<td>${tuition.grade202}</td>
								</c:if>
								<c:if test="${tuition.grade202 == 'N' }">
								<td>-</td>
								</c:if>
								<td>202</td>
								<td>300</td>
								<td>${300 - registerC.scholarship}</td>
							    <c:if test="${tuition.grade202 == 'N' }">
								<td>${tuition.grade202}</td>
								</c:if>
								<c:if test="${tuition.grade202 != 'N' }">
								<td>Y</td>
								</c:if>
								</c:when>
								<c:otherwise>
								<td>-</td>
								<td>202</td>
								<td>-</td>
								<td>-</td>
								<td>N</td>
								</c:otherwise>
								</c:choose>
							</tr>

						</tbody>
					</table>
				
			</div>
			<div class="content2">
				<div style="height: 10%;">
					<span class="badge badge-success">장학정보</span>
				</div>
				<div class="content3">
				<table class="table" style="text-align: center; width: 80px;">
						<thead class="thead-dark">
							<tr>
								<th>번호</th>
							</tr>
						</thead>
						<tbody>

						<c:forEach var="num" begin="1" end="${repeat}">
						<tr>
							<td>${num}</td>
						</tr>
						</c:forEach>

					</tbody>
					</table>
				
								<table class="table" style="text-align: center;">
						<thead class="thead-dark">
							<tr>
								<th>연도</th>
								<th>학기</th>
								<th>장학명</th>
								<th>지급예정 금액(만원)</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
						<c:when test="${RegList.size() != 0 }">
						<c:forEach var="dto" items="${RegList}">
						<tr>
							<td>${dto.year}</td>
							<td>${dto.gradeSemester}</td>
							<td>성적우수</td>
							<td>${dto.scholarship}</td>
						</tr>
						</c:forEach>
						</c:when>
						<c:otherwise>
						<tr>
							<th colspan="4">장학 내역이 존재하지 않습니다.</th>
						</tr>
						</c:otherwise>
						</c:choose>
					</tbody>
					</table>
					</div>
				
			</div>
			</div>

		</div>
		  <c:import url="../default/footer.jsp" />
</body>
</html>