<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>中华英才网登陆页面</title>
</head>
<link rel='stylesheet' href='css/lottery-custom.css' type="text/css">
<jsp:include page="resourceInclude.jsp"/>
<body style="background: url('img/login-background.jpg') no-repeat fixed top">
	<jsp:include page="header.jsp"/>
	<div class="login">
		<c:if test="${not empty error}">
			<div class="errorMessage">
				<c:out value="${error}" />
			</div>
		</c:if>
		<form action="<c:url value="/login.do" />" method="post">
			<label class="loginLabel"><spring:message code="T_LOGIN" /></label>
			<br>
			<div>
				<label class="label"><spring:message code="T_USER_NAME" /></label>
				<br>
				<input class="input" type="text" name="userName" />
				<span class="error"><spring:message code="T_INVALID_USER_NAME" /></span>
			</div>
			<div>
				<label class="label"><spring:message code="T_PASSWORD" /></label>
				<br>
				<input class="input" type="password" name="password"/>
			</div>
			<div>
				<input class="loginBtn" type="submit" value="<spring:message code="T_LOGIN" />" style="background-color: green;"/>
				<input class="loginBtn" type="button" value="<spring:message code="T_REGISTER" />" style="background-color: blue;" />
			</div>	
		</form>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
<script type="text/javascript">
$(document).ready(function() {
	$('.error').hide();
	$('.loginBtn').click(function(event){
		var data=$('.input').val();
		if(valid_email(data)||valid_phoneno(data))
		{
			$('.error').hide();
		}
		else
		{
			$('.error').show();
			return false;
		}
	});
});

function valid_email(email)
{
	var pattern=new RegExp(/^(?:\w+\.?)*\w+@(?:\w+\.)*\w+$/);
	return pattern.test(email);
}

function valid_phoneno(ph)
{
	var pattern=new RegExp(/^[0-9-+]+$/);
	return pattern.test(ph);
}
</script>
</html>