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
	function showDetail(seme){
		var idNum = $('#idNum').val()
		var seme01 = seme
		var form = {'idNum':idNum,'seme01':seme}
		$.ajax({
			url: "seme_detail", 
			type: "POST",
			dataType:"json",
			data:JSON.stringify(form),
			contentType:"application/json;charset=utf-8",
			success: function(list){
				if(list.length == 0){
					let html = "<table border='1' style='margin-top:20px; margin-left:20px;'>"
						html += "<tr><td align='center'>번호</td><td align='center'>학기</td><td align='center'>교과목</td>"
						html += "<td align='center'>취득 학점</td><td align='center'>평점</td><td align='center'>등급</td><tr>"
						html += "<tr><td align='center' colspan='6'><b>해당 학기 성적이 없습니다.</b></td></tr></table>"
						$("#semeDetail").empty().append(html)
				}else{
					let html = "<table border='1' style='margin-top:20px; margin-left:20px;'>"
						html += "<tr><td align='center'>번호</td><td align='center'>학기</td><td align='center'>교과목</td>"
						html += "<td align='center'>취득 학점</td><td align='center'>평점</td><td align='center'>등급</td><tr>"
				for(var i=0;i<list.length;i++){
				html += "<tr><td align='center'>"+(i+1)+"</td><td>"+list[i].gradeSeme+"</td>"
				html += "<td align='center'>"+list[i].subjectName+"</td>"
				html += "<td align='center'>"+list[i].score+"</td>"
				html += "<td align='center'>"+list[i].grade+"</td>" //나중에 수정 받은 평점으로 
				html += "<td align='center'>"+list[i].grade+"</td></tr>"
				}
				html += "</table>"
				
					$("#semeDetail").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게, 같은 이름으로 걸어주니 모든 게 해결...
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
 
<table border="1">
<c:forEach var="pStuInfo" items="${detailStuInfo}">
<tr>
<td>학번</td> <td>${pStuInfo.idNum}</td> <td>이름</td> <td>${pStuInfo.name}</td>
</tr>
<tr>
<td>휴대폰 번호</td> <td>${pStuInfo.phoneNum}</td> <td>생년월일</td> <td>${pStuInfo.residentNum}</td>
</tr>
<tr>
<td>이메일</td> <td>${pStuInfo.email}</td> <td>학과</td> <td>${pStuInfo.major}</td>
</tr>
<tr>
<td>학년 - 반</td> <td>${pStuInfo.class_}</td> <td>국적</td> <td>${pStuInfo.country}</td>
</tr>
</c:forEach>
</table>
<input type="button" onclick="location.href='${contextPath }/professor/all_student'" value="Back">
<br>
<br>
<br>

 
<table border="1">
<tr>
<td>학년/학기</td> <td>신청학점</td> <td>취득학점</td> <td>취득학점 평균</td> <td>석차</td>
</tr>
<!-- varStatus로 인덱스를 매기면 하나 하나 개별적으로 값을 전달하는 것이 가능하다. -->
<c:forEach var="sGrade" items="${semeGradeInfo}" varStatus="status">
<input type="hidden" id="idNum" value="${sGrade.idNum }"/>
<input type="hidden" id=seme${status.index} value="${sGrade.gradeSeme }"/>
<tr>
<td><input type="button" value="${sGrade.gradeSeme}" onclick="showDetail($('#seme${status.index}').val())"/></td>
 <td>${sGrade.appCred}</td>
<td>${sGrade.receivedCred}</td> <td>${sGrade.aveGrade}</td> <td>${sGrade.rank}</td>
</tr>
</c:forEach>
</table>

<br>
<div id="semeDetail"></div>
<br>
<!-- 반복되지 않으면 c:forEach를 쓰면 안 된다. list 같은 것들만 쓸 것. -->
<table border="1" style='margin-top:20px; margin-left:20px;'>
<tr>
<td>신청 학점</td> <td>취득 학점</td> <td>평균 평점</td> <td>환산 점수</td>
</tr>

<tr>
 <td>${accumInfo.applyGrade}</td> <td>${accumInfo.receivedGrade}</td>
 <td>${accumInfo.aveGrade}</td> <td>${accumInfo.totalScore}</td>
</tr>

</table>


</body>
</html>