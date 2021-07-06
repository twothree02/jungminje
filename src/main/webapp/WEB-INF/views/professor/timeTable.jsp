<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간표</title>
</head>
<body>
 <c:import url="../default/professorHeader.jsp" />
 <h3 style="margin-top: 20px; margin-left: 20px;">시간표</h3>
	<hr style="border: inset 5px lightgray">
	<!-- 밑에 enctype을 안 써주면 오류가 난다. -->
	<div class="container">
		<table class="table">
			<thead class="thead-dark" style="text-align: center;">
				<tr>
					<th>년도-학기</th>
					<th>학과</th>
					<th>과목명</th>
					<th>담당교수</th>
					<th>강의실</th>
					<th>시간</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tTable" items="${timeTable }">
					<!-- var와 items의 이름이 같으면 인식 못함 -->
					<c:choose>
						<c:when test="${tTable.major == null}">
							<tr>
								<td align='center'>시간표가 정해지지 않았습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<!-- <table border="1"><tr><td>${gInfo.subjectName}</td></tr></table> -->
							<tr>
								<td align='center'>${tTable.yearSeme }</td>
								<td align='center'>${tTable.major }</td>
								<td align='center'>${tTable.subject }</td>
								<td align='center'>${tTable.professor }</td>
								<td align='center'>${tTable.lectureRoom }</td>
								<td align='center'>${tTable.week },${tTable.time }</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</tbody>
			</table>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>