<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
 <c:import url="../default/professorHeader.jsp" />
<h3 style="margin-top:20px; margin-left:20px;">성적 입력</h3>
<hr style="border:inset 5px lightgray">
<!-- 밑에 enctype을 안 써주면 오류가 난다. -->
<form action="${contextPath }/professor/input_grade" enctype="multipart/form-data" method="post">
<table border="1">
<tr><td>학 번</td> <td>학 과 / 학 기</td> <td>이  름</td> <td>성 적</td> <td>등 급</td></tr>
<c:forEach var="gInfo" items="${gradeInfo }"> <!-- var와 items의 이름이 같으면 인식 못함 -->
<!-- <table border="1"><tr><td>${gInfo.subjectName}</td></tr></table> -->
<tr>
<td align='center'><input type="text" name="keyId" value="${gInfo.idNum }" readonly></td> 
<td align='center'>${gInfo.majorSeme }</td>
 <td align='center'>${gInfo.name }</td> 
 <td align='center'><input type="text" name="inputScore" value="${gInfo.score }"></td> 
 <td align='center'><input type="text" name="inputGrade" value="${gInfo.grade }" readonly></td>
</tr>
</c:forEach>
</table>
<input type="submit" value="성적 저장">
</form>
</body>
</html>