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
			<table id="basicInfo">
				<thead>
					<tr>
						<th colspan=3>基本资料</th>
						<th><input id="basicInfoEditBtn" type="button" value="Edit"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>真实姓名</td>
						<td id="realName"><c:out value="${user.realName}" /></td>
						<td>英文名</td>
						<td id="englishName"><c:out value="${user.englishName}" /></td>
					</tr>
					<tr>
						<td>所在地区</td>
						<td id="currentCountry"><c:out value="${user.currentCountry}" /> <c:out value="${user.currentCity}" /></td>
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
						<td id="webchat"><c:out value="${qq}" /></td>
					</tr>
				</tbody>
			</table>
			<div id="basicInfoSubmit" class="hide tableBtn">
				<input type="button" value="Submit"> <input type="button" value="Cancel">
			</div>

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
							<td><c:out value="${personalHistory.universityDegree.degree}" /></td>
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
							<td><c:if test="${awards.type.identify eq 0}">
									<c:out value="${awards.description}" />
								</c:if></td>
							<td colspan=2></td>
						</tr>
						<tr>
							<td>论文专著</td>
							<td><c:if test="${awards.type.identify eq 1}">
									<c:out value="${awards.description}" />
								</c:if></td>
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
	$(document).ready(function() {

		$("#basicInfoEditBtn").attr("disabled", false);

		//edit profile
		$("#basicInfoEditBtn").click(function() {
			var oddTD = $("#basicInfo tbody td:odd");
			oddTD.each(function() {
				var inputobj = $("<input type='text'>");
				var tdobj = $(this);
				var text = tdobj.html();
				tdobj.html("");
				inputobj.css("border", "0").css("font-size", tdobj.css("font-size")).css("font-family", tdobj.css("font-family")).css("background-color", tdobj.css("background-color")).css("color", "#C75F3E").width(tdobj.width()).val(text).appendTo(tdobj);
			});
			$("#basicInfoEditBtn").attr("disabled", true);
			$("#basicInfoSubmit").css("display", "block");
		});

		// submit profile
		$('#basicInfoSubmit').click(function() {
			// invoke the controller through ajax 
			$.ajax({
				type : 'POST',
				url : 'editIndProfile.do',
				dataType : "text",
				data : {
					"realName" : $("#realName :first-child").val(),
					"englishName" : $("#englishName :first-child").val(),
					"currentCountry" : $("#currentCountry :first-child").val(),
					"email" : $("#email :first-child").val(),
					"telephone" : $("#telephone :first-child").val(),
					"qq" : $("#qq :first-child").val(),
					"webchat" : $("#webchat :first-child").val()
				},
				success : function(data) {
					$("#basicInfoEditBtn").attr("disabled", false);
					$("#basicInfoSubmit").css("display", "none");
					var oddTD = $("#basicInfo tbody td:odd");
					var realName = $("#realName :first-child").val();
					var englishName = $("#englishName :first-child").val();
					var currentCountry = $("#currentCountry :first-child").val();
					var email = $("#email :first-child").val();
					var telephone = $("#telephone :first-child").val();
					var qq = $("#qq :first-child").val();
					var webchat = $("#webchat :first-child").val();
					oddTD.each(function() {
						var tdobj = $(this);
						tdobj.empty();
					});
					$("#realName").html(realName);
					$("#englishName").html(englishName);
					$("#currentCountry").html(currentCountry);
					$("#email").html(email);
					$("#telephone").html(telephone);
					$("#qq").html(qq);
					$("#webchat").html(webchat);
					alert("success");
				},
				error : function(data) {
					$("#basicInfoEditBtn").attr("disabled", false);
					$("#basicInfoSubmit").css("display", "none");
					alert("error");
				}
			});
		});

		// submit profile
		/* $('#basicInfoSubmit').click(function() {
			// invoke the controller through ajax 
			$.ajax({
				type : 'POST',
				url : 'editIndProfile.do',
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				data : JSON.stringify(getJsonDataForBasicInfoTable()),
				success : function(data) {
					$("#basicInfoEditBtn").attr("disabled", false);
					$("#basicInfoSubmit").css("display", "none");
					alert("success");
				},
				error : function(data) {
					$("#basicInfoEditBtn").attr("disabled", false);
					$("#basicInfoSubmit").css("display", "none");
					alert("error");
				}
			});
		}); */

		function getJsonDataForBasicInfoTable() {
			var json = {
				"realName" : $("#realName :first-child").val(),
				"englishName" : $("#englishName :first-child").val(),
				"currentCountry" : $("#currentCountry :first-child").val(),
				"email" : $("#email :first-child").val(),
				"telephone" : $("#telephone :first-child").val(),
				"qq" : $("#qq :first-child").val(),
				"webchat" : $("#webchat :first-child").val(),
			};
			return json;
		}

	});
</script>
</html>