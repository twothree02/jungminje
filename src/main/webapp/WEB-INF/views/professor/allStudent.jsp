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
	function juniorList(){
		$.ajax({
			url: "junior_list" , type: "POST",
			//data : JSON.stringify(ArrayList) //데이터는 이건 보낼 때 
			dataType:"json",
			contentType:"application/json;charset=utf-8",
			success: function(list){
				$("#label").text(list[0].name + ":" + list[0].idNum + ":" + list[0].major)
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
  <button type="button" class="btn btn-secondary" style="margin-top:20px;">2학년</button>
</div>
<label id="label"></label>

</body>
</html>