<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <c:import url="../default/professorHeader.jsp" />
<c:forEach var="tTable" items="${timeTable }"> <!-- var와 items의 이름이 같으면 인식 못함 -->
	<c:choose>
	<c:when test = "${tTable.major == null}">
		<table border="1">
		<tr><td align='center'>학과</td> <td align='center'>과목명</td> <td align='center'>담당교수</td>
		<td align='center'>강의실</td> <td align='center'>시간</td></tr>
		<tr>
		<td align='center'>시간표가 정해지지 않았습니다.</td>
		</tr>
		</table>
	</c:when>
	<c:otherwise>	
		<table border="1">
		<tr><td>${tTable.yearSeme}</td></tr>
		</table>
 		<table border="1">
		<tr><td align='center'>학과</td> <td align='center'>과목명</td> <td align='center'>담당교수</td> 
		<td align='center'>강의실</td> <td align='center'>시간</td></tr>
		<!-- <table border="1"><tr><td>${gInfo.subjectName}</td></tr></table> -->
		<tr>
		<td align='center'>${tTable.major }</td>
		<td align='center'>${tTable.subject }</td> 
		<td align='center'>${tTable.professor }</td> 
		<td align='center'>${tTable.lectureRoom }</td> 
		<td align='center'>${tTable.week },${tTable.time }</td> 
		</tr>
		</table>
	</c:otherwise>
	</c:choose>
</c:forEach>

</body>
</html>