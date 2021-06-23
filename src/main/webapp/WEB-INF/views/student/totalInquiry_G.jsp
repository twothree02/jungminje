<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
function detailGrade(semester){
	$.ajax({
		url:"detailGrade/"+semester, type:"GET", dataType:"json",
		contentType:"application/json;charset=utf-8",
		success: function(rep){
			
			let html='<table class="table" style="text-align: center;">	<thead class="thead-dark">';
			html += '<tr><th>학년/학기</th><th>교과목</th><th>취득학점</th><th>평점</th></tr></thead><tbody>'

			rep.forEach(function(data){
				
				html += "<tr><td>"+data.semester+"</td>";
				html += "<td>"+data.subjectName+"</td>";
				html += "<td>"+data.receivedCred+"</td>";
				html += "<td>"+data.grade+"</td></tr>";
			})
			html += "</tbody></table>";
			$("#grade").html(html)
			
		}, error:function(){
			alert('문제 발생')
		}
		
	})
}

</script>
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
						<c:choose>
						<c:when test="${grade1 != null}">
							<tr>
								<td><button type="button" onclick="detailGrade(1)">101</button></td>
								<td>${grade1.applicationCred}</td>
								<td>${grade1.receivedCred}</td>
								<td>${grade1.avgGrade}</td>
								<td>${grade1.rank}/${rankCnt1}</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td>-</td>
								<td> </td>
								<td> </td>
								<td> </td>
								<td> </td>
							</tr>
							</c:otherwise>
						</c:choose>
							<c:choose>
							<c:when test="${info.gradeSemester >= 2 }">
							<tr>
								<td><button type="button" onclick="detailGrade(2)">102</button></td>
								<td>${grade2.applicationCred}</td>
								<td>${grade2.receivedCred}</td>
								<td>${grade2.avgGrade}</td>
								<td>${grade2.rank}/${rankCnt2}</td>
							</tr>
							</c:when>
							<c:otherwise>
							<tr>
								<td>-</td>
								<td> </td>
								<td> </td>
								<td> </td>
								<td> </td>
							</tr>
							</c:otherwise>
							</c:choose>
							
							<c:choose>
							<c:when test="${info.gradeSemester >= 3 }">
							<tr>
								<td><button type="button" onclick="detailGrade(3)">201</button></td>
								<td>${grade3.applicationCred}</td>
								<td>${grade3.receivedCred}</td>
								<td>${grade3.avgGrade}</td>
								<td>${grade3.rank}/${rankCnt3}</td>
							</tr>
							</c:when>
							<c:otherwise>
							<tr>
								<td>-</td>
								<td> </td>
								<td> </td>
								<td> </td>
								<td> </td>
							</tr>
							</c:otherwise>
							</c:choose>
							
							<c:choose>
							<c:when test="${info.gradeSemester >= 4 }">
							<tr>
								<td><button type="button" onclick="detailGrade(4)">202</button></td>
								<td>${grade4.applicationCred}</td>
								<td>${grade4.receivedCred}</td>
								<td>${grade4.avgGrade}</td>
								<td>${grade4.rank}/${rankCnt4}</td>
							</tr>
							</c:when>
							<c:otherwise>
							<tr>
								<td>-</td>
								<td> </td>
								<td> </td>
								<td> </td>
								<td> </td>
							</tr>
							</c:otherwise>
							</c:choose>
							
						</tbody>
					</table>

				</div>
				<div class="detail_grade">
				<div style="height: 15%;">
				<span class="badge badge-success">교과목별 성적</span>
				</div>
				<div id="grade">
				<table class="table" style="text-align: center;">
						<thead class="thead-dark">
							<tr>
								<th>학년/학기</th>
								<th>교과목</th>
								<th>취득학점</th>
								<th>평점</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th colspan="4">검색할 학기를 선택하세요</th>
							</tr>
							
						</tbody>
					</table>
					</div>
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
								<td>${total.tApplicationCred}</td>
								<td>${total.tReceivedCred}</td>
								<td>${total.tAvgGrade}</td>
								<td>${total.tScore}</td>
							</tr>
						</tbody>
					</table>
				
				</div>
			
			
			</div>

		</div>
</body>
</html>