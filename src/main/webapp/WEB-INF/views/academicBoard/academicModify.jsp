<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>
<body>
	<c:import url="../default/header.jsp" />
	<div>
		<form action="academicModify" enctype="multipart/form-data" method="post">
			<input type="hidden" name="writeNo" value="${board.writeNo}">
			<input type="hidden" name="originFileName"
				value="${board.fileupload}">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">제목</th>
						<th scope="col"><input type="text" name="title"
							value="${board.title }"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="col">내용</th>
						<th scope="col"><input type="text" name="content"
							value="${board.content }"></th>

						<th scope="col">첨부파일</th>
						<c:if test="${board.fileupload != 'nan'}">

							<th scope="col" id="preview"><a
								href="download?fileupload=${board.fileupload}">${board.fileupload }</a></th>

						</c:if>
						<th><input type="file" name="fileupload"></th>
					</tr>
					<tr>
						<th scope="col">등록일</th>
						<th scope="col">"${board.savedate }"</th>


					</tr>

				</tbody>
			</table>
			<div align="center">
			<input type="submit" class="btn btn-secondary" value="수정">
			<button type="button" class="btn btn-secondary"	onclick="location.href='academicList'">목록</button>
			</div>
		</form>
	</div>
	
	

</body>
</html>