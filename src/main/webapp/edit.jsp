<%--
/**
 * Copyright (c) 2000-2013 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<jsp:useBean class="java.lang.String" id="addNameURL" scope="request" />

<portlet:defineObjects />

<form id="<portlet:namespace />helloForm" action="<%= addNameURL %>" method="post">
	<table>
		<tr>
			<td>Name:</td>
			<td><input type="text" name="username"></td>
		</tr>
	</table>
	<input type="submit" id="nameBtn" title="Add Name" value="Add Name">
</form>