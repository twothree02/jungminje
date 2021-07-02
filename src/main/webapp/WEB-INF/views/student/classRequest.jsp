<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 div{ /* border: 1px solid black; */ }
 .title{}
 .title2{text-align: right;}
 .content{width:90%; height: 50%; margin: auto; overflow: auto;}
 .confirm{width:90%; height: 20%; display: flex; flex-direction: column; margin: auto; margin-top: 50px;}
</style>

<script type="text/javascript">
	function req(){
		if(document.getElementById("classChk").checked){
			clsssReq.submit();
		}else{
			alert("수강동의를 선택해 주세요");
		}
	
	}
</script>
</head>
<body>
<c:import url="../default/studentheader.jsp" />
<div class="wrap">
<div class="title">
<h1>수강신청</h1>
</div>
<div class="title2">
<h5>${info.major}-${info.gradeSemester} / ${info.grade}학년</h5>
</div>
<div class="content" align="center">
	<table class="table" style="text-align: center;">
						<thead class="thead-dark">
							<tr>
								<th>과목명</th>
								<th>시간</th>
								<th>강의실</th>
								<th>담당교수</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="dto" items="${list}" >
						<tr>
							<td>${dto.subjectName}</td>
							<td>${dto.lectureTime}</td>
							<td>${dto.classRoom}</td>
							<td>${dto.professor}</td>
						</tr>
						</c:forEach>
					</tbody>
					</table>

</div>
<div class="confirm">
	<c:choose>
	<c:when test="${infoC.gradeSemester != info.classReq }">
	<form action="classReqChk" id="clsssReq" method="POST">
	<div style="text-align: center;">
	<label class="form-check-label">
    <input type="checkbox" class="form-check-input" id="classChk"  name="classChk" value="agree">상기 내용에 동의하며, 해당과목을 수강신청 합니다.
    </label>
    </div>
    <div align="center" style="margin-top: 5px;">
    <button type="button" class="btn btn-secondary" onclick="req()">수강신청</button>
    </div>
    </form>
    </c:when>
    <c:otherwise>
    <h3>수강신청이 완료 되었습니다.</h3>
    </c:otherwise>
    </c:choose>
</div>

</div>
	<c:import url="../default/footer.jsp"></c:import>

</body>
</html>