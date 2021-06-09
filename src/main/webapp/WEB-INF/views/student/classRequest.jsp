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
			alert(document.getElementById("classChk").value);
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
<h5>경영학과-101/1학년</h5>
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
						<tr>
							<td>재무관리</td>
							<td>수 1,2/금 3</td>
							<td>사회관 101</td>
							<td>홍길동</td>
						</tr>
						<tr>
							<td>재무관리</td>
							<td>수 1,2/금 3</td>
							<td>사회관 101</td>
							<td>홍길동</td>
						</tr>
						<tr>
							<td>재무관리</td>
							<td>수 1,2/금 3</td>
							<td>사회관 101</td>
							<td>홍길동</td>
						</tr>
						<tr>
							<td>재무관리</td>
							<td>수 1,2/금 3</td>
							<td>사회관 101</td>
							<td>홍길동</td>
						</tr>

					</tbody>
					</table>

</div>
<div class="confirm">
	<form action="" id="clsssReq" method="POST">
	<div style="text-align: center;">
	<label class="form-check-label">
    <input type="checkbox" class="form-check-input" id="classChk"  name="classChk" value="agree">상기 내용에 동의하며, 해당과목을 수강신청 합니다.
    </label>
    </div>
    <div align="center" style="margin-top: 5px;">
    <button type="button" class="btn btn-secondary" onclick="req()">수강신청</button>
    </div>
    </form>
</div>

</div>
</body>
</html>