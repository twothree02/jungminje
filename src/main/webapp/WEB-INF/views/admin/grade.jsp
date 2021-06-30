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

	function findAll(num){
		let form = {}
		form['major'] = $('#infoAll').val()
		$.ajax({
			url:"gradeMajor?num="+num ,type:"POST",dataType:"json",
			data:JSON.stringify(form),
			contentType:"application/json; charset=utf-8",
			success:function(map){
				$('#searchMajor').val('all')
				let html = "<table border='1' style='margin-top: 20px;'>"
					html += "<caption style = 'caption-side : top; text-align : center; font-size : 18pt;'><b>[전체]</b></caption>"
					html += "<tr><td align='center'>번호</td><td align='center'>학번</td><td align='center'>이름</td><td align='center'>학과</td>"
					html += "<td align='center'>학년</td><td align='center'>연도 - 학기</td><td align='center'>총점</td><td align='center'>석차</td>"
					html += "<td align='center'>장학대상자 여부</td></tr>"
					for(var i=0;i<map.list.length;i++){
						html += "<tr><td align='center'>"+(i+1)+"</td>"
						html += "<td align='center'>"+map.list[i].idNum+"</td>"
						html += "<td align='center'><a href = 'studentInfo?idNum="+ map.list[i].idNum +"'>"+map.list[i].name+"</a></td>"
						html += "<td align='center'>"+map.list[i].major+"</td>"
						html += "<td align='center'>"+map.list[i].grade+"</td>"
						html += "<td align='center'>"+map.year+"-"+map.semester+"</td>"
						html += "<td align='center'>"+map.list[i].curTotalGrade+"</td>"
						html += "<td align='center'>"+map.list[i].curRank+"</td>"
						if(map.list[i].curRank < 4){
							html += "<td align='center' style = 'color: red; font-weight: bold;'>장학대상자</td>"
						}
						else{
							html += "<td align='center'>X</td>"
						}
						html += "</tr>"
					}
					html += "</table>"
					let pagehtml = "<table style='margin-top: 20px; margin-left: 20px; width: 275px; text-align: center; font-size: 20px;'><tr>"
						pagehtml += "<td colspan='5'>"
						for(var num = 1; num <= map.repeat; num++){
							pagehtml += "<a href = '#' onclick = 'findAll("+num+")'>["+num+"]</a>"
						}
						pagehtml += "</td></tr></table>"
						$("#studentGrade").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게, 같은 이름으로 걸어주니 모든 게 해결...
						$("#paging").empty().append(pagehtml)
			},
			error:function(request,status,error){	
				alert("문제가 발생했습니다.");
			}
		})
	}
	
	function findinfoTel(num){
		let form = {}
		form['major'] = $('#infoTel').val()
		$.ajax({
			url:"gradeMajor?num="+num ,type:"POST",dataType:"json",
			data:JSON.stringify(form),
			contentType:"application/json; charset=utf-8",
			success:function(map){
					$('#searchMajor').val('정보통신과')
					let html = "<table border='1' style='margin-top: 20px;'>"
						html += "<caption style = 'caption-side : top; text-align : center; font-size : 18pt;'><b>[정보통신과]</b></caption>"
						html += "<tr><td align='center'>번호</td><td align='center'>학번</td><td align='center'>이름</td><td align='center'>학과</td>"
						html += "<td align='center'>학년</td><td align='center'>연도 - 학기</td><td align='center'>총점</td><td align='center'>석차</td>"
						html += "<td align='center'>장학대상자 여부</td></tr>"
						for(var i=0;i<map.list.length;i++){
							html += "<tr><td align='center'>"+(i+1)+"</td>"
							html += "<td align='center'>"+map.list[i].idNum+"</td>"
							html += "<td align='center'><a href = 'studentInfo?idNum="+ map.list[i].idNum +"'>"+map.list[i].name+"</a></td>"
							html += "<td align='center'>"+map.list[i].major+"</td>"
							html += "<td align='center'>"+map.list[i].grade+"</td>"
							html += "<td align='center'>"+map.year+"-"+map.semester+"</td>"
							html += "<td align='center'>"+map.list[i].curTotalGrade+"</td>"
							html += "<td align='center'>"+map.list[i].curRank+"</td>"
							if(map.list[i].curRank < 4){
								html += "<td align='center' style = 'color: red; font-weight: bold;'>장학대상자</td>"
							}
							else{
								html += "<td align='center'>X</td>"
							}
							html += "</tr>"
						}
						html += "</table>"
						let pagehtml = "<table style='margin-top: 20px; margin-left: 20px; width: 275px; text-align: center; font-size: 20px;'><tr>"
							pagehtml += "<td colspan='5'>"
							for(var num = 1; num <= map.repeat; num++){
								pagehtml += "<a href = '#' onclick = 'findinfoTel("+num+")'>["+num+"]</a>"
							}
							pagehtml += "</td></tr></table>"
							$("#studentGrade").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게, 같은 이름으로 걸어주니 모든 게 해결...
							$("#paging").empty().append(pagehtml)
			},
			error:function(request,status,error){
				alert("문제가 발생했습니다.");
			}
		})
	}
	
	function findCar(num){
		let form = {}
		form['major'] = $('#car').val()
		$.ajax({
			url:"gradeMajor?num="+num ,type:"POST",dataType:"json",
			data:JSON.stringify(form),
			contentType:"application/json; charset=utf-8",
			success:function(map){
				$('#searchMajor').val('자동차공학과')
				let html = "<table border='1' style='margin-top: 20px;'>"
					html += "<caption style = 'caption-side : top; text-align : center; font-size : 18pt;'><b>[자동차공학과]</b></caption>"
					html += "<tr><td align='center'>번호</td><td align='center'>학번</td><td align='center'>이름</td><td align='center'>학과</td>"
					html += "<td align='center'>학년</td><td align='center'>연도 - 학기</td><td align='center'>총점</td><td align='center'>석차</td>"
					html += "<td align='center'>장학대상자 여부</td></tr>"
					for(var i=0;i<map.list.length;i++){
						html += "<tr><td align='center'>"+(i+1)+"</td>"
						html += "<td align='center'>"+map.list[i].idNum+"</td>"
						html += "<td align='center'><a href = 'studentInfo?idNum="+ map.list[i].idNum +"'>"+map.list[i].name+"</a></td>"
						html += "<td align='center'>"+map.list[i].major+"</td>"
						html += "<td align='center'>"+map.list[i].grade+"</td>"
						html += "<td align='center'>"+map.year+"-"+map.semester+"</td>"
						html += "<td align='center'>"+map.list[i].curTotalGrade+"</td>"
						html += "<td align='center'>"+map.list[i].curRank+"</td>"
						if(map.list[i].curRank < 4){
							html += "<td align='center' style = 'color: red; font-weight: bold;'>장학대상자</td>"
						}
						else{
							html += "<td align='center'>X</td>"
						}
						html += "</tr>"
					}
					html += "</table>"
					let pagehtml = "<table style='margin-top: 20px; margin-left: 20px; width: 275px; text-align: center; font-size: 20px;'><tr>"
						pagehtml += "<td colspan='5'>"
						for(var num = 1; num <= map.repeat; num++){
							pagehtml += "<a href = '#' onclick = 'findCar("+num+")'>["+num+"]</a>"
						}
						pagehtml += "</td></tr></table>"
						$("#studentGrade").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게, 같은 이름으로 걸어주니 모든 게 해결...
						$("#paging").empty().append(pagehtml)
			},
			error:function(request,status,error){
				alert("문제가 발생했습니다.");
			}
		})
	}
	
	function findOperation(num){
		let form = {}
		form['major'] = $('#operation').val()
		$.ajax({
			url:"gradeMajor?num="+num ,type:"POST",dataType:"json",
			data:JSON.stringify(form),
			contentType:"application/json; charset=utf-8",
			success:function(map){
				$('#searchMajor').val('경영학과')
				let html = "<table border='1' style='margin-top: 20px;'>"
					html += "<caption style = 'caption-side : top; text-align : center; font-size : 18pt;'><b>[경영학과]</b></caption>"
					html += "<tr><td align='center'>번호</td><td align='center'>학번</td><td align='center'>이름</td><td align='center'>학과</td>"
					html += "<td align='center'>학년</td><td align='center'>연도 - 학기</td><td align='center'>총점</td><td align='center'>석차</td>"
					html += "<td align='center'>장학대상자 여부</td></tr>"
					for(var i=0;i<map.list.length;i++){
						html += "<tr><td align='center'>"+(i+1)+"</td>"
						html += "<td align='center'>"+map.list[i].idNum+"</td>"
						html += "<td align='center'><a href = 'studentInfo?idNum="+ map.list[i].idNum +"'>"+map.list[i].name+"</a></td>"
						html += "<td align='center'>"+map.list[i].major+"</td>"
						html += "<td align='center'>"+map.list[i].grade+"</td>"
						html += "<td align='center'>"+map.year+"-"+map.semester+"</td>"
						html += "<td align='center'>"+map.list[i].curTotalGrade+"</td>"
						html += "<td align='center'>"+map.list[i].curRank+"</td>"
						if(map.list[i].curRank < 4){
							html += "<td align='center' style = 'color: red; font-weight: bold;'>장학대상자</td>"
						}
						else{
							html += "<td align='center'>X</td>"
						}
						html += "</tr>"
					}
					html += "</table>"
					let pagehtml = "<table style='margin-top: 20px; margin-left: 20px; width: 275px; text-align: center; font-size: 20px;'><tr>"
						pagehtml += "<td colspan='5'>"
						for(var num = 1; num <= map.repeat; num++){
							pagehtml += "<a href = '#' onclick = 'findOperation("+num+")'>["+num+"]</a>"
						}
						pagehtml += "</td></tr></table>"
						$("#studentGrade").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게, 같은 이름으로 걸어주니 모든 게 해결...
						$("#paging").empty().append(pagehtml)
			},
			error:function(request,status,error){
				alert("문제가 발생했습니다.");
			}
		})
	}
	
	function searchPage(num){
		var searchSelect = $('#searchSel').val()
		var searchText = $('#searchTxt').val()
		var searchMajor = $('#searchMaj').val()
		var form = {'searchSelect' : searchSelect, 'searchText' : searchText, 'searchMajor' : searchMajor}
		$.ajax({
			url:"searchGrade?num="+num ,type:"POST",dataType:"json",
			data:JSON.stringify(form),
			contentType:"application/json; charset=utf-8",
			success:function(map){
				let html = "<table border='1' style='margin-top: 20px;'>"
					html += "<caption style = 'caption-side : top; text-align : center; font-size : 18pt;'><b>[검색결과]</b></caption>"
					html += "<tr><td align='center'>번호</td><td align='center'>학번</td><td align='center'>이름</td><td align='center'>학과</td>"
					html += "<td align='center'>학년</td><td align='center'>연도 - 학기</td><td align='center'>총점</td><td align='center'>석차</td>"
					html += "<td align='center'>장학대상자 여부</td></tr>"
					for(var i=0;i<map.list.length;i++){
						html += "<tr><td align='center'>"+(i+1)+"</td>"
						html += "<td align='center'>"+map.list[i].idNum+"</td>"
						html += "<td align='center'><a href = 'studentInfo?idNum="+ map.list[i].idNum +"'>"+map.list[i].name+"</a></td>"
						html += "<td align='center'>"+map.list[i].major+"</td>"
						html += "<td align='center'>"+map.list[i].grade+"</td>"
						html += "<td align='center'>"+map.year+"-"+map.semester+"</td>"
						html += "<td align='center'>"+map.list[i].curTotalGrade+"</td>"
						html += "<td align='center'>"+map.list[i].curRank+"</td>"
						if(map.list[i].curRank < 4){
							html += "<td align='center' style = 'color: red; font-weight: bold;'>장학대상자</td>"
						}
						else{
							html += "<td align='center'>X</td>"
						}
						html += "</tr>"
					}
					html += "</table>"
					let pagehtml = "<table style='margin-top: 20px; margin-left: 20px; width: 275px; text-align: center; font-size: 20px;'><tr>"
						pagehtml += "<td colspan='5'>"
						for(var num = 1; num <= map.repeat; num++){
							pagehtml += "<a href = '#' onclick = 'findOperation("+num+")'>["+num+"]</a>"
						}
						pagehtml += "</td></tr></table>"
						$("#studentGrade").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게, 같은 이름으로 걸어주니 모든 게 해결...
						$("#paging").empty().append(pagehtml)
			},
			error:function(request,status,error){
				alert("문제가 발생했습니다.");
			}
		})
	}
	
	function saveSearch(num){
		$('#searchSel').val($('#searchSelect').val())
		$('#searchTxt').val($('#searchText').val())
		$('#searchMaj').val($('#searchMajor').val())
		searchPage(num)
	}
	
