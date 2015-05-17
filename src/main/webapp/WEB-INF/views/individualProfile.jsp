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
		//找到学号这一列的所有单元格 
		//因为学号这一列的单元格在所有td中的位置是偶数（0,2,4,6），所以通过even就可以筛选到td中偶数位的单元格 
		var numTd = $("#basicInfo tbody td:odd");
		//单击这些td时，创建文本框 
		numTd.click(function() {
			//创建文本框对象 
			var inputobj = $("<input type='text'>");
			//获取当前点击的单元格对象 
			var tdobj = $(this);
			//获取单元格中的文本 
			var text = tdobj.html();
			//如果当前单元格中有文本框，就直接跳出方法 
			//注意：一定要在插入文本框前进行判断 
			if (tdobj.children("input").length > 0) {
				return false;
			}
			//清空单元格的文本 
			tdobj.html("");
			inputobj.css("border", "0").css("font-size", tdobj.css("font-size")).css("font-family", tdobj.css("font-family")).css("background-color", tdobj.css("background-color")).css("color", "#C75F3E").width(tdobj.width()).val(text).appendTo(tdobj);
			inputobj.get(0).select();
			//阻止文本框的点击事件 
			inputobj.click(function() {
				return false;
			});
			//处理文本框上回车和esc按键的操作 
			//jQuery中某个事件方法的function可以定义一个event参数，jQuery会屏蔽浏览器的差异，传递给我们一个可用的event对象 
			inputobj.keyup(function(event) {
				//获取当前按键的键值 
				//jQuery的event对象上有一个which的属性可以获得键盘按键的键值 
				var keycode = event.which;
				//处理回车的情况 
				if (keycode == 13) {
					//获取当前文本框的内容 
					var inputtext = $(this).val();
					//将td的内容修改成文本框中的内容 
					tdobj.html(inputtext);
				}
				//处理esc的情况 
				if (keycode == 27) {
					//将td中的内容还原成text 
					tdobj.html(text);
				}
			});
		});
	});
</script>
</html>