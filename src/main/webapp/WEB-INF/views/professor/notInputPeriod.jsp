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
<div class="container">
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
						<tr>
							<td align='center' colspan="7"><b>성적 입력 기간이 아닙니다.</b></td>
						</tr>
				</tbody>
			</table>
	</div>	
	<c:import url="../default/footer.jsp" />
</body>
</html>