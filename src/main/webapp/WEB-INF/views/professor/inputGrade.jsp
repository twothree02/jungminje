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
<h3 style="margin-top:20px; margin-left:20px;">성적 입력</h3>
<hr style="border:inset 5px lightgray">
<c:forEach var="gInfo" items="${gradeInfo }"> <!-- var와 items의 이름이 같으면 인식 못함 -->
<table border="1"><tr><td>${gInfo.subjectName}</td></tr></table>

</c:forEach>
</body>
</html>