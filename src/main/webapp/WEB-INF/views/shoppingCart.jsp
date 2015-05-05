<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Shopping Cart</title>
</head>
<link rel='stylesheet' href='css/main.css' type="text/css">
<script language=javascript src='/js/main.js'></script>
<script language=javascript src='js/jquery-2.1.3.min.js'></script>
<body>
	<table>
		<tr>
			<th><input type="checkbox" id="itemCheckBoxAll" />All</th>
			<th>Product</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Total</th>
			<th>Operation</th>
		</tr>
		<c:forEach items="${orderedItemList}" var="orderedItem"
			varStatus="status">
			<tr>
				<td><input type="checkbox" id="itemCheckBox${status.index}" />${status.index}</td>
				<td>${orderedItem.product.name}</td>
				<td>${orderedItem.product.price}</td>
				<td>${orderedItem.orderdQuantity}</td>
				<td>total</td>
				<td>delete</td>
			</tr>
		</c:forEach>
	</table>
	
<script type="text/javascript">
$(document).ready(function(){
	$("#itemCheckBoxAll").change(function() {
	//	if ($(this).attr("checked") == true) {
		if(this.checked){
			//select all
			$("input[type=checkbox]").each(function() {
				$(this).attr("checked", true);
			});
		} else {
		// cancel select all
			$("input[type=checkbox]").each(function() {
				$(this).attr("checked", false);
			});
		}
	});
});
</script>
</body>
</html>