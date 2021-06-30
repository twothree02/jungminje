<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
  
 <style type="text/css">
 .wrap{/* border: 1px solid black; */ width:1000px; height:900px; margin: auto; }
 </style>
    </head>
    <body>
    <c:set var="conetxtPath" value="<%=request.getContextPath()%>" />
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
<<<<<<< HEAD

                <a class="navbar-brand" href="${contextPath}/root/main">YW University</a>

=======
                <a class="navbar-brand" href="${contextPath}/root/main">YW University</a>
>>>>>>> hw
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">

                        <li class="nav-item"><a class="nav-link" href="${contextPath}/root/student/totalInquiry">종합정보조회</a></li>
                        <li class="nav-item"><a class="nav-link" href="${contextPath}/root/student/classRequest">수강신청</a></li>
                        <li class="nav-item"><a class="nav-link" href="${contextPath}/root/student/gradeInquiry">성적조회</a></li>
                        <li class="nav-item"><a class="nav-link" href="${contextPath}/root/student/tuitionChk">등록금관리</a></li>
         
                    </ul>
                </div>
            </div>
        </nav>

</body>
</html>