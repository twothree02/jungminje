<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 관리 시스템</title>
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
<script type="text/javascript">

	function findAll(){
		let form = {}
		form['major'] = $('#infoAll').val()
		$.ajax({
			url:"findinfo" ,type:"POST",dataType:"json",
			data:JSON.stringify(form),
			contentType:"application/json; charset=utf-8",
			success:function(list){
					$('#searchMajor').val('all')
					let html = "<table border='1' style='margin-top:20px; margin-left:20px;'>"
						html += "<tr><td align='center'>번호</td><td align='center'>이름</td><td align='center'>학번</td>"
						html += "<td align='center'>학년</td><td align='center'>학과</td><tr>"
						for(var i=0;i<list.length;i++){
						html += "<tr><td align='center'>"+(i+1)+"</td><td align='center'><a href = 'studentInfo?idNum="+ list[i].idNum +"'>"+list[i].name+"</a></td>"
						html += "<td align='center'>"+list[i].idNum+"</td>"
						html += "<td align='center'>"+list[i].grade+"</td>"
						html += "<td align='center'>"+list[i].major+"</td></tr>"
						}
						html += "</table>"
						$("#studentList").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게, 같은 이름으로 걸어주니 모든 게 해결...
			},
			error:function(request,status,error){	
				alert("문제가 발생했습니다.");
			}
		})
	}

	function findinfoTel(){
		let form = {}
		form['major'] = $('#infoTel').val()
		$.ajax({
			url:"findinfo" ,type:"POST",dataType:"json",
			data:JSON.stringify(form),
			contentType:"application/json; charset=utf-8",
			success:function(list){
					$('#searchMajor').val('정보통신과')
					let html = "<table border='1' style='margin-top:20px; margin-left:20px;'>"
						html += "<tr><td align='center'>번호</td><td align='center'>이름</td><td align='center'>학번</td>"
						html += "<td align='center'>학년</td><td align='center'>학과</td><tr>"
						for(var i=0;i<list.length;i++){
						html += "<tr><td align='center'>"+(i+1)+"</td><td align='center'><a href = 'studentInfo?idNum="+ list[i].idNum +"'>"+list[i].name+"</a></td>"
						html += "<td align='center'>"+list[i].idNum+"</td>"
						html += "<td align='center'>"+list[i].grade+"</td>"
						html += "<td align='center'>"+list[i].major+"</td></tr>"
						}
						html += "</table>"					
						$("#studentList").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게, 같은 이름으로 걸어주니 모든 게 해결...
			},
			error:function(request,status,error){
				alert("문제가 발생했습니다.");
			}
		})
	}
	
	function findCar(){
		let form = {}
		form['major'] = $('#car').val()
		$.ajax({
			url:"findinfo" ,type:"POST",dataType:"json",
			data:JSON.stringify(form),
			contentType:"application/json; charset=utf-8",
			success:function(list){
				$('#searchMajor').val('자동차공학과')
					let html = "<table border='1' style='margin-top:20px; margin-left:20px;'>"
						html += "<tr><td align='center'>번호</td><td align='center'>이름</td><td align='center'>학번</td>"
						html += "<td align='center'>학년</td><td align='center'>학과</td><tr>"
						for(var i=0;i<list.length;i++){
						html += "<tr><td align='center'>"+(i+1)+"</td><td align='center'><a href = 'studentInfo?idNum="+ list[i].idNum +"'>"+list[i].name+"</a></td>"
						html += "<td align='center'>"+list[i].idNum+"</td>"
						html += "<td align='center'>"+list[i].grade+"</td>"
						html += "<td align='center'>"+list[i].major+"</td></tr>"
						}
						html += "</table>"
						$("#studentList").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게, 같은 이름으로 걸어주니 모든 게 해결...
			},
			error:function(request,status,error){
				alert("문제가 발생했습니다.");
			}
		})
	}
	
	function findOperation(){
		let form = {}
		form['major'] = $('#operation').val()
		$.ajax({
			url:"findinfo" ,type:"POST",dataType:"json",
			data:JSON.stringify(form),
			contentType:"application/json; charset=utf-8",
			success:function(list){
				$('#searchMajor').val('경영학과')
					let html = "<table border='1' style='margin-top:20px; margin-left:20px;'>"
						html += "<tr><td align='center'>번호</td><td align='center'>이름</td><td align='center'>학번</td>"
						html += "<td align='center'>학년</td><td align='center'>학과</td><tr>"
						for(var i=0;i<list.length;i++){
						html += "<tr><td align='center'>"+(i+1)+"</td><td align='center'><a href = 'studentInfo?idNum="+ list[i].idNum +"'>"+list[i].name+"</a></td>"
						html += "<td align='center'>"+list[i].idNum+"</td>"
						html += "<td align='center'>"+list[i].grade+"</td>"
						html += "<td align='center'>"+list[i].major+"</td></tr>"
						}
						html += "</table><br>"
						$("#studentList").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게, 같은 이름으로 걸어주니 모든 게 해결...
			},
			error:function(request,status,error){
				alert("문제가 발생했습니다.");
			}
		})
	}
	
	function search(){
		var searchSelect = $('#searchSelect').val()
		var searchText = $('#searchText').val()
		var searchMajor = $('#searchMajor').val()
		var form = {'searchSelect' : searchSelect, 'searchText' : searchText, 'searchMajor' : searchMajor}
		$.ajax({
			url:"searchStudent" ,type:"POST",dataType:"json",
			data:JSON.stringify(form),
			contentType:"application/json; charset=utf-8",
			success:function(list){
					let html = "<table border='1' style='margin-top:20px; margin-left:20px;'>"
						html += "<tr><td align='center'>번호</td><td align='center'>이름</td><td align='center'>학번</td>"
						html += "<td align='center'>학년</td><td align='center'>학과</td><tr>"
						for(var i=0;i<list.length;i++){
						html += "<tr><td align='center'>"+(i+1)+"</td><td align='center'><a href = 'studentInfo?idNum="+ list[i].idNum +"'>"+list[i].name+"</a></td>"
						html += "<td align='center'>"+list[i].idNum+"</td>"
						html += "<td align='center'>"+list[i].grade+"</td>"
						html += "<td align='center' id = 'major'>"+list[i].major+"</td></tr>"
						}
						html += "</table><br>"
						$("#studentList").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게, 같은 이름으로 걸어주니 모든 게 해결...
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
	<div>
		<div style="margin-top: 20px; padding-left: 5%;">
			<div class="btn-group" role="group" aria-label="Basic example"
				style="margin-top: 7px; margin-left: 25px; margin-bottom: 7px; padding-left: 30%;">
				<button type="button" class="btn btn-secondary" id="infoAll"
					onclick="findAll()" value="전체">전체</button>
			</div>
			<div class="btn-group" role="group" aria-label="Basic example"
				style="margin-top: 7px; margin-left: 25px; margin-bottom: 7px;">
				<button type="button" class="btn btn-secondary" id="infoTel"
					onclick="findinfoTel()" value="정보통신과">정보통신과</button>
			</div>
			<div class="btn-group" role="group" aria-label="Basic example"
				style="margin-top: 7px; margin-left: 25px; margin-bottom: 7px;">
				<button type="button" class="btn btn-secondary" id="car"
					onclick="findCar()" value="자동차공학과">자동차공학과</button>
			</div>
			<div class="btn-group" role="group" aria-label="Basic example"
				style="margin-top: 7px; margin-left: 25px; margin-bottom: 7px;">
				<button type="button" class="btn btn-secondary" id="operation"
					onclick="findOperation()" value="경영학과">경영학과</button>
			</div>
			<input type="hidden" id="searchMajor" value="all">
		</div>
		<div id="studentList" style="padding-left: 37%;">
			<table border='1' style='margin-top: 20px; margin-left: 20px;'>
				<tr>
					<td align='center'>번호</td>
					<td align='center'>이름</td>
					<td align='center'>학번</td>
					<td align='center'>학년</td>
					<td align='center'>학과</td>
				<tr>
					<c:set var="cnt" value="0" />
					<c:forEach var="list" items="${list}">
						<tr>
							<td align='center'>${cnt+1}</td>
							<td align='center'><a href='studentInfo?idNum=${list.idNum}'>${list.name}</a></td>
							<td align='center'>${list.idNum}</td>
							<td align='center'>${list.grade}</td>
							<td align='center' id='major'>${list.major}</td>
						</tr>
						<c:set var="cnt" value="${cnt+1}" />
					</c:forEach>
			</table>
		</div>
		<div id="paging" style="padding-left: 37%;">
			<table
				style='margin-top: 20px; margin-left: 20px; width: 275px; text-align: center; font-size: 20px;'>
				<tr>
					<td colspan='5'>
							<c:forEach var="num" begin="1" end="${repeat}">
								<a href="studentManagement?num=${num}">[${num}]</a>
							</c:forEach>
					</td>
				</tr>
			</table>
		</div>
		<div style="padding-left: 38%; padding-top: 2%;">
			<select id="searchSelect">
				<option value="name">이름</option>
				<option value="id_num">학번</option>
				<option value="grade">학년</option>
			</select> <input type="text" id="searchText"> <input type="button"
				onclick="search()" value="검색">
		</div>
	</div>
</body>
</html>