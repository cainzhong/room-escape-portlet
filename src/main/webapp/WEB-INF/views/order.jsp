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
									<span class="nonclick"><spring:message code="T_OUT_OF_STOCK" /></span>
									</c:if>
									<c:if test="${ticket.status.identify eq 1}">
										<span class="nonclick"><spring:message code="T_OUT_OF_DATE" /></span>
									</c:if>
									<c:if test="${ticket.status.identify eq 0}">
										<p style="margin-top: 4px"><spring:message code="T_REMAINING_TICKETS" /><b><c:out value="${ticket.quantity}" /></b><spring:message code="T_ZHANG" /></p>
										<p><spring:message code="T_CURRENT_PRICE" /><i><c:out value="${ticket.price}" /></i><strong><c:out value="${ticket.price}" /></strong>	</p>
									</c:if>
								</div>
							</c:forEach>
							</div>
						</div>
						<div id="ticketTypeBox">
							<div class="ilb" id="ticketType1">普通票</div>
							<div class="ilb" id="ticketType2">包场票</div>
						</div>
						<div id="seatList">
                            &nbsp; 购票数量：<span></span><b id="currentPurchaseCount">1</b>
                            <span class="forAdd"></span>总价：<b id="orgPrice">58</b><b id="realPrice">￥58</b><div id="remainIndicator">
                                  	  （余<strong>8</strong>张）</div>
                            <div id="buyButton" class="button">预约</div>
                        </div>
					</div>
				</div>
				<div id="ui-tabs-1" class="ui-tabs-panel ui-widget-content ui-corner-bottom" aria-live="polite" aria-labelledby="ui-id-3" role="tabpanel" style="display: none;" aria-expanded="false" aria-hidden="true"></div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	// select current day for the time bar.
	var current_date = getCurrentDate();
	$("#"+current_date).addClass("sel");
	
	// add css class 'clickable' for the tickets which can be sold.
	$("#bookTimetable .ilb.time").each(function(){
		var span_css = $(this).children("span").attr('class');
		if(span_css != "nonclick"){
			$(this).addClass("clickable");
		}
	});
	
	var current_selected_ticket = "";
	
	// add css class 'sel' for the first session which can be sold.
	$("#bookTimetable .ilb.time").each(function(){
		var span_css = $(this).children("span").attr('class');
		if(span_css != "nonclick"){
			current_selected_ticket = $(this);
			$(this).addClass("sel");
			// break the each loop.
			return false;
		}
	});
	
	
	// add css class 'sel' when a ticket is selected.
	$("#bookTimetable .ilb.time").each(function(){
		$(this).click(function(){
			current_selected_ticket.removeClass("sel");
			$(this).addClass("sel");
			current_selected_ticket = $(this);
		});
	});
	
	//TODO
	// select other day on date bar.
	$("#roomCalList span").each(function(){
		$(this).click(function(){
			var obj = $(this);
			$.ajax({
				type : 'POST',
				url : '/ajaxOrder',
				dataType : "text",
				data : {
					"ticketName" : 'T_CEMETERY_FOR_PERSONS_ALIVE',
					"date" : obj.attr('id')
				},
				success : function(data) {
					alert(success);
				},
				error : function(data) {
					alert(error);
				}
			});
		});
	});
	
	// default selected ticket type.
	$("#ticketType1").addClass("sel");
	
	$("#ticketType1").click(function(){
		$("#ticketType2").removeClass("sel");
		$("#ticketType1").addClass("sel");
		var price = current_selected_ticket.find("p i").text();
		$("#orgPrice").text(price);
		$("#realPrice").text(price);
		
	});
	
	$("#ticketType2").click(function(){
		$("#ticketType1").removeClass("sel");
		$("#ticketType2").addClass("sel");
		var num_tickets = current_selected_ticket.find("p b").text();
		var price = current_selected_ticket.find("p i").text();
		var total = num_tickets * price;
		$("#orgPrice").text(total);
		$("#realPrice").text(total);
	});
	
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

</script>
</html>