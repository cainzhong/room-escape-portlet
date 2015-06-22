<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>在线预约</title>

<jsp:include page="js_css.jsp"></jsp:include>
<link href="${pageContext.request.contextPath}/css/order.css" type="text/css" rel="stylesheet">

</head>
<body>
	<div>
		<div style="margin-left: 220px" id="divCalander">
			<div id="divMissionName">
				<h>活人墓</h>
			</div>
			<div style="width: 580px; border: 1px solid #554433" id="tabs" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
				<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all" role="tablist">
					<li class="ui-state-default ui-corner-top ui-tabs-active ui-state-active" role="tab" tabindex="0" aria-controls="tab1" aria-labelledby="ui-id-2" aria-selected="true"><a href="#tab1" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-2">预约信息</a></li>
					<li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="ui-tabs-1" aria-labelledby="ui-id-3" aria-selected="false"><a href="phisic/missionBG1.html" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-3">场景截图</a></li>
				</ul>
				<div id="tab1" aria-labelledby="ui-id-2" class="ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" aria-expanded="true" aria-hidden="false">
					<div id="divDates">
						<div id="roomCalList">
							<span class="arrow-left"><a><i class="fa fa-chevron-left"></i></a></span> 
							<c:forEach items="${dayWeekMap}" var="dayWeek">
								<c:set var="dayValue" value="${dayWeek.value}" />
								<span id="<c:out value="${dayWeek.value}" />"><c:out value="${fn:substring(dayValue, 5, 10)}" /><br><spring:message code="${dayWeek.key}" /></span> 
							</c:forEach>
							<span class="arrow-right"><a onclick="LoadDate(this);"><i class="fa fa-chevron-right"></i></a></span>
						</div>
					</div>
					<div style="display: none" id="divLoading">正在加载...</div>
					<div id="bookTable">
						<div id="bookTimetable">
							<c:forEach items="${tickets}" var="ticket">
								<div class="ilb time">
									<p class="time12"><c:out value="${ticket.time}" /></p>
									<c:if test="${ticket.status.identify eq 2}">
									<span class="nonclick">已售完</span>
									</c:if>
									<c:if test="${ticket.status.identify eq 1}">
										<span class="nonclick">已过期</span>
									</c:if>
									<c:if test="${ticket.status.identify eq 0}">
										<p style="margin-top: 4px">余票：<b><c:out value="${ticket.quantity}" /></b>张</p>
										<p>现价：<i>58</i><strong>￥58</strong>	</p>
									</c:if>
								</div>
							</c:forEach>
							<div class="ilb time">
								<hi>2</hi>
								<hi>8</hi>
								<hi>6</hi>
								<hi>4</hi>
								<hi>0</hi>
								<p class="time12">1:45</p>
								<span class="nonclick">已过期</span>
							</div>
							<div class="ilb time">
								<hi>3</hi>
								<hi>8</hi>
								<hi>6</hi>
								<hi>4</hi>
								<hi>0</hi>
								<p class="time12">3:00</p>
								<span class="nonclick">已过期</span>
							</div>
							<div class="ilb time">
								<hi>8</hi>
								<hi>8</hi>
								<hi>6</hi>
								<hi>4</hi>
								<hi>0</hi>
								<p class="time12">10:00</p>
								<span class="nonclick">已过期</span>
							</div>
							<div class="ilb time">
								<hi>9</hi>
								<hi>8</hi>
								<hi>6</hi>
								<hi>4</hi>
								<hi>0</hi>
								<p class="time12">11:00</p>
								<span class="nonclick">已过期</span>
							</div>
							<div class="ilb time">
								<hi>10</hi>
								<hi>8</hi>
								<hi>6</hi>
								<hi>4</hi>
								<hi>0</hi>
								<p class="time12">12:00</p>
								<span class="nonclick">已过期</span>
							</div>
							<div class="ilb time">
								<hi>11</hi>
								<hi>0</hi>
								<hi>6</hi>
								<hi>4</hi>
								<hi>6</hi>
								<p class="time12">13:15</p>
								<span class="nonclick">已售完</span>
							</div>
							<div class="ilb time clickable sel">
								<hi>12</hi>
								<hi>8</hi>
								<hi>6</hi>
								<hi>4</hi>
								<hi>0</hi>
								<p class="time12">14:30</p>
								<p style="margin-top: 4px">
									余票：<b>8</b>张
								</p>
								<p>
									现价：<i>58</i><strong>￥58</strong>
								</p>
							</div>
							<div class="ilb time clickable">
								<hi>13</hi>
								<hi>8</hi>
								<hi>6</hi>
								<hi>4</hi>
								<hi>0</hi>
								<p class="time12">15:45</p>
								<p style="margin-top: 4px">
									余票：<b>8</b>张
								</p>
								<p>
									现价：<i>58</i><strong>￥58</strong>
								</p>
							</div>
							<div class="ilb time clickable">
								<hi>14</hi>
								<hi>8</hi>
								<hi>6</hi>
								<hi>4</hi>
								<hi>0</hi>
								<p class="time12">17:00</p>
								<p style="margin-top: 4px">
									余票：<b>8</b>张
								</p>
								<p>
									现价：<i>58</i><strong>￥58</strong>
								</p>
							</div>
							<div class="ilb time clickable">
								<hi>15</hi>
								<hi>8</hi>
								<hi>6</hi>
								<hi>4</hi>
								<hi>0</hi>
								<p class="time12">18:15</p>
								<p style="margin-top: 4px">
									余票：<b>8</b>张
								</p>
								<p>
									现价：<i>58</i><strong>￥58</strong>
								</p>
							</div>
							<div class="ilb time clickable">
								<hi>16</hi>
								<hi>8</hi>
								<hi>6</hi>
								<hi>4</hi>
								<hi>0</hi>
								<p class="time12">19:30</p>
								<p style="margin-top: 4px">
									余票：<b>8</b>张
								</p>
								<p>
									现价：<i>58</i><strong>￥58</strong>
								</p>
							</div>
							<div class="ilb time clickable">
								<hi>17</hi>
								<hi>8</hi>
								<hi>6</hi>
								<hi>4</hi>
								<hi>0</hi>
								<p class="time12">20:45</p>
								<p style="margin-top: 4px">
									余票：<b>8</b>张
								</p>
								<p>
									现价：<i>58</i><strong>￥58</strong>
								</p>
							</div>
							<div class="ilb time clickable">
								<hi>18</hi>
								<hi>8</hi>
								<hi>6</hi>
								<hi>4</hi>
								<hi>0</hi>
								<p class="time12">22:00</p>
								<p style="margin-top: 4px">
									余票：<b>8</b>张
								</p>
								<p>
									现价：<i>58</i><strong>￥58</strong>
								</p>
							</div>
							<div class="ilb time clickable">
								<hi>19</hi>
								<hi>8</hi>
								<hi>6</hi>
								<hi>4</hi>
								<hi>0</hi>
								<p class="time12">23:15</p>
								<p style="margin-top: 4px">
									余票：<b>8</b>张
								</p>
								<p>
									现价：<i>58</i><strong>￥58</strong>
								</p>
							</div>
						</div>
						<div id="ticketTypeBox">
							<div class="ilb sel" relid="1">普通票</div>
							<div class="ilb" relid="2">包场票</div>
						</div>
						<div ordered="0" mingroupcnt="4" maxgroupcnt="6" maxcount="8" id="seatList">
							&nbsp; 购票数量：<span></span><b id="currentPurchaseCount">1</b><span class="forAdd"></span>总价：<b id="orgPrice">58</b><b id="realPrice">￥58</b>
							<div id="remainIndicator">
								（余<strong>8</strong>张）
							</div>
							<div class="button" id="buyButton">预约</div>
						</div>
					</div>
				</div>
				<div id="ui-tabs-1" class="ui-tabs-panel ui-widget-content ui-corner-bottom" aria-live="polite" aria-labelledby="ui-id-3" role="tabpanel" style="display: none;" aria-expanded="false" aria-hidden="true"></div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function getCurrentDate() {
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth();
		var day = date.getDate();
		month = month + 1;
		month < 10 ? month = ('0' + month) : month;
		day < 10 ? day = ('0' + day) : day;
		
		return year + '-' + month + '-' + day;
	}
	
	var current_date = getCurrentDate();
	$("#"+current_date).addClass("sel");
</script>
</html>