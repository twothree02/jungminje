<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YW University_정보수정</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/daumpost.js"></script>

<!-- 오픈 API  -->
<!-- 외부 js 가져와 사용하기 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 해당 js에서 제공해 주는 함수 등을 입력 -->
<script type="text/javascript">
	$(document).ready(function() {
		//이메일 domain선택 selectBox
		$('#floatingSelect').change(function() {
			$("#floatingSelect option:selected").each(function() {
				//직접입력일 경우
				if ($(this).val() == 'self') {
					$("#domain").val(''); //textBox값 초기화
					$("#domain").attr("disabled", false); //textBox 활성화
				}
				else {
					$("#domain").val($(this).val()); //selectBox에서 선택한 값을 textBox에 입력
					$("#domain").attr("disabled", true); //textBox 비활성화
				}
			});
		});
	});

	function resetMod() {
		alert('정보수정이 취소되었습니다.');
		location.href = "<%=request.getContextPath() %>/main";
	}
	<%--
	function modify(){
		let form = {"name" : $("#name").val(),
					"pw" : $("#pw").val(),
					"addr" : $("#addr2").val(),
					"detailAddr" : $("#detailAddr").val(),
					"email" : $("#email").val() + "@" + $("#domain").val(),
					"imageFile" : $("#imageFile").val(),
					"file" : $("#file")[0].files[0]};
		$.ajax({
			url:"modify", type:"POST", dataType:"json",
			data:JSON.stringify(form),
			processData: false,
			//contentType: false,
			contentType:"application/json; charset=utf-8",
			success:function(rep){
				alert("정보가 정상적으로 수정되었습니다.");
				location.href="<%=request.getContextPath() %>/main";
			},
			error:function(request,status,error){
				alert("오류가 발생했습니다. 관리자에게 문의해 주세요.");

			}
		})
	}
	--%>
	
	function deleteFile() {
		$("#imageFile").val('nan');
	}
</script>

<style type="text/css">
	#modTable th { background-color : rgb(233, 236, 239);
		 text-align: right; }
