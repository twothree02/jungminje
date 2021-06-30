<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적/장학 관리</title>
<style type="text/css">
.title {
	width: 90%;
	height: 10% margin:auto;
	margin-top: 10px;
}

.officerInfo {
	width: 90%;
	height: 30%;
	display: flex;
	margin: auto;
	margin-top: 5px;
}

.menuBar {
	width: 100%;
	height: 8%;
	margin: auto;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

.imgdiv {
	
}

.content {
	width: 90%;
	height: 50%;
	margin: auto;
}

.infoTable {
	width: 35%;
	margin-left: 10px;
	margin-right: 30px;
	text-align: center;
}
</style>
</head>
<body>
	<c:import url="../default/adminHeader.jsp" />
	<div class="wrap">
		<div class="title">
			<h1 style="text-align: center;">등록 관리</h1>
		</div>
	</div>
	<div class="menuBar">
	</div>
	<div>
		<div style = "padding-top: 50px; text-align: center;">
			<h3><u>납부기한 설정</u></h3>
		</div>
		<div style = "align : center;">
			<form action = "tution" method = "post">
				<table border = "1">
					<tr>
						<td>
							납부 시작일
						</td>
						<td>
							<input type = "date" name = "startDate" id = "startDate">
						</td>
					</tr>
					<tr>
						<td>
							납부 마감일
						</td>
						<td>
							<input type = "date" name = "endDate" id = "endDate">
						</td>
					</tr>
					<tr>
						<td colspan = "2">
							<button type="submit" class="btn btn-secondary">등록</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>