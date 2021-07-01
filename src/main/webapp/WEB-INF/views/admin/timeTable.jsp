<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간표 관리</title>
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
	margin-left: 30%;
	margin-top: 60px;
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

.textbox {
	width: 95%;
	height: 95%;
}
</style>
<script type="text/javascript">
	function findSubject() {
		let form = {}
		let arr = $('#major').serializeArray()
		for (i = 0; i < arr.length; i++) {
			form[arr[i].name] = arr[i].value
		}
		$.ajax({
			url : "findSubject",
			type : "POST",
			dataType : "json",
			data : JSON.stringify(form),
			contentType : "application/json; charset=utf-8",
			success : function(list) {
				let html = ""
				html += "<option></option>"
				for (var i = 0; i < list.length; i++) {
					html += "<option value = '" + list[i] + "'> " + list[i]
							+ "</option>"
				}
				$('#subject').empty().append(html)
				$('#professorN').empty()
				$('#professorI').empty()
			},
			error : function(request, status, error) {
				alert("문제가 발생했습니다.");
			}
		})
	}

	function findLecture() {
		let form = {}
		let arr = $('#major').serializeArray()
		for (i = 0; i < arr.length; i++) {
			form[arr[i].name] = arr[i].value
		}
		$.ajax({
			url : "findLecture",
			type : "POST",
			dataType : "json",
			data : JSON.stringify(form),
			contentType : "application/json; charset=utf-8",
			success : function(list) {
				let html = ""
				html += "<option></option>"
				for (var i = 0; i < list.length; i++) {
					html += "<option value = '" + list[i] + "'> " + list[i]
							+ "</option>"
				}
				$('#lecture').empty().append(html)
			},
			error : function(request, status, error) {
				alert("문제가 발생했습니다.");
			}
		})
	}

	function findTeacher() {
		let form = {}
		let arr = $('#subject').serializeArray()
		for (i = 0; i < arr.length; i++) {
			form[arr[i].name] = arr[i].value
		}
		$
				.ajax({
					url : "findTeacher",
					type : "POST",
					dataType : "json",
					data : JSON.stringify(form),
					contentType : "application/json; charset=utf-8",
					success : function(list) {
						let html = "<input class='textbox' type='text' id = 'professorName' name='professorName' readonly='readonly' value = '"+list[0]+"'></input>"
						let html2 = "<input class='textbox' type='text' id = 'professorIdNum' name='professorIdNum' readonly='readonly' value = '"+list[1]+"'></input>"
						$('#professorN').empty().append(html)
						$('#professorI').empty().append(html2)
					},
					error : function(request, status, error) {
						alert("문제가 발생했습니다.");
					}
				})
	}

	function timeCheck() {
		let form = {}
		form['major'] = $('#major').val()
		form['week'] = $('#week').val()
		form['lecture'] = $('#lecture').val()
		$.ajax({
			url : "timeCheck",
			type : "POST",
			dataType : "json",
			data : JSON.stringify(form),
			contentType : "application/json; charset=utf-8",
			success : function(list) {
				let html = ""
				html += "<option></option>"
				for (var i = 0; i < list.length; i++) {
					html += "<option value = '" + list[i] + "'> " + list[i]
							+ "</option>"
				}
				$('#time').empty().append(html)
			},
			error : function(request, status, error) {
				alert("문제가 발생했습니다.");
			}
		})
	}

	function findWeek() {
		let html = ""
		html += "<option value=''></option>"
		html += "<option value='월요일'>월요일</option>"
		html += "<option value='화요일'>화요일</option>"
		html += "<option value='수요일'>수요일</option>"
		html += "<option value='목요일'>목요일</option>"
		html += "<option value='금요일'>금요일</option>"
		$('#week').empty().append(html)
	}
</script>
</head>
<body>
	<c:import url="../default/adminHeader.jsp" />
	<div class="wrap">
		<div class="title">
			<h1 style="text-align: center;">시간표 관리</h1>
		</div>
	</div>
	<div class="menuBar"></div>
	<div class="officerInfo">
		<div class="infoTable">
			<form action="insertTimeTable" method="post">
				<table class="table">
					<tbody>
						<tr>
							<th scope="col">학 기</th>
							<td><input class="textbox" type="text" id="semester"
								name="semester" value="2021학년도 2학기" readonly="readonly" /></td>
						</tr>
						<tr>
							<th scope="row">학 과</th>
							<td><select class="textbox" name="major" id="major"
								onchange="findSubject(); findLecture();">
									<option value=""></option>
									<option value="정보통신과">정보통신과</option>
									<option value="자동차공학과">자동차공학과</option>
									<option value="경영학과">경영학과</option>
							</select></td>
						</tr>
						<tr>
							<th scope="row">과 목</th>
							<td><select class="textbox" name="subject" id="subject"
								onchange="findTeacher()">
									<!-- Ajax 자동 입력 -->
							</select></td>
						</tr>
						<tr>
							<th scope="row">교 수 명</th>
							<td id=professorN>
								<!-- 자동입력 -->
							</td>
						</tr>
						<tr>
							<th scope="row">교 수 사 번</th>
							<td id=professorI>
								<!-- 자동입력 -->
							</td>
						</tr>
						<tr>
							<th scope="row">강 의 실</th>
							<td><select class="textbox" name="lecture" id="lecture"
								onchange="findWeek()">
									<!-- Ajax 자동 입력 -->
							</select></td>
						</tr>
						<tr>
							<th scope="row">강 의 요 일</th>
							<td><select class="textbox" name="week" id="week"
								onchange="timeCheck()" required>
							</select></td>
						</tr>
						<tr>
							<th scope="row">강 의 시 간</th>
							<td><select class="textbox" name="time" id="time">
									<!-- 자동 입력 -->
							</select></td>
						</tr>
						<tr>
							<td colspan="2" style="padding-top: 50px;"><input
								type="button" class="btn btn-secondary" value="처음으로"
								onclick="history.back()" style="margin-left: 10%;"> <input
								type="submit" class="btn btn-secondary" value="등록"
								style="margin-left: 10%;"></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
</html>