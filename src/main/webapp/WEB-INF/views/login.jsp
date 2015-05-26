<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<title>中华英才网登陆页面</title>
<style>
.error {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1;
}

.msg {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #31708f;
	background-color: #d9edf7;
	border-color: #bce8f1;
}

#login-box {
	width: 300px;
	padding: 20px;
	margin: 100px auto;
	background: #fff;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border: 1px solid #000;
}
</style>
</head>
<jsp:include page="resourceInclude.jsp" />
<body>
	<spring:url var="authUrl" value="/j_spring_security_check.do" />

	<jsp:include page="header.jsp" />
	<div class="login">
		<c:if test="${not empty error}">
			<div class="errorMessage">
				<c:out value="${error}" />
			</div>
		</c:if>
		<form name='loginForm' action="${authUrl}" method='post'>
			<fieldset>
				<table>
					<tr>
						<th><label for="username_or_email"><spring:message code="T_USER_NAME" /></label></th>
						<td><input id="username_or_email" name="j_username" type="text" /></td>
					</tr>
					<tr>
						<th><label for="password"><spring:message code="T_PASSWORD" /></label></th>
						<td>
							<input id="password" name="j_password" type="password" />
							<small><a href="/account/resend_password" >Forget?</a></small>
						</td>
					</tr>
					<tr>
						<th></th>
						<td>
							<input id="remember_me" name="_spring_security_remember_me" type="checkbox" />
							<label for="remember_me" class="inline">Remember me</label>
						</td>
					</tr>
					<tr>
						<th></th>
						<td><input id="commit" type="submit" value="<spring:message code="T_LOGIN" />" /></td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>