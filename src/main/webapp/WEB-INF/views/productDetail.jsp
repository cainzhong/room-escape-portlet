<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Online Shopping - Product Detail</title>
<link rel='stylesheet' href='css/custom.css' type="text/css">
<jsp:include page="resourceInclude.jsp"/>
</head>
<body class="">
	<jsp:include page="header.jsp"/>

	<div class="container">
		<h1>Product Detail</h1>
		<input type="submit" onclick="buyNow()" value="Buy Now!">
	</div>
	
	<jsp:include page="footer.jsp"/>
</body>
<script type="text/javascript">
$(function(){
	function buyNow(){
		var loginUser = $('#loginUser').firstChild.val();
		if(loginUser =="" || loginUser == null){
			alert("Please log in first!")
		}else{
			// invoke the controller 'buy.do'
		}
	}
});
</script>
</html>