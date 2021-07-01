<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function adminList(num) {
		$.ajax({
					url : "admin_list?num=" + num,
					type : "POST",
					//data : JSON.stringify(ArrayList) //데이터는 서버로 보낼 때 사용. success가 받아올 때.
					dataType : "json",
					contentType : "application/json;charset=utf-8",
					success : function(map) {
						let html = "<div class='content'><table class='table' style='margin-top:20px; margin-left:20px;'>"
						html += "<thead class='thead-dark' style='text-align: center;'>"
						html += "<tr><th>번호</th><th width='200px'>이름</th><th>핸드폰 번호</th>"
						html += "<th>내선 번호</th><th width='200px'>사무실</th></tr></thead>"
						for (var i = 0; i < map.list.length; i++) {
							html += "<tbody style='text-align: center;'><tr><td>"
									+ (i + 1)
									+ "</td><td>"
									+ map.list[i].name
									+ "</td>"
							html += "<td align='center'>"
									+ map.list[i].phoneNum + "</td>"
							html += "<td align='center'>" + map.list[i].telNum
									+ "</td>"
							html += "<td align='center'>"
									+ map.list[i].officeAddr
									+ "</td></tr></tbody>"
						}
						html += "</table>"

						html += "<table style='margin: auto;'><tr><td align='center' colspan='5'>"
						for (var num = 1; num <= map.repeat; num++) {
							html += "<a class='btn btn-outline-secondary' href='#' onclick='adminList(" + num
									+ ")'>" + num + "</a>"
						}
						html += "</td></tr></table></div>"

						$("#adminProfList").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게

					},
					error : function() {
						alert('문제 발생')
					}
				})
	}
	function bProfessorList(num) {
		$.ajax({
					url : "bProfessor_list?num=" + num,
					type : "POST",
					//data : JSON.stringify(ArrayList) //데이터는 서버로 보낼 때 사용. success가 받아올 때.
					dataType : "json",
					contentType : "application/json;charset=utf-8",
					success : function(map) {
						let html = "<div class='content'><table class='table' style='margin-top:20px; margin-left:20px;'>"
						html += "<thead class='thead-dark' style='text-align: center;'>"
						html += "<tr><th>번호</th><th width='200px'>이름</th><th>핸드폰 번호</th>"
						html += "<th>내선 번호</th><th width='200px'>사무실</th><tr></thead>"
						for (var i = 0; i < map.list.length; i++) {
							html += "<tbody style='text-align: center;'><tr><td>"
									+ (i + 1)
									+ "</td><td>"
									+ map.list[i].name
									+ "</td>"
							html += "<td align='center'>"
									+ map.list[i].phoneNum + "</td>"
							html += "<td align='center'>" + map.list[i].telNum
									+ "</td>"
							html += "<td align='center'>"
									+ map.list[i].officeAddr
									+ "</td></tr></tbody>"
						}
						html += "</table>"

						html += "<table style='margin: auto;'><tr><td align='center' colspan='5'>"
						for (var num = 1; num <= map.repeat; num++) {
							html += "<a class='btn btn-outline-secondary' href='#' onclick='bProfessorList("
									+ num + ")'>" + num + "</a>"
						}
						html += "</td></tr></table></div>"

						$("#adminProfList").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게

					},
					error : function() {
						alert('문제 발생')
					}
				})
	}
	function iProfessorList(num) {
		$.ajax({
					url : "iProfessor_list?num=" + num,
					type : "POST",
					//data : JSON.stringify(ArrayList) //데이터는 서버로 보낼 때 사용. success가 받아올 때.
					dataType : "json",
					contentType : "application/json;charset=utf-8",
					success : function(map) {
						let html = "<div class='content'><table class='table' style='margin-top:20px; margin-left:20px;'>"
						html += "<thead class='thead-dark' style='text-align: center;'>"
						html += "<tr><th>번호</th><th width='200px'>이름</th><th>핸드폰 번호</th>"
						html += "<th>내선 번호</th><th width='200px'>사무실</th><tr></thead>"
						for (var i = 0; i < map.list.length; i++) {
							html += "<tbody style='text-align: center;'><tr><td>"
									+ (i + 1)
									+ "</td><td>"
									+ map.list[i].name
									+ "</td>"
							html += "<td>" + map.list[i].phoneNum + "</td>"
							html += "<td>" + map.list[i].telNum + "</td>"
							html += "<td>" + map.list[i].officeAddr
									+ "</td></tr></tbody>"
						}
						html += "</table>"

						html += "<table style='margin: auto;'><tr><td align='center' colspan='5'>"
						for (var num = 1; num <= map.repeat; num++) {
							html += "<a class='btn btn-outline-secondary' href='#' onclick='iProfessorList("
									+ num + ")'>" + num + "</a>"
						}
						html += "</td></tr></table></div>"

						$("#adminProfList").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게

					},
					error : function() {
						alert('문제가 발생하였습니다.')
					}
				})
	}
	function cProfessorList(num) {
		$.ajax({
					url : "cProfessor_list?num=" + num,
					type : "POST",
					//data : JSON.stringify(ArrayList) //데이터는 서버로 보낼 때 사용. success가 받아올 때.
					dataType : "json",
					contentType : "application/json;charset=utf-8",
					success : function(map) {
						let html = "<div class='content'><table class='table' style='margin-top:20px; margin-left:20px;'>"
						html += "<thead class='thead-dark' style='text-align: center;'>"
						html += "<tr><th>번호</th><th width='200px'>이름</th><th>핸드폰 번호</th>"
						html += "<th>내선 번호</th><th width='200px'>사무실</th><tr></thead>"
						for (var i = 0; i < map.list.length; i++) {
							html += "<tbody style='text-align: center;'><tr><td>"
									+ (i + 1)
									+ "</td><td>"
									+ map.list[i].name
									+ "</td>"
							html += "<td>" + map.list[i].phoneNum + "</td>"
							html += "<td>" + map.list[i].telNum + "</td>"
							html += "<td>" + map.list[i].officeAddr
									+ "</td></tr></tbody>"
						}
						html += "</table>"

						html += "<table style='margin: auto;'><tr><td align='center' colspan='5'>"
						for (var num = 1; num <= map.repeat; num++) {
							html += "<a class='btn btn-outline-secondary' href='#' onclick='cProfessorList("
									+ num + ")'>" + num + "</a>"
						}
						html += "</td></tr></table></div>"

						$("#adminProfList").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게

					},
					error : function() {
						alert('문제가 발생하였습니다.')
					}
				})
	}
	function searchStaff() {
		let formData = {}
		let arr = $("#frm").serializeArray()
		for (i = 0; i < arr.length; i++) {
			formData[arr[i].name] = arr[i].value
		}
		$.ajax({
					url : "search_staff",
					type : "POST",
					dataType : "json",
					data : JSON.stringify(formData),
					contentType : "application/json;charset=utf-8",
					success : function(list) {
						if (list.length == 0) {
							let html = "<div class='content'><table class='table' style='margin-top:20px; margin-left:20px;'>"
							html += "<thead class='thead-dark' style='text-align: center;'>"
							html += "<tr><th>번호</th><th width='200px'>이름</th><th>핸드폰 번호</th>"
							html += "<th>내선 번호</th><th width='200px'>사무실</th><tr></thead>"
							html += "<tbody style='text-align: center;'><tr><td colspan='6'><b>찾으시는 교직원이 없습니다.</b></td></tr>"
							$("#adminProfList").empty().append(html)
						} else {
							let html = "<div class='content'><table class='table' style='margin-top:20px; margin-left:20px;'>"
							html += "<thead class='thead-dark' style='text-align: center;'>"
							html += "<tr><th>번호</th><th width='200px'>이름</th><th>핸드폰 번호</th>"
							html += "<th>내선 번호</th><th width='200px'>사무실</th><tr></thead>"
							for (var i = 0; i < list.length; i++) {
								html += "<tbody style='text-align: center;'><tr><td>"
										+ (i + 1)
										+ "</td><td>"
										+ list[i].name
										+ "</td>"
								html += "<td>" + list[i].phoneNum + "</td>"
								html += "<td>" + list[i].telNum + "</td>"
								html += "<td>" + list[i].officeAddr
										+ "</td></tr></tbody>"
							}
							html += "</table></div>"
							$("#adminProfList").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게, 같은 이름으로 걸어주니 모든 게 해결...
						}
					},
					error : function() {
						alert('문제가 발생하였습니다.')
					}
				})
	}
</script>
</head>
<body>
	<c:import url="../default/professorHeader.jsp" />
	<div class="container">
		<div class="menuBar" style="margin-top: 20px; margin-left: 20px;">
			<div class="btn-group" role="group" aria-label="Basic example">
				<button type="button" class="btn btn-secondary"
					onclick="adminList($('#firstNum').val())">행 정</button>
				<button type="button" class="btn btn-secondary"
					onclick="bProfessorList($('#firstNum').val())">경영학과</button>
				<button type="button" class="btn btn-secondary"
					onclick="iProfessorList($('#firstNum').val())">정보통신과</button>
				<button type="button" class="btn btn-secondary"
					onclick="cProfessorList($('#firstNum').val())">자동차공학과</button>
			</div>
			<div style="display: inline-block;">
				<form name="frm" id="frm" method="post" onsubmit="return false">
					<input type="text" name="staName" id="staName"
						placeholder="이름으로 검색해주세요"> <input type="button" value="검색" class="btn btn-secondary"
						onclick="searchStaff()">
				</form>
			</div>
		</div>

		<input type="hidden" value="1" id="firstNum">
		<div id="adminProfList"></div>
	</div>
</body>
</html>