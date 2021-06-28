<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#modal_wrap {
	display: none;
	position: fixed;
	z-index: 9;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
	width: 100%;
	height: 100%;
	background-color: #D5D5D5;
}

#first {
	display: none;
	position: fixed;
	z-index: 10;
	margin: 0 auto;
	top: 30px;
	left: 0;
	right: 0;
	height: 450px;
	width: 300px;
	background-color: #D5D5D5
}
</style>


<!-- jquery사용을 위한 script 설정 -->

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script type="text/javascript">

/*
//버튼 눌렀을 떄 내려오는 slide
function slideClick(){
	$("#first").slideDown('slow'); 
	$("#modal_wrap").show();
}
//수정 버튼 누르면 사라지는 slide
function slide_hide(){
	$("#first").slideUp('fast'); 
	$("#modal_wrap").hide();
}
*/



//페이지 로딩시 댓글 목록 조회
function abcd(number){
$(document).ready(function(){
	console.log(number)
	// 페이지가 로딩 될때 실행
	var rno = ${board.writeNo};//게시물 변수 선언
	$.ajax({
		type : "POST", //ajax로 서버와 통신
		url : "portalList?num="+number, //경로
		data : {"rno" : rno}, //서버로 데이터 전송시 어떤 데이터로 해석할 건가 지정
		dataType : "json",
		success : function(result){ //통신성공시 동적으로 변경
		commentList(result);
		},
		error : function(){
				alert("댓글 리스트 불러오기 실패");
		}
	});
});
}

// 댓글 목록 조회 함수
function commentList(result){
	
	var repeat = result.repeat;
	var commentList = result.commentList;
	var paging = result.paging;
	console.log("========시작되는지점==========");
	console.log(repeat)

	var html="";
	html +="<div tyle='display: flex; justify-content: center;'>"
	html +="<div>"
	html +="<table class='table'>"
	html +="<thead>"
	html +="<tr>"
	html +="<th scope='col'>작성자</th>"

	html +="<th scope='col'>내용</th>"
	html +="<th scope='col'>시간</th><th scope='col'>수정</th><th scope='col'>삭제</th></tr>"	
	html +="<thead>"
	for(var i in paging){
		
			html +="<tbody>"
			html += "<tr>"
			html += "<td>" + paging[i].id + "</td>";

			html += "<td>" + paging[i].content + "</td>"
			html += "<td>" + displayTime(paging[i].write_date) + "</td>"
			html += "<td> <button' onclick='commentModiView("+paging[i].step+")' class='btn btn-secondary' >수정</button></td>"
			html += "<td > <button onclick='commentDelete("+paging[i].step+")' class='btn btn-secondary'>삭제</button></td>"	
			html += "</tr>"
			html += "</tr>"			
			html += "</tr>"
			html += "</tbody>"			
	}
			html += "</table>"
			html +="</div>"
			
			var page ="";
			for(var page2=1;page2<=repeat;page2++){
				 page += "<button type='button' class='btn btn-outline-secondary' onclick='abcd("+page2+")' id ='activcely'>"+page2+"</button>"
			}
			$("#commentArea").html(html);
			$("#pagig").html(page);
}
function ac(){
	$('#activcely').attr('class','btn btn-outline-secondary-active');
}
// 댓글 입력
function rep(){
	var x = document.forms["frm"]["title"].value;
	var y= document.forms["frm"]["content"].value;
	if(x==""){
		alert("제목을 입력하세요");
		return;
	}
	if(y==""){
		alert("내용을 입력하세요");
		return;
	}
	let form={}
	let arr = $("#frm").serializeArray()
	for(i=0; i < arr.length; i++){
		form[arr[i].name] = arr[i].value
	}
	$.ajax({
		url:"portalReply", type:"POST", dataType:"json",
		data:JSON.stringify(form),
		contentType:"application/json; charset=utf-8",
		success: function(list){
			abcd(1)
			alert("성공적으로 답글이 달렸습니다");
		}, error:function(){
			alert('문제가 발생했습니다')
		}
	})
}

// 댓글 삭제
function commentDelete(step){
	$.ajax({
		type : "GET",
		url : "portalDelete",
		data : {
				"step" : step,
				"rno" : ${board.writeNo}
			},
		dataType : "json",
		success : function(result){
			commentList(result);
			 abcd(1)
			alert("댓글이 삭제되었습니다");
		},
		error : function(){
				alert("댓글 삭제 실패");
		}
	});
}
//댓글 수정눌렀을 때 이전 댓글 불러오기
function commentModiView(step){
	$("#first").slideDown('slow'); 
	$("#modal_wrap").show();
	

	$.ajax({
		type : "GET",
		url : "portalModView",
		data : {
				"step" : step,
				"rno" : ${board.writeNo}
			},
		dataType : "json",
		success : function(result){
			var confirmId = result.id
			if(${login} == confirmId){
			commentModifyArea(result)
			}else {
				alert("본인이 작성한 글만 수정할 수 있습니다");
			}
	},	
		error : function(){
				alert("수정창 불러오는 도중 문제발생");
		}
	});
}

