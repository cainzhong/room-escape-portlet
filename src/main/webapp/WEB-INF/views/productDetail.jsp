<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Online Shopping - Product Detail</title>
<link rel='stylesheet' href='css/custom.css' type="text/css">
<jsp:include page="resourceInclude.jsp" />
</head>
<body class="">
	<jsp:include page="header.jsp" />

	<div class="container">
		<h1>Product Detail</h1>
		<input type="text" id="userAccounId">
		<input id="buyProduct" type="submit" value="Buy Now!">
	</div>

	<jsp:include page="footer.jsp" />
</body>
<script type="text/javascript">
	$(function() {

		/* 	var loginUser = $('#loginUser').firstChild.val();
		if(loginUser =="" || loginUser == null){
			alert("Please log in first!")
		}else{ 
		 */
		$('#buyProduct').click(function() {
			// invoke the controller through ajax 
			var userAccountId = $("#userAccounId").val();
			$.ajax({
				type : 'POST',
				dataType : 'text',
				url : 'buy.do',
				data : {
					userAccountId : userAccountId
				},
				success : function(data) {
					alert(data);
				},
				error : function() {
					alert("error");
				}
			});
		});


	});
</script>
</html>