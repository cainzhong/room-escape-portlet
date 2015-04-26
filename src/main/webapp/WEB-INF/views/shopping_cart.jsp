<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Shopping Cart</title>
</head>
<link rel='stylesheet' href='css/main.css' type="text/css">
<body>
	<table>
		<tr>
			<th>Select All</th>
			<th>Product</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Total</th>
			<th>Operation</th>
		</tr>
		<c:forEach items="${orderedItemList}" var="orderedItem">
			<tr>
				<td>selectAll</td>
				<td>${orderedItem.product.name}</td>
				<td>${orderedItem.product.price}</td>
				<td>${orderedItem.orderdQuantity}</td>
				<td>total</td>
				<td>delete</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>