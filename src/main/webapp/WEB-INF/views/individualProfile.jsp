<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>中华海外人才网</title>
<jsp:include page="resourceInclude.jsp" />
<link rel='stylesheet' href='css/custom.css' type="text/css">
</head>
<body class="">
	<jsp:include page="header.jsp" />

	<div class="container">
		<div>
			<em>Name & Navigation</em>
		</div>
		<div>
			<table>
				<thead>
					<tr>
						<th colspan=4>基本资料</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>真实姓名</td>
						<td><c:out value="${user.realName}" /></td>
						<td>英文名</td>
						<td><c:out value="${user.englishName}" /></td>
					</tr>
					<tr>
						<td>所在地区</td>
						<td><c:out value="${user.currentCountry}" /></td>
						<td>邮箱地址</td>
						<td><c:out value="${email}" /></td>
					</tr>
					<tr>
						<td>手机号码</td>
						<td><c:out value="${telephone}" /></td>
						<td>QQ号码</td>
						<td><c:out value="${telephone}" /></td>
					</tr>
					<tr>
						<td>微信号</td>
						<td></td>
					</tr>
				</tbody>
			</table>

			<table>
				<thead>
					<tr>
						<th colspan=4>学历资料</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${personalHistories}" var="personalHistory">
						<tr>
							<td>毕业学校</td>
							<td><c:out value="${personalHistory.university}" /></td>
							<td>所在专业</td>
							<td><c:out value="${personalHistory.major}" /></td>
						</tr>
						<tr>
							<td>学历</td>
							<td><c:out value="${personalHistory.universityDegree}" /></td>
							<td>毕业年份</td>
							<td><c:out value="${personalHistory.graduationYear}" /></td>
						</tr>
					</c:forEach>
				</tbody>
				
			</table>

			<table>
				<thead>
					<tr>
						<th colspan=4>获得荣誉</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${awardsList}" var="awards">
						<tr>
							<td>荣誉称号</td>
							<td>
								<%-- <c:if test="${awards.type eq 0}">
									<c:out value="${awards.description}" />
								</c:if> --%>
							</td>
							<td colspan=2></td>
						</tr>
						<tr>
							<td>论文专著</td>
							<td>
								<%-- <c:if test="${awards.type eq 1}">
									<c:out value="${awards.description}" />
								</c:if> --%>
							</td>
							<td colspan=2></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<jsp:include page="footer.jsp" />

</body>
<script type="text/javascript">
	
</script>
</html>