</style>
</head>
<body>
	<c:import url="../default/header.jsp" />
	
	<div style="height: 750px; display: flex;">
		<div
			style="border: 1px solid black; width: 15%; margin-left: 30px; margin-top: 30px; margin-right: 30px; padding-left: 20px; height: 280px;">
			<table>
				<c:forEach var="mem" items="${memberList }">
					<tr>
						<th>로그인정보</th>
						<c:choose>
							<c:when test="${mem.imageFile == 'nan' }">
								<td rowspan="4"><img class="navbar-brand rounded-circle" src="resources/img/nan.png" width=100px; height=100px;></td>
							</c:when>
							<c:otherwise>
								<td rowspan="4"><img class="navbar-brand rounded-circle" src="<%=request.getContextPath() %>/member/download?imageFile=${mem.imageFile}" width=100px; height=100px;></td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<th style="padding-top: 30px;">${mem.name }</th>
					</tr>
					<tr>
						<th style="padding-top: 30px;">${mem.position }</th>
					</tr>
					<tr>
						<th style="padding-top: 30px; padding-bottom: 25px;">${mem.major }</th>
					</tr>
				</c:forEach>
				<tr>
					<th style="padding-right: 20px;"><button type="button"
							class="btn btn-secondary" onclick="location.href='<%=request.getContextPath()%>/logout'">로그아웃</button></th>
					<th><button type="button" class="btn btn-secondary" onclick="location.href='<%=request.getContextPath()%>/modifyInfo'">정보수정</button></th>
				</tr>
			</table>
		</div>
		
		<div style="width: 80%; margin: auto; margin-top: 30px; display: flex;">
			<div style="margin-bottom: 30px;">
				<div class="container">
					<h2>정 보 수 정</h2>
					<form action="modify" enctype="multipart/form-data" method="post">
						<font style="font-size: 13px;">*파일 업로드 시 업로드 한 날짜 및 시간이 파일명 앞 부분에 자동으로 추가되어 올라갑니다.</font>
						<table class="table" id="modTable">
							<c:forEach var="mem" items="${memberList }">
								<thead>
									<tr>
										<th width="180px" style="text-align: right;">학번/사번</th>
										<td width="600px">${login }</td>
									</tr>
									<tr>
										<th style="text-align: right;">이름</th>
										<td>
											<input class="form-control form-control-sm" name="name" id="name" type="text" value="${mem.name }">
										</td>
									</tr>
									<tr>
										<th style="text-align: right;">비밀번호</th>
										<td>
											<input class="form-control form-control-sm" name="pw" id="pw" type="password" value="${mem.pw }">
										</td>
									</tr>
									<tr>
										<th style="text-align: right;">생년월일</th>
										<td>
											<c:set var="residentNum" value="${mem.residentNum }" />
											${fn:substringBefore(residentNum, '-') }
										</td>
									</tr>
									<tr>
										<th style="text-align: right;">주소</th>
										<td style="display: flex;">
											<input type="hidden" id="zone" name="addr" placeholder="zonecode">
											<input class="form-control form-control-sm" id="addr2" name="addr2" type="text" value="${mem.addr }" style="width: 70%;" readonly>
											&nbsp;&nbsp;<button type="button" class="btn btn-secondary btn-sm" onclick="daumPost()">주소 찾기</button>
										</td>
									</tr>
									<tr>
										<th style="text-align: right;">상세주소</th>
										<td>
											<input class="form-control form-control-sm" id="detailAddr" name="detailAddr" type="text" value="${mem.detailAddr }">
										</td>
									</tr>
									<tr>
										<th style="text-align: right;">이메일</th>
										<c:set var="email" value="${mem.email }" />
										<td style="display: flex;">
											<input class="form-control form-control-sm" id="email" name="email" type="text" value="${fn:substringBefore(email, '@') }">
											@
											<input class="form-control form-control-sm" id="domain" name="domain" type="text" value="${fn:substringAfter(email, '@') }" disabled="true">
											&nbsp;&nbsp;
											<select class="form-select btn-secondary" name="selectDomain" id="floatingSelect">
												<option value="${fn:substringAfter(email, '@') }">== 선택 ==</option>
												<option value='gmail.com'>구글</option>
										        <option value='naver.com'>네이버</option>
										        <option value='nate.com'>네이트</option>
										        <option value='daum.net'>다음</option>
										        <option value='dreamwiz.com'>드림위즈</option>
										        <option value='yahoo.co.kr'>야후코리아</option>
										        <option value='empal.com'>엠파스</option>
										        <option value='chollian.net'>천리안</option>
										        <option value='korea.com'>코리아닷컴</option>
										        <option value='paran.com'>파란</option>
										        <option value='freechal.com'>프리챌</option>
										        <option value='hotmail.com'>핫메일</option>
										        <option value='hanafos.com'>하나포스닷컴</option>
										        <option value='hanmail.net'>한메일</option>
										        <option value="self">직접입력</option>
											</select>
										</td>
									</tr>
									<tr>
										<th style="text-align: right;">프로필 사진</th>
										<td style="display: flex;">
											<input class="form-control form-control-sm" id="imageFile" name="imageFile" type="text" value="${mem.imageFile }" style="width: 70%;" readonly>
											&nbsp;&nbsp;<button type="button" class="btn btn-secondary btn-sm" onclick="document.all.file.click()">파일 선택</button>
											<button type="button" class="btn btn-secondary btn-sm" onclick="deleteFile()">파일 삭제</button>
											<input type="file" name="file" id="file" style="display:none" onchange="javascript:document.getElementById('imageFile').value = this.value.split('\\')[this.value.split('\\').length-1]">
										</td>
									</tr>
								</thead>
							</c:forEach>
						</table>
						<!-- <input type="button" class="btn btn-secondary" onclick="modify()" value="수정">  -->
						<input type="submit" class="btn btn-secondary" value="수정">
						<input type="reset" class="btn btn-secondary" onclick="resetMod()" value="취소">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>