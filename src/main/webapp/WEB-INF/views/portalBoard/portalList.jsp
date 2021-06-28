<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../default/header.jsp" />
	<div class="container">
		<h2 style="text-align: center; margin-top: 30px;">포 털 공 지</h2>
		<p style="text-align: center;">YW university</p>
		<div align="right">
		<form id ="searchfrom" action="portalList" method ="get">
		<select name = "type">
		<option VALUE =""${boardPage.vN.type ==null?"selected":""}>----</option>
		<option VALUE ="T"${boardPage.vN.type eq 'T'?"selected":""}>제목</option>
		<option VALUE ="N"${boardPage.vN.type eq 'N'?"selected":""}>작성자</option>
		<option VALUE ="NC"${boardPage.vN.type eq 'TN'?"selected":""}>제목+작성자</option>
		</select>
		<input type ="text" name = "keyword" value ="${boardPage.vN.keyword }">
		<input type ="hidden" name = "pageNum" value ="${boardPage.vN.pageNum }">
		<input type ="hidden" name = "amount" value ="${boardPage.vN.amount }">
		<button class="btn btn-secondary">찾기</button>
		</form>
		</div>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>

					<th>등록일</th>
					
				</tr>
			</thead>
			<tbody>
				<c:if test="${list.size() == 0 }">
					<tr>
						<th>등록된 글이 없습니다</th>
					</tr>
				</c:if>

				<c:forEach var="board" items="${list }">
					<tr>
						<td>${board.writeNo }</td>
						<td><a href="portalContentView?writeNo=${board.writeNo}">${board.title }</a></td>
						<td>${board.name }</td>
						<td>${board.savedate }</td>
					
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div align="center">
		<button type="button" class="btn btn-secondary"
			onclick="location.href='portalRegister'" style ="margin-top: 20px; margin-bottom: 20px;">등록</button>	
	</div>
		
	
	
	
	<div style="display: flex; justify-content: center;">
		<ul class="pagination">
			<c:if test="${boarPage.prev }">
				<li class="page-item"><a class="page-link" href="${boardPage.startPage-1 }"
					>Previous</a></li>
			</c:if>

			<c:forEach begin="${boardPage.startPage }"
				end="${boardPage.endPage }" var="num">
				<li class="page-item ${boardPage.vN.pageNum == num ? "active":""}"><a
					class="page-link" href="${num}">${num }</a></li>
			</c:forEach>

			<c:if test="${boarPage.next }">
				<li class="page-item"><a class="page-link" href="${boardPage.startPage+1 }"
				>Next</a></li>
			</c:if>
		</ul>
	</div>
	<form id = "potalform" action ="portalList"  method = "get">
	<input type ="hidden" name = "pageNum" value = "${boardPage.vN.pageNum }">
	<input type ="hidden" name = "amount" value = "${boardPage.vN.amount }">
	</form>
<script type="text/javascript">
	$(document).ready(function() {
		var actionform =$("#potalform");
		
		$(".page-link").on("click",function(e){
			e.preventDefault();
		var targetPage =$(this).attr("href");
		console.log(targetPage);
		actionform.find("input[name='pageNum']").val(targetPage);
		actionform.submit();
		});	
		
	});

</script>
</body>
</html>


