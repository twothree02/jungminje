<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="default/header.jsp" />
	<div style="height: 750px; display: flex;">
		<div
			style="border: 1px solid black; width: 15%; margin-left: 30px; margin-top: 30px; margin-right: 30px; padding-left: 20px; height: 280px;">
			<table>
				<tr>
					<th>로그인정보</th>
					<td rowspan="4"><img class="navbar-brand rounded-circle"
						src="resources/img/nan.png" width=100px; height=100px;></td>
				</tr>
				<tr>
					<th style="padding-top: 30px;">이름</th>
				</tr>
				<tr>
					<th style="padding-top: 30px;">학생</th>
				</tr>
				<tr>
					<th style="padding-top: 30px; padding-bottom: 25px;">전공</th>
				</tr>
				<tr>
					<th style="padding-right: 20px;"><button type="button"
							class="btn btn-secondary">로그아웃</button></th>
					<th><button type="button" class="btn btn-secondary">정보수정</button></th>
				</tr>
			</table>
		</div>
		<div style="width: 80%; margin-top: 30px;">
			<div
				style="width: 90%; display: flex; margin: auto; margin-bottom: 30px;">
				<div class="container">
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th>공지사항</th>
								<th style="text-align: right;"><a href="portalList">more</a></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="2">
									<ul>
										<li>1</li>
										<li>2</li>
										<li>3</li>
										<li>3</li>
										<li>3</li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="container">
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th>포털공지</th>
								<th style="text-align: right;"><a href="#">more</a></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="2">
									<ul>
										<li>1</li>
										<li>2</li>
										<li>3</li>
										<li>3</li>
										<li>3</li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div style="width: 90%; display: flex; margin: auto;">
				<div class="container">
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th>학사일지</th>
								<th style="text-align: right;"><a href="#">more</a></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="2">
									<ul>
										<li>1</li>
										<li>2</li>
										<li>3</li>
										<li>3</li>
										<li>3</li>
									</ul>
								</td>
							</tr>

						</tbody>
					</table>
				</div>
				<div class="container">
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th>공지사항</th>
								<th style="text-align: right;"><a href="#">more</a></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="2">
									<ul>
										<li>1</li>
										<li>2</li>
										<li>3</li>
										<li>3</li>
										<li>3</li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

		
</body>
</html>