<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Lottery Login</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
<link rel='stylesheet' href='css/screen.css' type="text/css">
<script>
$.validator.setDefaults({
	submitHandler: function() {
		alert("submitted!");
	}
});

$().ready(function() {
	// validate the comment form when it is submitted
	$("#commentForm").validate();
});

</script>
</head>

<body>
	<h1 id="banner"><a href="http://jqueryvalidation.org/">jQuery Validation Plugin</a> Demo</h1>
<div id="main">
	<p>Default submitHandler is set to display an alert into of submitting the form</p>
	<form class="cmxform" id="commentForm" method="get" action="">
		<fieldset>
			<legend>Please provide your name, email address (won't be published) and a comment</legend>
			<p>
				<label for="cname">Name (required, at least 2 characters)</label>
				<input id="cname" name="name" minlength="2" type="text" required>
			</p>
			<p>
				<label for="cemail">E-Mail (required)</label>
				<input id="cemail" type="email" name="email" required>
			</p>
			<p>
				<label for="curl">URL (optional)</label>
				<input id="curl" type="url" name="url">
			</p>
			<p>
				<label for="ccomment">Your comment (required)</label>
				<textarea id="ccomment" name="comment" required></textarea>
			</p>
			<p>
				<input class="submit" type="submit" value="Submit">
			</p>
		</fieldset>
	</form>
</div>
</body>
</html>