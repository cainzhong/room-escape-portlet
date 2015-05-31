<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>中华海外人才网</title>
<jsp:include page="../resourceInclude.jsp" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/individual.js"></script>
</head>
<body class="">
	<jsp:include page="../header.jsp" />

	<div class="container">
		<div>
			<em>Name & Navigation</em>
		</div>

		<c:set var="username" value="${pageContext.request.userPrincipal.name}" />
		<div>
			<span id="username" class="hide"><c:out value="${username}" /></span>
		</div>

		<div class="content">
			<table id="basic_info">
				<thead>
					<tr>
						<th colspan=3>基本资料</th>
						<th><a id="basic_info_edit_btn"><i class="fa fa-pencil-square-o"></i></a></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>真实姓名</td>
						<td id="real_name"><c:out value="${user.realName}" /></td>
						<td>英文名</td>
						<td id="english_name"><c:out value="${user.englishName}" /></td>
					</tr>
					<tr>
						<td>所在地区</td>
						<td id="current_region">
							<div id="current_region_view">
								<span class="current_country_view"><spring:message code="${user.currentCountry}" /></span><span class="current_city"> - <spring:message code="${user.currentCity}" /></span>
							</div>
							<div id="current_region_edit" class="hide">
								<select class="current_country_edit">
									<c:forEach items="${countries}" var="country">
										<option value="<c:out value="${country.key}" />"><c:out value="${country.value}" /></option>
									</c:forEach>
								</select>
								<c:forEach items="${citiesCountry}" var="cityCountry">
									<select class="current_city_edit ${cityCountry.key}">
										<%-- ${cityCountry.value}为第一层map的值 --%>
										<c:forEach var="secondMap" items="${cityCountry.value}">
											<option value="<c:out value="${secondMap.key}" />"><c:out value="${secondMap.value}" /></option>
										</c:forEach>
									</select>
								</c:forEach>
							</div>
						</td>
						<td>邮箱地址</td>
						<td id="email"><c:out value="${email}" /></td>
					</tr>
					<tr>
						<td>手机号码</td>
						<td id="telephone"><c:out value="${telephone}" /></td>
						<td>QQ号码</td>
						<td id="qq"><c:out value="${qq}" /></td>
					</tr>
					<tr>
						<td>微信号</td>
						<td id="webchat"><c:out value="${webchat}" /></td>
					</tr>
				</tbody>
			</table>
			<div id="basic_info_submit" class="hide table_btn">
				<a id="basic_info_submit_btn"><i class="fa fa-check"></i></a><a name="cancel_btn"><i class="fa fa-times"></i></a>
			</div>

			<c:forEach items="${personalHistories}" var="personalHistory">
				<table class="personal_history" id="personal_history_table${personalHistory.id}">
					<thead>
						<tr>
							<th colspan=3>学历资料</th>
							<th>
								<a name="personal_history_edit_btn"><i class="fa fa-pencil-square-o"></i></a>
								<a><i class="fa fa-plus"></i></a>
								<span class="hide"><c:out value="${personalHistory.id}" /></span>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>毕业学校</td>
							<td class="university"><c:out value="${personalHistory.university}" /></td>
							<td>所在专业</td>
							<td class="major"><c:out value="${personalHistory.major}" /></td>
						</tr>
						<tr>
							<td>学历</td>
							<td class="university_degree"><spring:message code="${personalHistory.universityDegree.degree}" /></td>
							<td>毕业年份</td>
							<td class="graduation_year"><c:out value="${personalHistory.graduationYear}" /></td>
						</tr>
					</tbody>
				</table>
				<div id="personal_history_submit${personalHistory.id}" class="hide table_btn">
					<a name="personal_history_submit_btn${personalHistory.id}"><i class="fa fa-check"></i></a><a name="cancel_btn"><i class="fa fa-times"></i></a>
				</div>
			</c:forEach>

			<table id="awards">
				<thead>
					<tr>
						<th colspan=3>获得荣誉</th>
					</tr>
				</thead>
				<c:forEach items="${awards}" var="award">
					<tbody>
						<c:if test="${award.type.identify eq 0}">
							<tr id="award_tr${award.id}">
								<td>荣誉称号</td>
								<td class="award_type"><spring:message code="${award.type.type}" /></td>
								<td class="award_description"><c:out value="${award.description}" /></td>
								<td><a name="award_edit_btn"><i class="fa fa-pencil-square-o"></i></a><a><i class="fa fa-plus"></i></a>
									<div class="award_submit hide">
										<a name="award_submit_btn"><i class="fa fa-check"></i></a><a name="cancel_btn"><i class="fa fa-times"></i></a>
									</div> <span class="hide"><c:out value="${award.id}" /></span></td>
							</tr>
						</c:if>

						<c:if test="${award.type.identify eq 1}">
							<tr id="award_tr${award.id}">
								<td>论文专著</td>
								<td class="award_type"><spring:message code="${award.type.type}" /></td>
								<td class="award_description"><c:out value="${award.description}" /></td>
								<td><a name="award_edit_btn"><i class="fa fa-pencil-square-o"></i></a><a><i class="fa fa-plus"></i></a>
									<div class="award_submit hide">
										<a name="award_submit_btn"><i class="fa fa-check"></i></a><a name="cancel_btn"><i class="fa fa-times"></i></a>
									</div> <span class="hide"><c:out value="${award.id}" /></span></td>
							</tr>
						</c:if>
						<c:if test="${award.type.identify eq 2}">
							<tr id="award_tr${award.id}">
								<td>INTELLECTUAL PROPERTY</td>
								<td class="award_type"><spring:message code="${award.type.type}" /></td>
								<td class="award_description"><c:out value="${award.description}" /></td>
								<td><a name="award_edit_btn"><i class="fa fa-pencil-square-o"></i></a><a><i class="fa fa-plus"></i></a>
									<div class="award_submit hide">
										<a name="award_submit_btn"><i class="fa fa-check"></i></a><a name="cancel_btn"><i class="fa fa-times"></i></a>
									</div> <span class="hide"><c:out value="${award.id}" /></span></td>
							</tr>
						</c:if>
						<c:if test="${award.type.identify eq 3}">
							<tr id="award_tr${award.id}">
								<td><c:if test="${empty award.other}">
										其他
									</c:if> <c:if test="${not empty award.other}">
										${award.other}
									</c:if></td>
								<td class="award_type"><spring:message code="${award.type.type}" /></td>
								<td class="award_description"><c:out value="${award.description}" /></td>
								<td><a name="award_edit_btn"><i class="fa fa-pencil-square-o"></i></a><a><i class="fa fa-plus"></i></a>
									<div class="award_submit hide">
										<a name="award_submit_btn"><i class="fa fa-check"></i></a><a name="cancel_btn"><i class="fa fa-times"></i></a>
									</div> <span class="hide"><c:out value="${award.id}" /></span></td>
							</tr>
						</c:if>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</div>

	<div id="dialog-success" title="Confirm" class="hide">
		<p>The data has been updated successfully.</p>
	</div>

	<div id="dialog-error" title="Confirm" class="hide">
		<p>The data can not be updated! Please try again.</p>
	</div>

	<div id="dialog-ajax-error" title="Ajax Error" class="hide">
		<p>The data can not be retrived from serve! Please try again.</p>
	</div>

	<jsp:include page="../footer.jsp" />

</body>
<script type="text/javascript">
	$(document).ready(function() {

		$("a[name='cancel_btn']").click(function() {
			location.reload();
		});

		$("#dialog-success").dialog({
			modal : true,
			autoOpen : false,
			resizable : false,
			width : 480,
			height : 200,
			buttons : {
				"Ok" : function() {
					location.reload();
				},
				"Cancel" : function() {
					$(this).dialog('close');
				}
			}
		});

		$("#dialog-error").dialog({
			modal : true,
			autoOpen : false,
			resizable : false,
			width : 480,
			height : 200,
			buttons : {
				"Ok" : function() {
					location.reload();
				},
				"Cancel" : function() {
					$(this).dialog('close');
				}
			}
		});

		$("#dialog-ajax-error").dialog({
			modal : true,
			autoOpen : false,
			resizable : false,
			width : 480,
			height : 200,
			buttons : {
				"Ok" : function() {
					location.reload();
				},
				"Cancel" : function() {
					$(this).dialog('close');
				}
			}
		});
	});
</script>
</html>