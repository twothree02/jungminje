<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	width: 70%;
	margin-left: 15%;
	margin-right: 15%;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp" />
	<h2 style="text-align: center; margin-top: 30px;">등 록</h2>
	<p style="text-align: center;">YW university</p>
	<form action="academicRegister" method="post" enctype="multipart/form-data"
		style="margin-top: 50px;" role="form">

		<div align="center">
		<div class=" col-lg-4" style="margin-bottom: 20px;" >
			<input type="text" name="title" placeholder="제목을 입력하세요" required="required"
				class="form-control input-lg">
		</div>
		<div class=" col-lg-4" align="center" style ="margin-bottom: 20px;">
			<input type="text" name="name" class="form-control" placeholder="작성자명을 입력하세요" required="required">
		</div>
		<div class=" col-lg-4" align="center" style ="margin-bottom: 20px;" >
			<textarea rows="5" name="content"class="form-control" placeholder="내용을 입력하세요" required="required" style="resize: none;"></textarea>
		</div>
		<div class=" col-lg-4" align="center" style ="margin-bottom: 20px;">
			<input type="file" name="fileupload">
		</div>
</div>


		<div align="center">
			<input type="submit" class="btn btn-secondary" value="저장">
			<button type="reset" class="btn btn-secondary">취소</button>
		</div>
	</form>



</body>
</html>