<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        
        <title>Full Width Pics - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/asset/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/cs/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="/root/main">YW University</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                       
           
  
                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/professor/show_myInfo">종합정보조회</a></li>
                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/professor/all_student">
                        학생정보</a></li>
                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/professor/show_grade">
                        성적 입력</a></li>
                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/professor/time_table">시간표</a></li>
                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/professor/staff_network">연락망</a></li>
                    </ul>
                </div>
            </div>
            <div>
            	<a class="nav-link" href="<%=request.getContextPath()%>/logout" style="color: white; float: right;">로그아웃</a>
            </div>
        </nav>
</body>
</html>
