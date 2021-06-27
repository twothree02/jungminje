<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>
	<c:choose>
		<c:when test="${login != null}">
			Session
			<form action = "logout" method = "GET">
				<input type = "submit" value ="logout">
			</form>
		</c:when>
		<c:otherwise>
			No Session
		</c:otherwise>
	</c:choose>
</body>
</html>
