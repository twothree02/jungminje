<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	function findProfessor(){
		let form = {}
		let arr = $('#majorVal').serializeArray()
		for(i=0; i<arr.length; i++){
			form[arr[i].name] = arr[i].value
		}
		$.ajax({
			url:"findProfessor" ,type:"POST",dataType:"json",
			data:JSON.stringify(form),
			contentType:"application/json; charset=utf-8",
			success:function(list){
				let html = ""
					for(var i=0;i<list.length;i++){
					html += "<option value = " + list[i] + "> " + list[i] + "</option>"
					}
				$('#mentorName').empty().append(html)
			},
			error:function(request,status,error){
				alert("문제가 발생했습니다.");
			}
		})
	}
</script>	
</head>
<body>
	<c:import url="../default/adminHeader.jsp" />
	<div class="wrap">
		<div class="title">
			<h1 style="text-align: center;">학생 관리</h1>
		</div>
	</div>
	<div class="menuBar">
		<div class="btn-group" role="group" aria-label="Basic example"
			style="margin-top: 7px; margin-left: 25px; margin-bottom: 7px; padding-left: 80%;">
			<button type="button" class="btn btn-secondary"
				onclick="location.href='studentManagement'">조회</button>
		</div>
		<div class="btn-group" role="group" aria-label="Basic example"
			style="margin-top: 7px; margin-bottom: 7px;">
			<button type="button" class="btn btn-secondary"
				onclick="location.href='studentInsert'">등록</button>
		</div>
	</div>
	<div class="officerInfo">
		<div class="infoTable">
			<form action="insertStu" method="post">
				<table class="table">
					<tbody>
						<tr>
							<th scope="col">이 름</th>
							<td><input class="textbox" type="text" name="inputName"
								placeholder="이름 입력"></td>
						</tr>
						<tr>
							<th scope="row">주 민 등 록 번 호</th>
							<td><input class="textbox" type="text"
								name="inputResidentNum"
								placeholder="주민등록번호 입력 (ex : ######-#######)"></td>
						</tr>
						<tr>
							<th scope="row">국 적</th>
							<td><input class="textbox" type="text" name="inputCountry"
								placeholder="국적 입력 (ex : 대한민국)"></td>
						</tr>
						<tr>
							<th scope="row">학 년</th>
							<td><select class="textbox" name="inputGrade">
									<option value=""></option>
									<option value="1">1</option>
									<option value="2">2</option>
							</select></td>
						</tr>
						<tr>
							<th scope="row">반</th>
							<td>
							<select class="textbox" name="inputClass">
								<option value = ""></option>
								<option value = "A">A</option>
								<option value = "B">B</option>
							</select>	
							</td>
						</tr>
						<tr>
							<th scope="row">휴 대 폰</th>
							<td><input class="textbox" type="text" name="inputPhonenum"
								placeholder="휴대폰 입력 (ex : ###-###-####)"></td>
						</tr>
						<tr>
							<th scope="row">학 과</th>
							<td>
								<select class="textbox" name="inputMajor" id="majorVal" onchange="findProfessor()">
										<option></option>
										<option value="정보통신과">정보통신과</option>
										<option value="자동차공학과">자동차공학과</option>
										<option value="경영학과">경영학과</option>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">지 도 교 수</th>
							<td>
								<select class="textbox" id = "mentorName" name="inputMentor">
								</select>
							</td>
						</tr>
						<tr>
							<td colspan = "2" style = "padding-top: 50px;">
								<input type = "button" class = "btn btn-secondary" value = "처음으로" onclick = "history.back()" style = "margin-left: 10%;">
								<input type = "submit" class = "btn btn-secondary" value = "등록" style = "margin-left: 10%;">
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
</html>