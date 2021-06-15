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
 
<table border="1">
<c:forEach var="pStuInfo" items="${detailStuInfo}">
<tr>
<td>학번</td> <td>${pStuInfo.idNum}</td> <td>이름</td> <td>${pStuInfo.name}</td>
</tr>
<tr>
<td>휴대폰 번호</td> <td>${pStuInfo.phoneNum}</td> <td>생년월일</td> <td>${pStuInfo.residentNum}</td>
</tr>
<tr>
<td>이메일</td> <td>${pStuInfo.email}</td> <td>학과</td> <td>${pStuInfo.major}</td>
</tr>
<tr>
<td>학년 - 반</td> <td>${pStuInfo.class_}</td> <td>국적</td> <td>${pStuInfo.country}</td>
</tr>
</c:forEach>
</table>

</body>
</html>