</script>
</head>
<body>
	<c:import url="../default/adminHeader.jsp" />
	<div class="wrap">
		<div class="title">
			<h1 style="text-align: center;">성적 / 장학 관리</h1>
		</div>
	</div>
	<div class="menuBar">
	</div>
	<div>
		<div style="margin-top: 20px; padding-left: 5%;">
			<div class="btn-group" role="group" aria-label="Basic example"
				style="margin-top: 7px; margin-left: 25px; margin-bottom: 7px; padding-left: 30%;">
				<button type="button" class="btn btn-secondary" id="infoAll"
					onclick="findAll($('#firstNum').val())" value="전체">전체</button>
			</div>
			<div class="btn-group" role="group" aria-label="Basic example"
				style="margin-top: 7px; margin-left: 25px; margin-bottom: 7px;">
				<button type="button" class="btn btn-secondary" id="infoTel"
					onclick="findinfoTel($('#firstNum').val())" value="정보통신과">정보통신과</button>
			</div>
			<div class="btn-group" role="group" aria-label="Basic example"
				style="margin-top: 7px; margin-left: 25px; margin-bottom: 7px;">
				<button type="button" class="btn btn-secondary" id="car"
					onclick="findCar($('#firstNum').val())" value="자동차공학과">자동차공학과</button>
			</div>
			<div class="btn-group" role="group" aria-label="Basic example"
				style="margin-top: 7px; margin-left: 25px; margin-bottom: 7px;">
				<button type="button" class="btn btn-secondary" id="operation"
					onclick="findOperation($('#firstNum').val())" value="경영학과">경영학과</button>
			</div>
			<div class="btn-group" role="group" aria-label="Basic example"
				style="margin-top: 7px; margin-left: 25px; margin-bottom: 7px; padding-left: 450px;">
				<button type="button" class="btn btn-secondary" id="finalProcess"
					onclick="location.href = 'finalProcess'" value="처리">최종 성적/장학 처리</button>
			</div>
			<input type="hidden" id="searchMajor" value="all">
		</div>
		<input type="hidden" value="1" id="firstNum"> 
		<input type="hidden" value="" id="searchSel"> 
		<input type="hidden" value="" id="searchTxt"> 
		<input type="hidden" value="" id="searchMaj">
		<div id="studentGrade" style="padding-left: 33%; display: flex;">
			<table border='1' style='margin-top: 20px;'>
				<caption style = "caption-side : top; text-align : center; font-size : 18pt;"><b>[전체]</b></caption>
				<tr>
					<td align='center'>번호</td>
					<td align='center'>학번</td>
					<td align='center'>이름</td>
					<td align='center'>학과</td>
					<td align='center'>학년</td>
					<td align='center'>연도 - 학기</td>
					<td align='center'>총점</td>
					<td align='center'>석차</td>
					<td align='center'>장학대상자 여부</td>
				</tr>
					<c:set var="cnt" value="0" />
					<c:forEach var="list" items="${list}">
						<tr>
							<td align='center'>${cnt+1}</td>
							<td align='center'>${list.idNum}</td>
							<td align='center'><a href='studentInfo?idNum=${list.idNum}'>${list.name}</a></td>
							<td align='center' id='major'>${list.major}</td>
							<td align='center'>${list.grade}</td>
							<td align='center'>${year}-${semester}</td>
							<td align='center'>${list.curTotalGrade}</td>
							<td align='center'>${list.curRank}</td>
							<c:choose>
								<c:when test="${list.curRank < 4}">
									<td align='center' style = "color: red; font-weight: bold;">장학대상자</td>
								</c:when>
								<c:otherwise>
									<td align='center'>X</td>
								</c:otherwise>
							</c:choose>
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
								<a href="grade?num=${num}">[${num}]</a>
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
				onclick="saveSearch($('#firstNum').val())" value="검색">
		</div>
	</div>
</body>
</html>