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
</head>
<body class="bg-secondary">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<div style="text-align: center; padding-top: 2%; font-size: 30pt; color: white;">
				YW University
			</div>
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-5" style="margin-right: 0;">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">Login</h3>
								</div>
								<div class="card-body">
									<form action = "loginChk" method ="post">
										<div class="form-floating mb-3">
											<c:choose>
												<c:when test="${login != 'null' }">
													<input class="form-control" name="inputId" type="text"
														placeholder="name@example.com" value="${id }" /> <label for="inputId">학번 / 사번 입력</label>
												</c:when>
												<c:otherwise>
													<input class="form-control" name="inputId" type="text"
														placeholder="name@example.com" /> <label for="inputId">학번 / 사번 입력</label>
												</c:otherwise>
											</c:choose>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" name="inputPwd" type="password"
												placeholder="Password" /> <label for="inputPwd">비밀번호 입력</label>
										</div>
										<div class="form-check mb-3">
											<c:choose>
												<c:when test="${login != null }">
													<input class="form-check-input" id="rememberId" name="rememberId"
														type="checkbox" checked="checked"/> <label class="form-check-label"
														for="rememberId">학번 / 사번 저장</label>
												</c:when>
												<c:otherwise>
													<input class="form-check-input" id="rememberId" name="rememberId"
														type="checkbox"/> <label class="form-check-label"
														for="rememberId">학번 / 사번 저장</label>
												</c:otherwise>
											</c:choose>
										</div>
										<div
											class="d-flex align-items-center justify-content-between mt-4 mb-0">
											<a class="small" href="findAccount">아이디 / 비밀번호 찾기</a> 
											<input type = "submit" class="btn btn-primary" value = "로그인">
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="col-lg-13" style="margin-left: 0; width: 30%; height: 100%;">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">학 사 일 정</h3>
								</div>
								<div class="card-body">
									<ul
										style="font-size: 13pt; padding-top: 3%;">
										<li style="padding-bottom: 1.5%;">8/2 하계 계절수업 종강</li>
										<li style="padding-bottom: 1.5%;">8/12 대학원 후기모집 신입생 등록</li>
										<li style="padding-bottom: 1.5%;">8/9 하계 계절수업 성적제출</li>
										<li style="padding-bottom: 1.5%;">8/10~17 2학기 수강신청</li>
										<li style="padding-bottom: 1.5%;">8/23~27 2학기 재학생 등록</li>
										<li style="padding-bottom: 1.5%;">8/27 후기 학위수여식</li>
										<li style="padding-bottom: 1.5%; list-style: none;"><a href="/root/board/schedule">more</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>

			</main>
		</div>
		<c:import url="../default/footer.jsp" />
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
</body>
</html>
