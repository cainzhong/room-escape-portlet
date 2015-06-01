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

		<c:url var="addPersonalHistory" value="/individual/addPersonalHistory">
			<c:param name="username" value="${username}" />
		</c:url>

		<c:url var="addAward" value="/individual/addAward">
			<c:param name="username" value="${username}" />
		</c:url>

		<div>
			<c:out value="${pageContext.request.contextPath}" />
			<c:out value="${pageContext.request.serverName}" />
		</div>

		<div class="content">
			<table id="basic_info">
				<thead>
					<tr>
						<th colspan=3>基本资料</th>
						<th class="fa-hover"><a id="basic_info_edit_btn"><i class="fa fa-pencil-square-o"></i></a></th>
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
				<a id="basic_info_submit_btn" class="fa-hover"><i class="fa fa-check"></i></a><a name="cancel_btn"><i class="fa fa-times"></i></a>
			</div>

			<c:forEach items="${personalHistories}" var="personalHistory">
				<table class="personal_history" id="personal_history_table${personalHistory.id}">
					<thead>
						<tr>
							<th colspan=3><spring:message code="T_PERSONAL_HISTORY_ACADEMIC_INFO" /></th>
							<th class="fa-hover"><a name="personal_history_edit_btn"><i class="fa fa-pencil-square-o"></i></a> <a name="personal_history_add_btn"><i class="fa fa-plus"></i></a> <span class="hide"><c:out value="${personalHistory.id}" /></span></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><spring:message code="T_PERSONAL_HISTORY_GRADUATED_UNIVERSITY" /></td>
							<td class="university"><c:out value="${personalHistory.university}" /></td>
							<td><spring:message code="T_PERSONAL_HISTORY_MAJOR" /></td>
							<td class="major"><c:out value="${personalHistory.major}" /></td>
						</tr>
						<tr>
							<td><spring:message code="T_PERSONAL_HISTORY_UNIVERSITY_DEGREE" /></td>
							<td class="university_degree"><spring:message code="${personalHistory.universityDegree.degree}" /></td>
							<td><spring:message code="T_PERSONAL_HISTORY_GRADUATION_YEAR" /></td>
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
								<td class="fa-hover"><a name="award_edit_btn"><i class="fa fa-pencil-square-o"></i></a><a name="award_add_btn"><i class="fa fa-plus"></i></a>
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
								<td class="fa-hover"><a name="award_edit_btn"><i class="fa fa-pencil-square-o"></i></a><a name="award_add_btn"><i class="fa fa-plus"></i></a>
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
								<td class="fa-hover"><a name="award_edit_btn"><i class="fa fa-pencil-square-o"></i></a><a name="award_add_btn"><i class="fa fa-plus"></i></a>
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
								<td class="fa-hover"><a name="award_edit_btn"><i class="fa fa-pencil-square-o"></i></a><a name="award_add_btn"><i class="fa fa-plus"></i></a>
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

	<p id="back-to-top">
		<a href="#top" title="回到顶部"><i class="fa fa-chevron-circle-up fa-2x"></i></a>
	</p>

	<div id="dialog-success" title="Confirm" class="hide">
		<p>The data has been updated successfully.</p>
	</div>

	<div id="dialog-error" title="Confirm" class="hide">
		<p>The data can not be updated! Please try again.</p>
	</div>

	<div id="dialog-ajax-error" title="Ajax Error" class="hide">
		<p>The data can not be retrived from serve! Please try again.</p>
	</div>

	<div id="dialog_add_personal_history" title="<spring:message code="T_PERSONAL_HISTORY_ACADEMIC_INFO" />" class="hide">
		<form class="personal_history" id="add_personal_history" method="post" action="${addPersonalHistory}">
			<fieldset>
				<div class="dialog_row">
					<label for="university"><spring:message code="T_PERSONAL_HISTORY_GRADUATED_UNIVERSITY" /></label> <input class="university" name="university" />
				</div>
				<div class="dialog_row">
					<label for="major"><spring:message code="T_PERSONAL_HISTORY_MAJOR" /></label> <input class="major" name="major" />
				</div>
				<div class="dialog_row">
					<label for="university_degree"><spring:message code="T_PERSONAL_HISTORY_UNIVERSITY_DEGREE" /></label>
					<div class="university_degree"></div>
				</div>
				<div class="dialog_row">
					<label for="graduation_year"><spring:message code="T_PERSONAL_HISTORY_GRADUATION_YEAR" /></label>
					<div class="graduation_year"></div>
				</div>
				<input class="submit" type="submit" value="<spring:message code='T_SUBMIT' />"> <input class="reset" type="reset" value="<spring:message code='T_RESET' />">
			</fieldset>
		</form>
	</div>

	<div id="dialog_add_award" title="<spring:message code="T_PERSONAL_HISTORY_ACADEMIC_INFO" />" class="hide">
		<form class="personal_history" id="add_award" method="post" action="${addAward}">
			<fieldset>
				<div class="dialog_row">
					<label for="award_type"><spring:message code="T_AWARD_TYPE" /></label>
					<div class="award_type"></div>
				</div>
				<div class="dialog_row">
					<label for="award_description"><spring:message code="T_AWARD_DESCRIPTION" /></label> <input class="award_description" name="award_description" />
				</div>
				<input class="submit" type="submit" value="<spring:message code='T_SUBMIT' />"> <input class="reset" type="reset" value="<spring:message code='T_RESET' />">
			</fieldset>
		</form>
	</div>

	<jsp:include page="../footer.jsp" />

</body>
<script type="text/javascript">
	$(document).ready(function() {

		$("#dialog_add_personal_history").dialog({
			modal : true,
			autoOpen : false,
			resizable : false,
			width : 480,
			height : 260
		});

		$("#dialog_add_award").dialog({
			modal : true,
			autoOpen : false,
			resizable : false,
			width : 480,
			height : 260
		});

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

		//首先将#back-to-top隐藏
		$("#back-to-top").hide();
		//当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失
		$(function() {
			$(window).scroll(function() {
				if ($(window).scrollTop() > 100) {
					$("#back-to-top").fadeIn(1500);
				} else {
					$("#back-to-top").fadeOut(1500);
				}
			});
			//当点击跳转链接后，回到页面顶部位置
			$("#back-to-top").click(function() {
				$('body,html').animate({
					scrollTop : 0
				}, 10);
				return false;
			});
		});
	});
</script>
</html>