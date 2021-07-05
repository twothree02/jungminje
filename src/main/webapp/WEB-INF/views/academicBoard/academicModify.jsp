<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학사공지</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>
<body>
	<c:import url="../default/header.jsp" />
	<div>
	<div style="width: 1300px; margin: auto;">
	<h2 style="text-align: center; margin-top: 30px;">수 정</h2>
	<p style="text-align: center;">YW university</p>
		<form action="academicModify" enctype="multipart/form-data" method="post">
			<input type="hidden" name="writeNo" value="${board.writeNo}">
			<input type="hidden" name="originFileName"
				value="${board.fileupload}">
			<table class="table">
				<thead>
					<tr>


						<th scope="col" style="padding-top: 30px;">제목</th>
						<th scope="col">
						<input type="text" name="title"	value="${board.title }" class="form-control">
						</th>
						<th scope="col">&nbsp;</th>
						<th scope="col">&nbsp;</th>
						
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="col">내용</th>
						<th scope="col">	<textarea rows="20" cols="130"
					style="resize: none;"class="form-control" name="content">${board.content }</textarea></th>
					</tr>
					
					<tr>	
						<th scope="col" style="width: 200px;">첨부파일</th>
					
						<c:if test="${board.fileupload != 'nan'}">

							<th scope="col" id="preview"><a
								href="download?fileupload=${board.fileupload}">${board.fileupload }</a></th>

						</c:if>
						<th><input type="file" name="fileupload"></th>
					</tr>
					
					<tr>
						<th scope="col">등록일</th>
						<th scope="col">"${board.savedate }"</th>
						<th scope="col">&nbsp;</th>
						<th scope="col">&nbsp;</th>

					</tr>

				</tbody>
			</table>
			<div align="center">
			<input type="submit" class="btn btn-secondary" value="수정">
			<button type="button" class="btn btn-secondary"	onclick="location.href='academicList'">목록</button>
			</div>
		</form>
	</div>
	</div>
		<c:import url="../default/footer.jsp"></c:import>
	

</body>
</html>