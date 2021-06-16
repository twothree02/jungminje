<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function adminList(){
	$.ajax({
		url: "admin_list" , type: "POST",
		//data : JSON.stringify(ArrayList) //데이터는 서버로 보낼 때 사용. success가 받아올 때.
		dataType:"json",
		contentType:"application/json;charset=utf-8",
		success: function(list){
			let html = "<table border='1' style='margin-top:20px; margin-left:20px;'>"
			html += "<tr><td align='center'>번호</td><td align='center'>이름</td><td align='center'>핸드폰 번호</td>"
			html += "<td align='center'>내선 번호</td><td align='center'>사무실</td><tr>"
			for(var i=0;i<list.length;i++){
			html += "<tr><td align='center'>"+(i+1)+"</td><td>"+list[i].name+"</td>"
			html += "<td align='center'>"+list[i].phoneNum+"</td>"
			html += "<td align='center'>"+list[i].telNum+"</td>"
			html += "<td align='center'>"+list[i].officeAddr+"</td></tr>"
			}
			html += "</table>"
			$("#adminProfList").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게
			
		}
		, error:function(){
			alert('문제 발생')
		}
	})
}
function bProfessorList(){
	$.ajax({
		url: "bProfessor_list" , type: "POST",
		//data : JSON.stringify(ArrayList) //데이터는 서버로 보낼 때 사용. success가 받아올 때.
		dataType:"json",
		contentType:"application/json;charset=utf-8",
		success: function(list){
			let html = "<table border='1' style='margin-top:20px; margin-left:20px;'>"
			html += "<tr><td align='center'>번호</td><td align='center'>이름</td><td align='center'>핸드폰 번호</td>"
			html += "<td align='center'>내선 번호</td><td align='center'>사무실</td><tr>"
			for(var i=0;i<list.length;i++){
			html += "<tr><td align='center'>"+(i+1)+"</td><td>"+list[i].name+"</td>"
			html += "<td align='center'>"+list[i].phoneNum+"</td>"
			html += "<td align='center'>"+list[i].telNum+"</td>"
			html += "<td align='center'>"+list[i].officeAddr+"</td></tr>"
			}
			html += "</table>"
			$("#adminProfList").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게
			
		}
		, error:function(){
			alert('문제 발생')
		}
	})
}
function iProfessorList(){
	$.ajax({
		url: "iProfessor_list" , type: "POST",
		//data : JSON.stringify(ArrayList) //데이터는 서버로 보낼 때 사용. success가 받아올 때.
		dataType:"json",
		contentType:"application/json;charset=utf-8",
		success: function(list){
			let html = "<table border='1' style='margin-top:20px; margin-left:20px;'>"
			html += "<tr><td align='center'>번호</td><td align='center'>이름</td><td align='center'>핸드폰 번호</td>"
			html += "<td align='center'>내선 번호</td><td align='center'>사무실</td><tr>"
			for(var i=0;i<list.length;i++){
			html += "<tr><td align='center'>"+(i+1)+"</td><td>"+list[i].name+"</td>"
			html += "<td align='center'>"+list[i].phoneNum+"</td>"
			html += "<td align='center'>"+list[i].telNum+"</td>"
			html += "<td align='center'>"+list[i].officeAddr+"</td></tr>"
			}
			html += "</table>"
			$("#adminProfList").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게
			
		}
		, error:function(){
			alert('문제가 발생하였습니다.')
		}
	})
}
function cProfessorList(){
	$.ajax({
		url: "cProfessor_list" , type: "POST",
		//data : JSON.stringify(ArrayList) //데이터는 서버로 보낼 때 사용. success가 받아올 때.
		dataType:"json",
		contentType:"application/json;charset=utf-8",
		success: function(list){
			let html = "<table border='1' style='margin-top:20px; margin-left:20px;'>"
			html += "<tr><td align='center'>번호</td><td align='center'>이름</td><td align='center'>핸드폰 번호</td>"
			html += "<td align='center'>내선 번호</td><td align='center'>사무실</td><tr>"
			for(var i=0;i<list.length;i++){
			html += "<tr><td align='center'>"+(i+1)+"</td><td>"+list[i].name+"</td>"
			html += "<td align='center'>"+list[i].phoneNum+"</td>"
			html += "<td align='center'>"+list[i].telNum+"</td>"
			html += "<td align='center'>"+list[i].officeAddr+"</td></tr>"
			}
			html += "</table>"
			$("#adminProfList").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게
			
		}
		, error:function(){
			alert('문제가 발생하였습니다.')
		}
	})
}
function searchStaff(){
	let formData = {}
	let arr = $("#frm").serializeArray()
	for(i=0; i<arr.length;i++){
		formData[arr[i].name] = arr[i].value
	}
	$.ajax({
		url: "search_staff" , type: "POST",
		dataType:"json",
		data:JSON.stringify(formData),
		contentType:"application/json;charset=utf-8",
		success: function(list){
			if(list.length == 0){
				let html = "<table border='1' style='margin-top:20px; margin-left:20px;'>"
					html += "<tr><td align='center'>번호</td><td align='center'>이름</td><td align='center'>직위</td><td align='center'>내선 번호</td>"
					html += "<td align='center'>핸드폰 번호</td><td align='center'>사무실</td><tr>"
					html += "<tr><td align='center' colspan='6'><b>찾으시는 교직원이 없습니다.</b></td></tr></table>"
					$("#adminProfList").empty().append(html)
			}else{
			let html = "<table border='1' style='margin-top:20px; margin-left:20px;'>"
			html += "<tr><td align='center'>번호</td><td align='center'>이름</td><td align='center'>직위</td><td align='center'>내선 번호</td>"
			html += "<td align='center'>핸드폰 번호</td><td align='center'>사무실</td><tr>"
			for(var i=0;i<list.length;i++){
			html += "<tr><td align='center'>"+(i+1)+"</td><td>"+list[i].name+"</td>"
			html += "<td align='center'>"+list[i].position+"</td>"
			html += "<td align='center'>"+list[i].telNum+"</td>"
			html += "<td align='center'>"+list[i].phoneNum+"</td>"
			html += "<td align='center'>"+list[i].officeAddr+"</td></tr>"
			}
			html += "</table>"
			$("#adminProfList").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게, 같은 이름으로 걸어주니 모든 게 해결...
			}
		}
		, error:function(){
			alert('문제가 발생하였습니다.')
		}
	})
}

</script>
</head>
<body>
<c:import url="../default/professorHeader.jsp" />
 <div class="btn-group" role="group" aria-label="Basic example">
  <button type="button" class="btn btn-secondary" onclick="adminList()" style="margin-top:20px; margin-left:20px;">행 정</button>
  <button type="button" class="btn btn-secondary" onclick="bProfessorList()" style="margin-top:20px;">경영학과</button>
  <button type="button" class="btn btn-secondary" onclick="iProfessorList()" style="margin-top:20px;">정보통신과</button>
  <button type="button" class="btn btn-secondary" onclick="cProfessorList()" style="margin-top:20px;">자동차공학과</button>
</div>
<form name="frm" id="frm" method="post" onsubmit="return false">
	<input type="text" name="staName" id="staName" placeholder="이름으로 검색해주세요">
	<input type="button" value="검색" onclick="searchStaff()">
</form>

<div id="adminProfList"></div>



</body>
</html>