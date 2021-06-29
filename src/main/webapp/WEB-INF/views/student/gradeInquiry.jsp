<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 div{/* border: 1px solid black; */}
 .title{}
 .title2{text-align: right;}
 .content{width:90%; height: 70%; justify-content: center; display: flex; overflow: auto; padding-top: 15px; margin: auto;}
</style>
</head>
<body>
<c:import url="../default/studentheader.jsp" />
<div class="wrap">
<div class="title">
<h1>성적조회</h1>
</div>
<div class="title2">
<h5>${info.major}-${info.gradeSemester} / ${info.grade}학년</h5>
</div>
<div class="content" align="center">
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

	<table class="table" style="text-align: center; ">
						<thead class="thead-dark">
							<tr>
								<th>과목명</th>
								<th>담당교수</th>
								<th >점수</th>
								<th >학점</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
						<c:when test="${period == 'Y' }">
						<c:forEach var="list" items="${grade}">
						<tr>
							<td>${list.subjectName }</td>
							<td>${list.profName }</td>
							<td>${list.score }</td>
							<td>${list.grade }</td>
						</tr>
						</c:forEach>
						</c:when>
						<c:otherwise>
						<tr>
							<th colspan="4">해당학기 성적 정정기간이 아닙니다.</th>
						</tr>
						
						</c:otherwise>
						</c:choose>
					</tbody>
					</table>

</div>

</div>
</body>
</html>