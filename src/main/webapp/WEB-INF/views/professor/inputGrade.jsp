<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적 입력</title>

</head>
<body>
	<c:import url="../default/professorHeader.jsp" />
	<h3 style="margin-top: 20px; margin-left: 20px;">성적 입력</h3>
	<hr style="border: inset 5px lightgray">
	<!-- 밑에 enctype을 안 써주면 오류가 난다. -->
	<div class="container">
		<form action="${contextPath }/professor/input_grade"
			enctype="multipart/form-data" method="post">


			<table class="table">
				<thead class="thead-dark" style="text-align: center;">
					<tr>
						<th>학 번</th>
						<th>학 과 / 학 기</th>
						<th>이 름</th>
						<th>성 적</th>
						<th>등 급</th>
						<th>평 점</th>
						<th>과 목 명</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="gInfo" items="${gradeInfo }">
						<!-- var와 items의 이름이 같으면 인식 못함 -->
						<!-- <table border="1"><tr><td>${gInfo.subjectName}</td></tr></table> -->
						<tr>
							<td align='center'><input type="text" name="keyId"
								value="${gInfo.idNum }" readonly></td>
							<td align='center'>${gInfo.major}</td>
							<td align='center'>${gInfo.name }</td>
							<td align='center'><input type="number" min="0" max="100"
								name="inputScore" value="${gInfo.score }" required></td>
							<td align='center'><input type="text" name="inputGrade"
								value="${gInfo.grade }" readonly></td>
							<td align='center'><input type="text" name="inputNumGrade"
								value="${gInfo.numGrade }" readonly></td>
							<td align='center'>${gInfo.subjectName }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<input type="submit" class="btn btn-secondary" value="성적 저장">
		</form>
	</div>
	<c:import url="../default/footer.jsp" />



</body>
</html>