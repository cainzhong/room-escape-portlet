<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<body>
	<h1>HTTP Status 403 - Access is denied</h1>
	
	<c:choose>
		<c:when test="${pageContext.request.userPrincipal.name} == null">
			<h2>You do not have permission to access this page!</h2>
		</c:when>
		<c:otherwise>
			<h2>Username : ${pageContext.request.userPrincipal.name} <br/>You do not have permission to access this page!</h2>
			<div><a href="../login.do">Sign Out</a></div>
		</c:otherwise>
	</c:choose>

</body>
</html>