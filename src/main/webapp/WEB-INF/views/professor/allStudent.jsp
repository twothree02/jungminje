<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 정보</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function juniorList(num) {

		$.ajax({
					url : "junior_list?num=" + num,
					type : "POST",
					//data : JSON.stringify(ArrayList) //데이터는 서버로 보낼 때 사용. success가 받아올 때.
					dataType : "json",
					contentType : "application/json;charset=utf-8",
					success : function(map) { //function 안의 값은 내가 지정. 그 뒤의 값은 map의 put key값과 동일하게
						let html = "<div class='content'><table class='table' style='margin-top:20px; margin-left:20px;'>"
						html += "<thead class='thead-dark' style='text-align: center;'>"
						html += "<tr><th>번호</th><th>이름</th><th>학번</th>"
						html += "<th>학년</th><th>학과</th><tr></thead>"
						for (var i = 0; i < map.list.length; i++) {
							html += "<tbody style='text-align: center;'><tr><td>" + (i + 1)
									+ "</td><td>" + map.list[i].name + "</td>"
							html += "<td>"
									+ "<form action='${contextPath }/professor/detail_stuInfo' enctype='multipart/form-data' method='post'>"
									+ "<input type='text' name='id' value='"+map.list[i].idNum+"' readonly>"
									+ "<input type='submit' value='상세정보'></form></td>"
							html += "<td>" + map.list[i].grade
									+ "</td>"
							html += "<td>" + map.list[i].major
									+ "</td></tr></tbody>"
						}
						html += "</table>"

						html += "<table style='margin: auto;'><tr><td align='center' colspan='5'>"
						for (var num = 1; num <= map.repeat; num++) {
							html += "<a class='btn btn-outline-secondary' href='#' onclick='juniorList(" + num
									+ ")'>" + num + "</a>"
						}
						html += "</td></tr></table></div>"

						$("#stuList").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게, 같은 이름으로 걸어주니 모든 게 해결...
					},
					error : function() {
						alert('문제가 발생하였습니다.')
					}
				})
	}
	function seniorList(num) {
		$
				.ajax({
					url : "senior_list?num=" + num,
					type : "POST",
					//data : JSON.stringify(ArrayList) //데이터는 서버로 보낼 때 사용. success가 받아올 때.
					dataType : "json",
					contentType : "application/json;charset=utf-8",
					success : function(map) { //function 안의 값은 내가 지정. 그 뒤의 값은 map의 put key값과 동일하게
						let html = "<div class='content'><table class='table' style='margin-top:20px; margin-left:20px;'>"
							html += "<thead class='thead-dark' style='text-align: center;'>"
							html += "<tr><th>번호</th><th>이름</th><th>학번</th>"
							html += "<th>학년</th><th>학과</th><tr></thead>"
							for (var i = 0; i < map.list.length; i++) {
								html += "<tbody style='text-align: center;'><tr><td>" + (i + 1)
										+ "</td><td>" + map.list[i].name + "</td>"
								html += "<td>"
										+ "<form action='${contextPath }/professor/detail_stuInfo' enctype='multipart/form-data' method='post'>"
										+ "<input type='text' name='id' value='"+map.list[i].idNum+"' readonly>"
										+ "<input type='submit' value='상세정보'></form></td>"
								html += "<td>" + map.list[i].grade
										+ "</td>"
								html += "<td>" + map.list[i].major
										+ "</td></tr></tbody>"
							}
							html += "</table>"

							html += "<table style='margin: auto;'><tr><td align='center' colspan='5'>"
						for (var num = 1; num <= map.repeat; num++) {
							html += "<a class='btn btn-outline-secondary' href='#' onclick='seniorList(" + num
									+ ")'>" + num + "</a>"
						}
						html += "</td></tr></table></div>"

						$("#stuList").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게, 같은 이름으로 걸어주니 모든 게 해결...
					},
					error : function() {
						alert('문제가 발생하였습니다.')
					}
				})
	}
	function searchStu(num) {
		/*
		let formData = {}
		let arr = $("#frm").serializeArray()
		for(i=0; i<arr.length;i++){
			formData[arr[i].name] = arr[i].value
		}
		 */
		var searchSelect = $('#searchSelect').val()
		var searchInput = $('#searchInput').val()
		var form = {
			'searchSelect' : searchSelect,
			'searchInput' : searchInput
		}

		$
				.ajax({
					url : "search_stu?num=" + num,
					type : "POST",
					dataType : "json",
					data : JSON.stringify(form),
					contentType : "application/json;charset=utf-8",
					success : function(map) {
						if (map.list.length == 0) {
							let html = "<div class='container'><table class='table' style='margin-top:20px; margin-left:20px;'>"
							html += "<thead class='thead-dark' style='text-align: center;'><tr><th>번호</th><th>이름</th><th>학번</th>"
							html += "<th>학년</th><th>학과</th><tr></thead>"
							html += "<tbody style='text-align: center;'><tr><td colspan='5'><b>찾으시는 학생이 없습니다.</b></td></tr></tbody>"
							$("#stuList").empty().append(html)
						} else {
							html = "<div class='content'><table class='table' style='margin-top:20px; margin-left:20px;'>"
								html += "<thead class='thead-dark' style='text-align: center;'>"
								html += "<tr><th>번호</th><th>이름</th><th>학번</th>"
								html += "<th>학년</th><th>학과</th><tr></thead>"
								for (var i = 0; i < map.list.length; i++) {
									html += "<tbody style='text-align: center;'><tr><td>" + (i + 1)
											+ "</td><td>" + map.list[i].name + "</td>"
									html += "<td>"
											+ "<form action='${contextPath }/professor/detail_stuInfo' enctype='multipart/form-data' method='post'>"
											+ "<input type='text' name='id' value='"+map.list[i].idNum+"' readonly>"
											+ "<input type='submit' value='상세정보'></form></td>"
									html += "<td>" + map.list[i].grade
											+ "</td>"
									html += "<td>" + map.list[i].major
											+ "</td></tr></tbody>"
								}

									html += "<table style='margin: auto;'><tr><td align='center' colspan='5'>"
							for (var num = 1; num <= map.repeat; num++) {
								html += "<a class='btn btn-outline-secondary' href='#' onclick='searchStu(" + num
										+ ")'>" + num + "</a>"
							}
							html += "</table></div>"

							$("#stuList").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게, 같은 이름으로 걸어주니 모든 게 해결...
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
					onclick="juniorList($('#firstNum').val())">1학년</button>
				<button type="button" class="btn btn-secondary"
					onclick="seniorList($('#firstNum').val())">2학년</button>
			</div>
			<!--  
<form name="frm" id="frm" method="post"  onsubmit="return false" >
	<input type="text" name="sName" id="sName" placeholder="이름으로 검색해주세요">
	<input type="button" value="검색" onclick="searchStu()">
</form>
-->
			<div
				style="display: inline-block;">
				<select id="searchSelect">
					<option value="name">이름</option>
					<option value="id_num">학번</option>
					<option value="grade">학년</option>
				</select> <input type="text" id="searchInput"> <input type="button" class="btn btn-secondary"
					onclick="searchStu($('#firstNum').val())" value="검색">
			</div>
		</div>

		<input type="hidden" value="1" id="firstNum">
		<div id="stuList"></div>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>