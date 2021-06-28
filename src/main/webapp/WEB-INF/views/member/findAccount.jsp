<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>YW University</title>
<link href="resources/css/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function findId(){
		let form = {}
		let arr = $("#findId").serializeArray()
		for(i=0; i<arr.length; i++){
			form[arr[i].name] = arr[i].value
		}
		$.ajax({
			url:"findId" ,type:"POST",dataType:"json",
			data:JSON.stringify(form),
			contentType:"application/json; charset=utf-8",
			success:function(rep){
				alert($("#inputName").val() + ' 님의 아이디는 ' + rep.result + ' 입니다.')
			},
			error:function(request,status,error){
				alert("회원이 아니거나 이름 또는 전화번호를 잘못 입력하셨습니다. 다시 한 번 확인해 주세요.");

			}
		})
	}
	
	function findPw(){
		let form = {"inputId" : $("#inputId").val(), "inputEmail" : $("#inputEmail").val() + "@" + $("#address").val()}
		//let arr = $("#findPw").serializeArray()
		//for(i=0; i<arr.length; i++){
		//	form[arr[i].name] = arr[i].value
		//}
		$.ajax({
			url:"findPw" ,type:"POST",dataType:"json",
			data:JSON.stringify(form),
			contentType:"application/json; charset=utf-8",
			success:function(rep){
				alert("임시 비밀번호가 메일로 발송되었습니다.");
			},
			error:function(request,status,error){
				alert("아이디 또는 이메일을 잘못 입력하셨습니다. 다시 한 번 확인해 주세요.");

			}
		})
	}
</script>
</head>
<body class="bg-secondary">
	<c:set var="contextPath" value="<%=request.getContextPath() %>" />
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<div
				style="text-align: center; padding-top: 2%; font-size: 30pt; color: white;">
				YW University</div>
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-5" style="margin-right: 0;">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">아이디 찾기</h3>
								</div>
								<div class="card-body">
									<form id = "findId" method="post">
										<div class="form-floating mb-3">
											<input class="form-control" name="inputName" id = "inputName" type="text"
												placeholder="name" /> <label for="inputName">이름 입력</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" name="inputPhone" id = "inputPhone" type="text"
												placeholder="01000000000" /> <label for="inputPhone">전화번호 입력</label>
										</div>
										<div
											class="d-flex align-items-center justify-content-between mt-4 mb-0">
											<input type="button" class="btn btn-primary" onclick="findId()" value="아이디 찾기">
											<input type="button" class="btn btn-primary" onclick="location.href='${contextPath}'" value="로그인하기">
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="col-lg-5" style="margin-right: 0;">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">비밀번호 찾기</h3>
								</div>
								<div class="card-body">
									<form id = "findPw" method="post">
										<div class="form-floating mb-3">
											<input class="form-control" name="inputId" id="inputId" type="text"
												placeholder="id" /> <label for="inputId">아이디 입력</label>
										</div>
										<div class="form-floating mb-3" style="display: flex;">
											<input class="form-control" name="inputEmail" id="inputEmail" type="text"
												placeholder="abc@aaa.com" style="width: 50%;"> <label for="inputEmail">E-mail 입력</label>
											<font style="padding-top: 15px;">@</font>
<<<<<<< HEAD
											<select name="address" id="address" class="form-control" style="width: 50%;">
												<option value="none">=== 선택 ===</option>
												<option value="naver.com">naver.com</option>
												<option value="daum.net">daum.net</option>
												<option value="gmail.com">gamil.com</option>
												<option value="nate.com">nate.com</option>
											</select>
=======
											<div class="form-floating">
												<select class="form-select" id="floatingSelect" aria-label="Floating label select example" style="width: 200%;">
													<option value="none" selected>== 선택 ==</option>
													<option value="naver.com">naver.com</option>
													<option value="daum.net">daum.net</option>
													<option value="gmail.com">gamil.com</option>
													<option value="nate.com">nate.com</option>
												</select> <label for="floatingSelect" style="width: 100%;">Domain</label>
											</div>
>>>>>>> yw
										</div>
										<div
											class="d-flex align-items-center justify-content-between mt-4 mb-0">
											<input type="button" class="btn btn-primary" onclick="findPw()" value="비밀번호 찾기">
											<input type="button" class="btn btn-primary" onclick="location.href='${contextPath}'" value="로그인하기">
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>

			</main>
		</div>

		<div id="layoutAuthentication_footer">
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; YW University</div>
						<div>관리자 | TEL 010-0000-0000</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
</body>
</html>
