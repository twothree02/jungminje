<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../default/studentheader.jsp" />
        <!-- Header - set the background image for the header in the line below-->
        <header class="py-5 bg-image-full" style="background-image: url('https://source.unsplash.com/wfh8dDlNFOk/1600x900')">
            <div class="text-center my-5">
                <img class="img-fluid rounded-circle mb-4" src="/root/resources/img/5.jpg" alt="..." />
                <h1 class="text-white fs-3 fw-bolder">YW university</h1>
                <p class="text-white-50 mb-0">since 2000 / 09 / 18</p>
            </div>
        </header>
        <h1 align="center" style = "margin-top: 30px;">YW 대학에 오신걸 환영합니다</h1>
  
        	<c:import url="../default/footer.jsp"></c:import>
        
</body>
</html>