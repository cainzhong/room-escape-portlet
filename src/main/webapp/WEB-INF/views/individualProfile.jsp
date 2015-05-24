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
		
		<c:set var="username" value="email@email.com" />
		<div><span id="username"><c:out value="${username}" /></span></div>
		
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
						<td id="webchat"><c:out value="${webchat}" /></td>
					</tr>
				</tbody>
			</table>
			<div id="basicInfoSubmit" class="hide tableBtn">
				<input id="basicInfoSubmitBtn" type="button" value="Submit"> <input type="button" value="Cancel">
			</div>

			<table id="personalHistories">
				<thead>
					<tr>
						<th colspan=3>学历资料</th>
						<th><input id="personalHistoriesEditBtn" type="button" value="Edit"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${personalHistories}" var="personalHistory">
						<tr>
							<td>毕业学校</td>
							<td id="university"><c:out value="${personalHistory.university}" /></td>
							<td>所在专业</td>
							<td id="major"><c:out value="${personalHistory.major}" /></td>
						</tr>
						<tr>
							<td>学历</td>
							<td id="universityDegree"><c:out value="${personalHistory.universityDegree.degree}" /></td>
							<td>毕业年份</td>
							<td id="graduationYear"><c:out value="${personalHistory.graduationYear}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div id="personalHistoriesSubmit" class="hide tableBtn">
				<input id="personalHistoriesSubmitBtn" type="button" value="Submit"> <input type="button" value="Cancel">
			</div>

			<table id="awards">
				<thead>
					<tr>
						<th colspan=3>获得荣誉</th>
						<th><input id="awardsEditBtn" type="button" value="Edit"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${awardsList}" var="awards">
						<tr>
							<td>荣誉称号</td>
							<td id="honoraryTitle"><c:if test="${awards.type.identify eq 0}">
									<c:out value="${awards.description}" />
								</c:if></td>
							<td colspan=2></td>
						</tr>
						<tr>
							<td>论文专著</td>
							<td id="thesis"><c:if test="${awards.type.identify eq 1}">
									<c:out value="${awards.description}" />
								</c:if></td>
							<td colspan=2></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div id="awardsSubmit" class="hide tableBtn">
				<input id="awardsSubmitBtn" type="button" value="Submit"> <input type="button" value="Cancel">
			</div>
			
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
		$('#basicInfoSubmitBtn').click(function() {
			// invoke the controller through ajax 
			$.ajax({
				type : 'POST',
				url : 'editIndProfile.do',
				dataType : "text",
				data : {
					"username" : $("#username").val(),
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
					oddTD.each(function() {
						var tdobj = $(this);
						var tdval = tdobj.children(":first").val();
						tdobj.empty();
						tdobj.html(tdval);
					});
					alert("success");
				},
				error : function(data) {
					$("#basicInfoEditBtn").attr("disabled", false);
					$("#basicInfoSubmit").css("display", "none");
					var oddTD = $("#basicInfo tbody td:odd");
					oddTD.each(function() {
						var tdobj = $(this);
						var tdval = tdobj.children(":first").val();
						tdobj.empty();
						tdobj.html(tdval);
					});
					alert("error");
				}
			});
		});
		
		//edit personal histories.
		$("#personalHistoriesEditBtn").click(function() {
			var oddTD = $("#personalHistories tbody td:odd");
			oddTD.each(function() {
				var inputobj = $("<input type='text'>");
				var tdobj = $(this);
				var text = tdobj.html();
				tdobj.html("");
				inputobj.css("border", "0").css("font-size", tdobj.css("font-size")).css("font-family", tdobj.css("font-family")).css("background-color", tdobj.css("background-color")).css("color", "#C75F3E").width(tdobj.width()).val(text).appendTo(tdobj);
			});
			$("#personalHistoriesEditBtn").attr("disabled", true);
			$("#personalHistoriesSubmit").css("display", "block");
		});

		// submit personal histories.
		$('#personalHistoriesSubmitBtn').click(function() {
			// invoke the controller through ajax 
			$.ajax({
				type : 'POST',
				url : 'editPerHistory.do',
				dataType : "text",
				data : {
					"username" : $("#username").val(),
					"university" : $("#university :first-child").val(),
					"major" : $("#major :first-child").val(),
					"universityDegree" : $("#universityDegree :first-child").val(),
					"graduationYear" : $("#graduationYear :first-child").val()
				},
				success : function(data) {
					$("#personalHistoriesEditBtn").attr("disabled", false);
					$("#personalHistoriesSubmit").css("display", "none");
					var oddTD = $("#personalHistories tbody td:odd");
					oddTD.each(function() {
						var tdobj = $(this);
						var tdval = tdobj.children(":first").val();
						tdobj.empty();
						tdobj.html(tdval);
					});
					alert(data);
				},
				error : function(data) {
					$("#personalHistoriesEditBtn").attr("disabled", false);
					$("#personalHistoriesSubmit").css("display", "none");
					var oddTD = $("#personalHistories tbody td:odd");
					oddTD.each(function() {
						var tdobj = $(this);
						var tdval = tdobj.children(":first").val();
						tdobj.empty();
						tdobj.html(tdval);
					});
					alert("error");
				}
			});
		});
		
		//edit personal histories.
		$("#awardsEditBtn").click(function() {
			var oddTD = $("#awards tbody td:odd");
			oddTD.each(function() {
				var inputobj = $("<input type='text'>");
				var tdobj = $(this);
				var text = tdobj.html();
				tdobj.html("");
				inputobj.css("border", "0").css("font-size", tdobj.css("font-size")).css("font-family", tdobj.css("font-family")).css("background-color", tdobj.css("background-color")).css("color", "#C75F3E").width(tdobj.width()).val(text).appendTo(tdobj);
			});
			$("#awardsEditBtn").attr("disabled", true);
			$("#awardsSubmit").css("display", "block");
		});
		
		// submit awards
		$('#awardsSubmitBtn').click(function() {
			// invoke the controller through ajax 
			$.ajax({
				type : 'POST',
				url : 'editAward.do',
				dataType : "text",
				data : {
					"username" : $("#username").val(),
					"honoraryTitle" : $("#honoraryTitle :first-child").val(),
					"thesis" : $("#thesis :first-child").val()
				},
				success : function(data) {
					$("#awardsEditBtn").attr("disabled", false);
					$("#awardsSubmit").css("display", "none");
					var oddTD = $("#awards tbody td:odd");
					oddTD.each(function() {
						var tdobj = $(this);
						var tdval = tdobj.children(":first").val();
						tdobj.empty();
						tdobj.html(tdval);
					});
					alert("success");
				},
				error : function(data) {
					$("#awardsEditBtn").attr("disabled", false);
					$("#awardsSubmit").css("display", "none");
					var oddTD = $("#awards tbody td:odd");
					oddTD.each(function() {
						var tdobj = $(this);
						var tdval = tdobj.children(":first").val();
						tdobj.empty();
						tdobj.html(tdval);
					});
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