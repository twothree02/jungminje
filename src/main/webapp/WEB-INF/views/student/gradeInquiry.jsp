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
 .content{width:90%; height: 70%; margin: auto;}
</style>
</head>
<body>
<c:import url="../default/studentheader.jsp" />
<div class="wrap">
<div class="title">
<h1>성적조회</h1>
</div>
<div class="title2">
<h5>경영학과-101/1학년</h5>
</div>
<div class="content" align="center">
	<table class="table" style="text-align: center;">
						<thead class="thead-dark">
							<tr>
								<th>번호</th>
								<th>과목명</th>
								<th>담당교수</th>
								<th>점수</th>
								<th>학점</th>
							</tr>
						</thead>
						<tbody>
						<tr>
							<td>1</td>
							<td>미시경제학</td>
							<td>홍길순</td>
							<td>90</td>
							<td>A</td>
						</tr>
						<tr>
							<td>1</td>
							<td>미시경제학</td>
							<td>홍길순</td>
							<td>90</td>
							<td>A</td>
						</tr>
						<tr>
							<td>1</td>
							<td>미시경제학</td>
							<td>홍길순</td>
							<td>90</td>
							<td>A</td>
						</tr>
						<tr>
							<td>1</td>
							<td>미시경제학</td>
							<td>홍길순</td>
							<td>90</td>
							<td>A</td>
						</tr>
					</tbody>
					</table>

</div>

</div>
</body>
</html>