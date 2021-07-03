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
				<c:forEach var="mem" items="${memberList }">
					<tr>
						<th>로그인정보</th>
						<c:choose>
							<c:when test="${mem.imageFile == 'nan' }">
								<td rowspan="4"><img class="navbar-brand rounded-circle" src="resources/img/nan.png" width=100px; height=100px;></td>
							</c:when>
							<c:otherwise>
								<td rowspan="4"><img class="navbar-brand rounded-circle" src="<%=request.getContextPath() %>/member/download?imageFile=${mem.imageFile}" width=100px; height=100px;></td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<th style="padding-top: 30px;">${mem.name }</th>
					</tr>
					<tr>
						<th style="padding-top: 30px;">${mem.position }</th>
					</tr>
					<tr>
						<th style="padding-top: 30px; padding-bottom: 25px;">${mem.major }</th>
					</tr>
				</c:forEach>
				<tr>
					<th style="padding-right: 20px;"><button type="button"
							class="btn btn-secondary" onclick="location.href='<%=request.getContextPath()%>/logout'">로그아웃</button></th>
					<th><button type="button" class="btn btn-secondary" onclick="location.href='<%=request.getContextPath()%>/modifyInfo'">정보수정</button></th>
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
								<th style="text-align: right;"><a href="board/list">more</a></th>
							</tr>
						</thead>
						<tbody>
						
						<c:forEach var ="board" items="${list }">
							<tr>
							<td>${board.title}</td>	
							<td>${board.savedate }								
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="container">
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th>포털공지</th>
								<th style="text-align: right;"><a href="board/portalList">more</a></th>
							</tr>
						</thead>
						<tbody>
						
								
								<c:forEach var ="list" items="${portalMainList }">
										
							<tr>
										<td>${list.title }</td>
									
										<td>${list.savedate }</td>
										
								</tr>		
									</c:forEach>
								
							
						</tbody>
					</table>
				</div>
			</div>
			<div style="width: 90%; display: flex; margin: auto;">
				<div class="container">
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th>학사공지</th>
								<th style="text-align: right;"><a href="board/academicList">more</a></th>
							</tr>
						</thead>
						<tbody>
								<c:forEach var ="list" items="${academicMainList }">
									<tr>
									
										<td>${list.title }</td>
									
										<td>${list.savedate }</td>
								</tr>
								</c:forEach>		
							
						</tbody>
					</table>
				</div>
				<div class="container">
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th>학사일정</th>
								<th style="text-align: right;"><a href="board/schedule">more</a></th>
							</tr>
						</thead>
						<tbody>
									<tr>
										<td>2021년도</td>
										<td>3월달 학사일정</td>
								</tr>
									<tr>
										<td>2021년도</td>
										<td>4월달 학사일정</td>
								</tr>
							
									<tr>
										<td>2021년도</td>
										<td>5월달 학사일정</td>
								</tr>
							
									<tr>
										<td>2021년도</td>
										<td>6월달 학사일정</td>
								</tr>
							
									<tr>
										<td>2021년도</td>
										<td>7월달 학사일정</td>
								</tr>
							
							
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
  <c:import url="./default/footer.jsp" />		
</body>
</html>
