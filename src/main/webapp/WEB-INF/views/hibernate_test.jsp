<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Hibernate Test</title>
	
  <!-- stylesheets -->
    <link rel='stylesheet' href="${pageContext.request.contextPath}/css/main.css" type="text/css" />
    <!-- javascripts -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.3.min.js"></script>
    <!-- Only for debugging -->
    <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.3.js"></script> --%>
    
    
<script type="text/javascript">

</script>

</head>
<body>
    <div id="header" class="header">
    	<h1>Hibernate Testing</h1>
    </div>
    <div id="content" class="content">
        <table>
        	<tr>
        	<!-- if the value can not be retrieved through jstl, it's may be a issue caused by lombok, try to change the jre version to 1.7  -->
        	<c:forEach items="${userAccountList}" var="userAccount">
        		<td><c:out value="${userAccount.id}" /></td>
        		<td><c:out value="${userAccount.username}" /></td>
        		<td><c:out value="${userAccount.password}" /></td>
        	</c:forEach>
        	</tr>
        </table>
    </div>
    <div id="footer">
    	<jsp:include page="footer.jsp" />
    </div>
</body>
</html>
