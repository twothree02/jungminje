<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function juniorList(){
		$.ajax({
			url: "junior_list" , type: "POST",
			//data : JSON.stringify(ArrayList) //데이터는 서버로 보낼 때 사용. success가 받아올 때.
			dataType:"json",
			contentType:"application/json;charset=utf-8",
			success: function(list){
				let html = "<table border='1' style='margin-top:20px; margin-left:20px;'>"
				html += "<tr><td align='center'>번호</td><td align='center'>이름</td><td align='center'>학번</td>"
				html += "<td align='center'>학년</td><td align='center'>학과</td><tr>"
				for(var i=0;i<list.length;i++){
				html += "<tr><td align='center'>"+(i+1)+"</td><td>"+list[i].name+"</td>"
				html += "<td align='center'>"+"<form action='${contextPath }/professor/detail_stuInfo' enctype='multipart/form-data' method='post'>"
						+"<input type='text' name='id' value='"+list[i].idNum+"' readonly>"
						+"<input type='submit' value='상세정보'></form></td>"
				html += "<td align='center'>"+list[i].grade+"</td>"
				html += "<td align='center'>"+list[i].major+"</td></tr>"
				}
				html += "</table>"
					$("#stuList").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게, 같은 이름으로 걸어주니 모든 게 해결...
			}
			, error:function(){
				alert('문제 발생')
			}
		})
	}
	function seniorList(){
		$.ajax({
			url: "senior_list" , type: "POST",
			//data : JSON.stringify(ArrayList) //데이터는 서버로 보낼 때 사용. success가 받아올 때.
			dataType:"json",
			contentType:"application/json;charset=utf-8",
			success: function(list){
				let html = "<table border='1' style='margin-top:20px; margin-left:20px;'>"
				html += "<tr><td align='center'>번호</td><td align='center'>이름</td><td align='center'>학번</td>"
				html += "<td align='center'>학년</td><td align='center'>학과</td><tr>"
				for(var i=0;i<list.length;i++){
				html += "<tr><td align='center'>"+(i+1)+"</td><td>"+list[i].name+"</td>"
				html += "<td align='center'>"+"<form action='${contextPath }/professor/detail_stuInfo' enctype='multipart/form-data' method='post'>"
						+"<input type='text' name='id' value='"+list[i].idNum+"' readonly>"
						+"<input type='submit' value='상세정보'></form></td>"
				html += "<td align='center'>"+list[i].grade+"</td>"
				html += "<td align='center'>"+list[i].major+"</td></tr>"
				}
				html += "</table>"
					$("#stuList").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게, 같은 이름으로 걸어주니 모든 게 해결...
			}
			, error:function(){
				alert('문제 발생')
			}
		})
	}
		function searchStu(){
			let formData = {}
			let arr = $("#frm").serializeArray()
			for(i=0; i<arr.length;i++){
				formData[arr[i].name] = arr[i].value
			}
			$.ajax({
				url: "search_stu" , type: "POST",
				dataType:"json",
				data:JSON.stringify(formData),
				contentType:"application/json;charset=utf-8",
				success: function(list){
					let html = "<table border='1' style='margin-top:20px; margin-left:20px;'>"
					html += "<tr><td align='center'>번호</td><td align='center'>이름</td><td align='center'>학번</td>"
					html += "<td align='center'>학년</td><td align='center'>학과</td><tr>"
					for(var i=0;i<list.length;i++){
					html += "<tr><td align='center'>"+(i+1)+"</td><td>"+list[i].name+"</td>"
					html += "<td align='center'>"+"<form action='${contextPath }/professor/detail_stuInfo' enctype='multipart/form-data' method='post'>"
							+"<input type='text' name='id' value='"+list[i].idNum+"' readonly>"
							+"<input type='submit' value='상세정보'></form></td>"
					html += "<td align='center'>"+list[i].grade+"</td>"
					html += "<td align='center'>"+list[i].major+"</td></tr>"
					}
					html += "</table>"
						$("#stuList").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게, 같은 이름으로 걸어주니 모든 게 해결...
				}
				, error:function(){
					alert('문제 발생')
				}
			})
	}
</script>

</head>
<body>
 <c:import url="../default/professorHeader.jsp" />
 <div class="btn-group" role="group" aria-label="Basic example">
  <button type="button" class="btn btn-secondary" onclick="juniorList()" style="margin-top:20px; margin-left:20px;">1학년</button>
  <button type="button" class="btn btn-secondary" onclick="seniorList()" style="margin-top:20px;">2학년</button>
</div>
<form name="frm" id="frm" method="post">
	<input type="text" name="sName" id="sName">
	<input type="button" value="검색" onclick="searchStu()">
</form>

<div id="stuList"></div>






</body>
</html>