//댓글 수정창
function commentModifyArea(result){
	var output ="";
	
	
	output += "<div id'modal_wrap'>"
		output += "<div id='first'>"

			output += "<div style='width:250px; margin: 0 auto; padding-top: 20px;'>"
				output +="<i text-align:center>댓글 수정</i><br>"
				output +="아이디 : <input type='text' id='id' value='${login}' readonly style='margin-bottom: 30px;'><br/>";
				output +="작성자 : <input type='text' id='replyid' value='"+result.id+"'readonly style='margin-bottom: 30px;'><br/>";
			
				output +="댓글 :  <input type='text' id='content' value='"+result.content+"' style='margin-bottom: 30px;'><br/>";
			
				output +="<button onclick = 'modify()' class='btn btn-secondary'style='margin-right: 20px;'>댓글 수정 </button>";
				output +="<button onclick = ' slide_hide()' class='btn btn-secondary'>취소 </button>";
		
				output +="<input type = 'hidden' id='step' value='"+result.step+"'>";
				output += "</div>"
					output += "</div>"
						output += "</div>"
	
	$("#commentModifyArea").append(output);
	
}
function slide_hide(){
	$("#first").slideUp('fast'); 
	$("#modal_wrap").hide();
}
function modify(){ 
	console.log(${login})

	var title = $("#title").val();
	var content = $("#content").val();
	var step = $("#step").val();
	var rno = ${board.writeNo};
	$.ajax({
		type : "POST",
		url : "portalModify",
		data : {
			
				"content" : content,
				"step" : step,
				"rno" : rno
			},
		dataType : "json",
		success : function(result){
		
			commentList(result);
			commentModifyClose(result);
			abcd(1)
			alert("수정되었습니다");
		
					},
		error : function(){
				alert("수정중 오류 발생.");
		}
	});
}






//댓글 수정 후 창없어짐

function commentModifyClose(result){
	var output ="";
 
	$("#commentModifyArea").html(output);
	
} 


</script>
<script type="text/javascript">
function displayTime(timeValue) {
	var today = new Date();
	var gap = today.getTime() - timeValue;
	var dateObj = new Date(timeValue);
	var str= "";
	
	if(gap < (1000*60*60*24)) {
		var hh = dateObj.getHours();
		var mi = dateObj.getMinutes();
		var ss = dateObj.getSeconds();
		
		return [(hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi, ':', (ss>9? '':'0') + ss].join('');
	} else {
		var yy = dateObj.getFullYear();
		var mm = dateObj.getMonth() + 1; //getMonth는 zero-based
		var dd = dateObj.getDate();
		return [yy, '/', (mm>9 ? '': '0') + mm, '/', (dd>9? '':'0') + dd].join('');
	}
};
</script>

</head>
<body onload="abcd(1)">
	<c:import url="../default/header.jsp" />
	<div align="center" style="margin-top: 50px;">

		<table class="table">
			<thead>
				<tr>
					<th scope="col">제목</th>
					<th scope="col">${board.title }"</th>
					<th scope="col">작성자</th>
					<th scope="col">"${board.name }"</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="col">내용</th>
					<th scope="col">${board.content }"</th>


					<th scope="col">첨부파일</th>
					<c:if test="${board.fileupload == 'nan'}">
						<td><b>등록된 첨부파일이 없습니다</b></td>
					</c:if>
					<c:if test="${board.fileupload != 'nan'}">
						<th scope="col"><a
							href="download?fileupload=${board.fileupload}">${board.fileupload }</a></th>

					</c:if>
				</tr>
				<tr>
					<th scope="col">등록일</th>
					<th scope="col">"${board.savedate }"</th>
					<th scope="col">조회수</th>
					<th scope="col">${board.hit }</th>
				</tr>

				<tr>
					<th scope="col">&nbsp;</th>
					<th scope="col">&nbsp;</th>
					<th scope="col">&nbsp;</th>
					<th scope="col">&nbsp;</th>
				</tr>

			</tbody>
		</table>
	</div>
	<div align="center">
		<button type="button" class="btn btn-secondary"
			onclick="location.href='portalModify?writeNo=${board.writeNo}'">수정</button>
		<button type="button" class="btn btn-secondary"
			onclick="location.href='portalList'">목록</button>
		<input type="submit" class="btn btn-secondary"
			onclick="location.href='portalDelete?writeNo=${board.writeNo }&fileupload=${board.fileupload}'"
			value="삭제">
	</div>


	<!-- 댓글 영역 -->

	<form id="frm" method="post">
		<input type="hidden" name="writeNo" value="${board.writeNo }">
		<div align="left" style="margin-top: 30px;">
			<b>댓글</b>&nbsp;&nbsp; <b>작성자 : ${login }</b>&nbsp;&nbsp; &nbsp;&nbsp;
			 <b>내용:</b>
			&nbsp;&nbsp;<input type="text" size="30" name="content">
			<button type="button" onclick="rep()" class='btn btn-secondary'>답글</button>
			<button type="button" class='btn btn-secondary'>취소</button>
			<hr>
		</div>
	</form>



	<div id="commentArea"></div>
	<div id='commentModifyArea'></div>

	<div id="pagig" align="center"></div>

</body>
</html>























