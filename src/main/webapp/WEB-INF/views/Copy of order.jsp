<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>在线预约</title>

<jsp:include page="js_css.jsp"></jsp:include>
<link href="${pageContext.request.contextPath}/css/order.css" type="text/css" rel="stylesheet">

<script type="text/javascript">
//		$(function(){
//			$("#divshow2").hide();
//			$("#li1").click(function(){
//				$("#divshow1").show();
//				$("#divshow2").hide();
//			});
//			$("#li2").click(function(){
//				$("#divshow1").hide();
//				$("#divshow2").show();
//			});
//		});


    </script>

</head>
<body>
	<form id="aspnetForm" action="order.aspx?id=1" method="post" name="aspnetForm">
		<div>
			<input type="hidden"
				value="/wEPDwUKLTkxOTE5ODU3NA9kFgJmD2QWAgIDD2QWBGYPFgIeC18hSXRlbUNvdW50AgIWBGYPZBYCZg8VAgExDOeOr+eQg+a4r+W6l2QCAQ9kFgJmDxUCATIJ5peX6Iiw5bqXZAIBDxYCHwACAhYEZg9kFgRmDxUBATFkAgEPFgIfAAIDFgZmD2QWAmYPFQMBMQnmtLvkurrlopMP6LaK54ux6Kej6L+357G7ZAIBD2QWAmYPFQMBMgrlk4bllaZB5qKmD+aDheS+o+S6suWtkOexu2QCAg9kFgJmDxUDATMM5aWz546L5a+G5L2/D+WboumYn+WQiOS9nOexu2QCAQ9kFgRmDxUBATJkAgEPFgIfAAIEFghmD2QWAmYPFQMBNAzlpbPnjovlr4bkvb8P5Zui6Zif5ZCI5L2c57G7ZAIBD2QWAmYPFQMBNQzonKHnrJTlsI/mlrAP5oOF5L6j5Lqy5a2Q57G7ZAICD2QWAmYPFQMBNg/li4fpl6/po5/kurrlspsP5o6i57Si5o+t56eY57G7ZAIDD2QWAmYPFQMBNw/mg4rlpKnprZTnm5flm6IP6Zi06LCL54qv572q57G7ZGTY6gFEH0RdVv8Dyp8GWr+bppNMxw=="
				id="__VIEWSTATE" name="__VIEWSTATE">
		</div>

		<div>

			<input type="hidden" value="D58C601F" id="__VIEWSTATEGENERATOR" name="__VIEWSTATEGENERATOR">
		</div>
		<div id="leftBar">
			<div class="popwin">
				<div id="tabs11">
					<ul>


						<li style="font-size: 18px; margin: 0 20px; float: left; font-weight: normal"><a style="cursor: url('../images/handCursor.cur'), pointer;" href="#divshopShow1"> 环球港店 </a></li>

						<li style="font-size: 18px; margin: 0 20px; float: left; font-weight: normal"><a style="cursor: url('../images/handCursor.cur'), pointer;" href="#divshopShow2"> 旗舰店 </a></li>

					</ul>
					<div class="popwin-close">
						<input type="button" title="关闭窗口" value="" id="colse">
					</div>


					<div id="divshopShow1" class="popwin-inner">
						<div class="table-overflow mCustomScrollbar _mCS_1" style="overflow: hidden;">
							<div style="position: relative; height: 100%; overflow: hidden; max-width: 100%; max-height: 450px;" id="mCSB_1" class="mCustomScrollBox mCS-dark-thick">
								<div style="position: relative; top: 0;" class="mCSB_container mCS_no_scrollbar">
									<div>
										<div>

											<div class="Ticket">
												<span href="1"> 活人墓
													<p>类型：越狱解迷类</p>
												</span>
											</div>

											<div class="Ticket">
												<span href="2"> 哆啦A梦
													<p>类型：情侣亲子类</p>
												</span>
											</div>

											<div class="Ticket">
												<span href="3"> 女王密使
													<p>类型：团队合作类</p>
												</span>
											</div>

										</div>
									</div>
								</div>
								<div style="position: absolute; display: none;" class="mCSB_scrollTools">
									<a oncontextmenu="return false;" class="mCSB_buttonUp"></a>
									<div class="mCSB_draggerContainer">
										<div oncontextmenu="return false;" style="position: absolute; top: 0px;" class="mCSB_dragger">
											<div style="position: relative;" class="mCSB_dragger_bar"></div>
										</div>
										<div class="mCSB_draggerRail"></div>
									</div>
									<a oncontextmenu="return false;" class="mCSB_buttonDown"></a>
								</div>
							</div>
						</div>
					</div>

					<div id="divshopShow2" class="popwin-inner">
						<div class="table-overflow mCustomScrollbar _mCS_2" style="overflow: hidden;">
							<div style="position: relative; height: 100%; overflow: hidden; max-width: 100%; max-height: 450px;" id="mCSB_2" class="mCustomScrollBox mCS-dark-thick">
								<div style="position: relative; top: 0;" class="mCSB_container mCS_no_scrollbar">
									<div>
										<div>

											<div class="Ticket">
												<span href="4"> 女王密使
													<p>类型：团队合作类</p>
												</span>
											</div>

											<div class="Ticket">
												<span href="5"> 蜡笔小新
													<p>类型：情侣亲子类</p>
												</span>
											</div>

											<div class="Ticket">
												<span href="6"> 勇闯食人岛
													<p>类型：探索揭秘类</p>
												</span>
											</div>

											<div class="Ticket">
												<span href="7"> 惊天魔盗团
													<p>类型：阴谋犯罪类</p>
												</span>
											</div>

										</div>
									</div>
								</div>
								<div style="position: absolute; display: none;" class="mCSB_scrollTools">
									<a oncontextmenu="return false;" class="mCSB_buttonUp"></a>
									<div class="mCSB_draggerContainer">
										<div oncontextmenu="return false;" style="position: absolute; top: 0px;" class="mCSB_dragger">
											<div style="position: relative;" class="mCSB_dragger_bar"></div>
										</div>
										<div class="mCSB_draggerRail"></div>
									</div>
									<a oncontextmenu="return false;" class="mCSB_buttonDown"></a>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>

			<script>
            
            function doPopWin()
            {
            popwin();
            }
	$(function() {
		$("#choose").click(doPopWin);
		$("#colse").click(closewin);
		
		$(".table-overflow&gt;div&gt;div&gt;div&gt;span").click(function() {
               location = "order.aspx?id="+ $(this).attr("href");
            });
	  });
            </script>

			<!-- InstanceEndEditable -->
			<div class="shadow"></div>
			<div onclick="window.location = 'index.aspx'">
				<a style="cursor: url('../images/handCursor.cur'), pointer;" href="/"> <img src=".${pageContext.request.contextPath}/images/logo.jpg"></a>
			</div>
			<div id="leftNav">
				<div class="" id="choose">
					<i id="left1Icon"></i><span>预约购票</span>
				</div>
				<div onclick="window.location = 'story.aspx'">
					<i id="left2Icon"></i><span>背景故事</span>
				</div>
				<div onclick="window.location = 'findus.aspx'">
					<i id="left4Icon"></i><span>找到我们</span>
				</div>
				<div onclick="window.location = 'join.aspx'">
					<i id="left5Icon"></i><span>加盟连锁</span>
				</div>
			</div>
			<div id="leftUser">
				<div id="leftLoginTitle">预约查询</div>
				<div id="leftLoginForm" style="display: none;">
					<input type="text" maxlength="45" name="SignForm[name]" placeholder="手机号码" class="roundInput" id="signinNameInput" title="手机号码"> <input type="password" maxlength="30" name="SignForm[password]" placeholder="初始密码为手机后4位" class="roundInput" id="signinPassInput" title="登录密码">
					<div style="margin-left: 10px; float: left">
						<div class="icheckbox_flat-blue checked" style="position: relative;">
							<input type="checkbox" id="rememberInput" name="SignForm[remember]" checked="checked" style="position: absolute; opacity: 0;">
							<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins>
						</div>
						<label for="rememberInput" id="rememberLabel">下次自动登录</label>
					</div>
					<div onclick="doSubmit()" class="smallButton ilb">登 录</div>


				</div>
				<div id="logedUser" style="display: none;">
					<div id="leftUserLinkBox">
						<span id="leftUserName"></span> <br> <span onclick="window.location = 'usercenter.aspx';" class="leftUserLink">个人管理</span> <span onclick="doLogout();" id="leftUserLogout" class="leftUserLink">退出登录</span>
					</div>
				</div>
				<div class="clearfloat"></div>
				<hr>
			</div>
		</div>

		<script>
                
                function doLogout()
                {
                 $.ajax({
        url: "loaddata.aspx",
        data: {
        a : 'logout'
        },
        dataType: "json",
        success: function(ret) {
            if(ret.isError)
            {
                alert(ret.msg);
            }else{
                $.cookie("uname",null,{path:"/",expires: -1 }); 
                $.cookie("pass",null,{path:"/",expires: -1 }); 
                window.location.reload();
            }
        },
        error: function(ret) {
            alert("登出失败。");
            return false;
        }
        });
                }
	function doSubmit()
	{
	    $.ajax({
        url: "loaddata.aspx",
        data: {
        a : 'login',
        u : $("#signinNameInput").val(),
        p : $("#signinPassInput").val() 
        },
        dataType: "json",
        success: function(ret) {
            if(ret.isError)
            {
                alert(ret.msg);
            }else{
                if($("#rememberInput").attr("checked")=="checked"){
                var expiresDate = 365 * 10;
                   
                    $.cookie('uname',$("#signinNameInput").val(),{path:"/",expires : expiresDate});
                    $.cookie('pass',$("#signinPassInput").val(),{path:"/",expires : expiresDate});
                }
                $("#leftLoginForm").hide();
                $("#leftUserName").html(ret.uname);
                $("#logedUser").show();
                
                 window.location = 'usercenter.aspx';
                
            }
        },
        error: function(ret) {
            alert("登录失败。");
            return false;
        }
        });
    }
    //如果用户已经登陆
    if(""=="1"){
      $("#logedUser").show();
      $("#leftLoginForm").hide();
      $('#leftLoginTitle').unbind("click");
      $("#leftLoginTitle").click(function()
     {
     window.location = 'usercenter.aspx';
     }
     );
    }else{
      $("#logedUser").hide();
      $("#leftLoginForm").hide();
     
      if($.cookie('uname')!= undefined &amp;&amp; $.cookie('uname')!="" ){
      
       $("#signinNameInput").val($.cookie('uname'));
       $("#signinPassInput").val($.cookie('pass'));
       doSubmit();
      }
      
     $("#leftLoginTitle").click(function()
     {
     $("#leftLoginForm").show();
     }
     );
    }
    
        </script>

		<div>


			<script>document.createElement("hi");document.createElement("i");</script>
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
									<span class="sel" year="2015">6-22<br><spring:message code="T_SUNDAY" /></span>
									<span class="" year="2015">6-23<br><spring:message code="T_MONDAY" /></span>
									<span class="" year="2015">6-24<br><spring:message code="T_TUESDAY" /></span>
									<span class="" year="2015">6-25<br><spring:message code="T_WEDNESDAY" /></span>
									<span class="" year="2015">6-26<br><spring:message code="T_THURSDAY" /></span>
									<span class="" year="2015">6-27<br><spring:message code="T_FRIDAY" /></span>
									<span class="" year="2015">6-28<br><spring:message code="T_SATURDAY" /></span>
									<span class="arrow-right"><a onclick="LoadDate(this);"><i class="fa fa-chevron-right"></i></a></span>
								</div>
							</div>
							<div style="display: none" id="divLoading">正在加载...</div>
							<div id="bookTable">
								<div id="bookTimetable">
									<div class="ilb time">
										<hi>1</hi>
										<hi>8</hi>
										<hi>6</hi>
										<hi>4</hi>
										<hi>0</hi>
										<p class="time12">0:30</p>
										<span class="nonclick">已过期</span>
									</div>
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

			<style>
.ui-dialog .ui-state-error {
	padding: .3em;
}

.validateTips {
	border: 1px solid transparent;
	padding: 0.3em;
}
</style>


			<script>
    $(function() {
            $("#dialog-form").dialog({
                autoOpen: false,
                height: 500,
                width: 350,
                modal: true,
                buttons: {
                    "确认预约": function() {
                        var bValid = true;
                        
                        var name = $("#name");
                        
                        var tel = $("#tel");
                        
                        var ticketno = $("#txtTicketNo");
                        
                        var note = $("#note");
                        
                        var allFields = $( [] ).add( name ).add( tel ).add( ticketno );
                        allFields.removeClass("ui-state-error");
                        
                        //alert($("#roomCalList&gt;span[class*=\"sel\"]").html());
                        bValid = bValid &amp;&amp; checkRequied( name, "联系人" );
                        bValid = bValid &amp;&amp; checkRequied( tel, "电话" );
                        if(!bValid)
                        {
                            return false;
                        }
                        bValid = bValid &amp;&amp; checkMaxLength( name, "联系人",10 );
                        bValid = bValid &amp;&amp; checkMaxLength( tel, "电话",11 );
                        if(!bValid)
                        {
                            return false;
                        }
                        if(tel.val().length!=11){
                            tel.addClass( "ui-state-error" );
                            updateTips("电话必须是11位的手机号");
                            return false;
                        }
                        //选择的是现场支付
                        var sCheckId = $("#radio :radio:checked").attr('id');
                        var sPT = "1";
                        if(sCheckId == "radio1")
                        {
                            sPT = "1";
                        }else if (sCheckId == "radio2")
                        {//选择的是密券支付
                            bValid = bValid &amp;&amp; checkRequied( ticketno, "密券号" );
                            bValid = bValid &amp;&amp; checkMaxLength( ticketno, "密券号",36 );
                            
                            sPT = "2";
                        }else if (sCheckId == "radio3")
                        {//选择的是密券支付
                            
                            sPT = "3";
                        }
                        
                        

                        //画面初步验证通过
                        if (bValid) {
                            //提示人数选择
                            var maxgroup =  parseInt($("#seatList").attr("maxgroupcnt"));
                            var mingroup =  parseInt($("#seatList").attr("mingroupcnt"));
                            var ordered =  parseInt($("#seatList").attr("ordered"));
                            
                            var ucnt =   parseInt($("#currentPurchaseCount").html());
                           
                            
                            if( (ordered+ucnt) &lt; mingroup ){
                                if(confirm("提示：本场游戏可能会与其他玩家共同游戏，若您不愿意拼团，请购买包场票或召集更多的小伙伴一起前来。") == false){
                                    return false;
                                }
                            }
                            //提交后台验证
                             $.ajax({
                                url: "loaddata.aspx",
                                data: {
                                    a : 'order',
                                    m : v_m_mid,
                                    s : v_m_stageid ,
                                    d : v_m_date ,
                                    u : name.val(),
                                    n : note.val(),
                                    t : tel.val(),
                                    tn: ticketno.val(),
                                    pt:sPT,
                                    c: ucnt,
                                    p: $("#amount").html(),
                                    tt:v_m_relid,
                                    td: (new Date()).valueOf()
                                },
                                dataType: "json",
                                success: function(ret) {
                                    if(ret.isError)
                                    {
                                        alert(ret.msg);
                                    }else{
                                        
                                        if(ret.html != undefined){
                                            var sInfo = "预约成功！\r\n更改或取消预约，需至少提前3小时致电门店。距开场不足3小时的场次，不能更改或取消。请知悉！\r\n您的预约信息可以登陆后在个人管理中心查看。\r\n用户名为您的手机号\r\n密码为手机号的后4位。"; $("#dialog-form").dialog("close");
                                            sInfo += "\r\n亲爱的玩家，请在15分钟内完成支付，若逾期未支付，预约将会被取消。"
                                            alert(sInfo);
                                            $("#divHiddenHtml").html(ret.html);}
                                        else{
                                            alert("预约成功！\r\n更改或取消预约，需至少提前3小时致电门店。距开场不足3小时的场次，不能更改或取消。请知悉！\r\n您的预约信息可以登陆后在个人管理中心查看。\r\n用户名为您的手机号\r\n密码为手机号的后4位。");
                                            $("#dialog-form").dialog("close");
                                            //日期重新点击一次
                                            $("#roomCalList&gt;span[class*=\"sel\"]").click();
                                        }
                                    }
                                   
                                },
                                error: function(ret) {
                                   alert("预约失败");
                                   $("#dialog-form").dialog("close");
                                        //日期重新点击一次
                                        $("#roomCalList&gt;span[class*=\"sel\"]").click();
                                }
                            });
                            
                            
                        }
                    },
                    Cancel: function() {
                        $(this).dialog("close");
                    }
                },
                close: function() {
                   // allFields.val("").removeClass("ui-state-error");
                }
            });
            $("#buyButton").click(function() {
                $("#dialog-form").dialog("open");
            });

            $("#tabs").tabs({
                beforeLoad: function(event, ui) {
                    ui.jqXHR.error(function() {
                        ui.panel.html("加载失败，请稍后重试。");
                    });
                }
            });
        });


        function DoStageClick()
        {
         $('#bookTimetable&gt;div[class*="clickable"]:first').click();
        }
        function bindDateClick() {
            var $items = $('#roomCalList&gt;span');
            $items.click(function() {
                $items.removeClass('sel');
                $(this).addClass('sel');
                v_m_date = $(this).attr("year") +"-"+ $(this).html().split('&lt;')[0];
                $("#ticketTypeBox").show();
            $("#seatList").show();
                loadOrders($(this).attr("year"),this.childNodes[0].data);
            });

        }

        function bindPlusMinClick() {
            var $items = $('#seatList&gt;span');

            $items.click(function() {
               doPlusMin(this);
            });
            
            $("#btnMin").click(function() {
               doPlusMin(this);
            });
            $("#btnPlus").click(function() {
               doPlusMin(this);
            });
        }
        
        function doPlusMin(obj)
        {
            if(v_m_relid=="2")return false;
            var max = parseInt($("#seatList").attr("maxcount"));
            var cur = parseInt($("#currentPurchaseCount").html());
            if ($(obj).hasClass("forAdd")) {
                if ((cur + 1) &lt;= max) {
                    calcRealPrice(cur+1);
                    $("#currentPurchaseCount").html("" + (cur + 1));
                    $("#usercount").html("" + (cur + 1));
                }
            } else {
                if ((cur - 1) &gt;= 1) {
                    calcRealPrice(cur-1);
                    $("#currentPurchaseCount").html("" + (cur - 1));
                    $("#usercount").html("" + (cur - 1));
                }
            }
        }
        function calcRealPrice(newc)
        {
          //数量
          var c = $("#currentPurchaseCount").html();
         
          //现价
          var nowPrice = $("#realPrice").html().substr(1);
            
            var u = parseInt(nowPrice)/parseInt(c);
            
             $("#realPrice").html("￥"+(u*newc));
             $("#amount").html((u*newc));
            
        }

        function bindStageClick() {
            var $items = $('#bookTimetable&gt;div');

            $items.click(function() {
            
            if(!$(this).hasClass("clickable")){
                return false
            }
                $items.removeClass('sel');

                $(this).addClass('sel');
                setTickets(this);
            });

        }
        function bindTicketTypeClick() {
            var $items = $('#ticketTypeBox&gt;div');

            $items.click(function() {
                $items.removeClass('sel');
                $(this).addClass('sel');
                ChangeTicketType();
                //setTickets(this.childNodes[0].data);
            });

        }
        function ChangeTicketType()
        {
           var newRel = $("#ticketTypeBox&gt;div[class*=\"sel\"]").attr("relid");
           if(v_m_relid==newRel)
           {
                return false;
           }
           
         $('#bookTimetable&gt;div').each(function(i,n){
               
              if($(n.lastChild).html()!=="已过期" &amp;&amp; $(n.lastChild).html()!=="已售完"){
                
            
              
              
               if(newRel == "1")
               {
                    //普通票
                    if(n.children[1].innerHTML != "0")
                    {
                         $(n).addClass('clickable');
                         
                        //&lt;p style="margin-top: 4px"&gt;余票：&lt;b&gt;5&lt;/b&gt;张&lt;/p&gt;
                        $(n.lastChild).prev().html("余票：&lt;b&gt;"+n.children[1].innerHTML+"&lt;/b&gt;张");
                          $(n.lastChild).show();
                    }
                    
               }else if(newRel =="2")
               {
                    //包场票
                    if(v_m_max == n.children[1].innerHTML)
                    {
                        
                    }else{
                    //不能包场
                    $(n).removeClass('sel');
                         $(n).removeClass('clickable');
                         //&lt;span class="nonclick"&gt;余票 2，不能包场&lt;/span&gt;
                         $(n.lastChild).prev().html("余票 "+n.children[1].innerHTML+"，不能包场");
                          $(n.lastChild).hide();
                    }
               }
               
               }
               
        });
           
          
        v_m_relid = newRel;
           
        var o=  $("#bookTimetable&gt;div[class*=\"sel\"]");
            if(o.length!=0)
            {
            o.click();
            }else{
            $("#bookTimetable&gt;div[class*=\"clickable\"]:first").click();
            }
        }
        bindDateClick();
        bindStageClick();
        bindTicketTypeClick();
        bindPlusMinClick();
        //第一个日期选中
        DoStageClick();
        // $("#roomCalList&gt;span")[0].attributes["class"].click();
        $("#roomCalList&gt;span:first").addClass("sel");
        
        
        var v_m_mid = "1";
        var v_m_max = "8";
        var v_m_stageid = "0";
        var v_m_date = "2015-6-22";
        var v_m_relid = "1";
        
        ChangeTicketType();
        function setTickets(stg) {
            //不能点击的时候退出
            if(!$(stg).hasClass("clickable")){
                return false
            }
            //余票
            var max = stg.children[1].innerHTML;
            //原价
            var oldPrice = stg.lastChild.children[0].innerHTML;
            //现价
            var nowPrice = stg.lastChild.children[1].innerHTML.substr(1);
            //场次ID
            var stageid=stg.children[0].innerHTML;

            $("#seatList").attr("maxcount",max);
            
            $("#seatList").attr("maxgroupcnt",stg.children[2].innerHTML);
            $("#seatList").attr("mingroupcnt",stg.children[3].innerHTML);
            $("#seatList").attr("ordered",stg.children[4].innerHTML);


            $("#remainIndicator&gt;strong").html(max);
            var iDc = 1;
            if(v_m_relid=="1"){
                iDc = 1;
            }else if(v_m_relid=="2"){
                iDc = parseInt(v_m_max);
            }
            $("#currentPurchaseCount").html(iDc);
            
            $("#usercount").html(iDc);
            nowPrice = parseInt(nowPrice)*iDc;
            $("#orgPrice").html(oldPrice);
            $("#realPrice").html("￥"+nowPrice);
             $("#amount").html(nowPrice);
            v_m_stageid = stageid;
        }
        function ClearOrderTicket() {

            $("#bookTimetable").html("");
            $("#ticketTypeBox").hide();
            $("#seatList").hide();
        }
        function LoadDate(b) {
            var wk = b.children[1].innerHTML;

            v_m_date = $(b).attr("year")+"-"+wk;
            
            $.ajax({
                url: "loaddata.aspx",
                data: {
                    a: 'loaddate',
                    d: wk,
                    td: (new Date()).valueOf()
                },
                dataType: "json",
                success: function(ret) {

                    $("#roomCalList").html(ret.html);
                    ClearOrderTicket();
                    bindDateClick();
                },
                error: function(ret) {

                }
            });

        }
        
        function loadOrders(year,dt) {

            $("#divLoading").show();
            $("#bookTable").hide();

            $.ajax({
                url: "loaddata.aspx",
                data: {
                    a: 'loadstage',
                    date: dt,
                    year:year,
                    id: v_m_mid,
                    td: (new Date()).valueOf()
                },
                dataType: "json",
                success: function(ret) {

                    $("#bookTimetable").html(ret.html);
                    bindStageClick();
                    $("#divLoading").hide();
                    $("#bookTable").show();
                    DoStageClick();
                },
                error: function(ret) {

                    $("#bookTimetable").html("");
                    $("#divLoading").hide();
                }
            });
        }
    </script>


		</div>
	</form>
	<div style="text-align: center; color: #fff; font-size: 18px; position: fixed; bottom: 0px; left: 40%">
		<a href="http://www.miibeian.gov.cn/">沪ICP备10217145号</a> COPYRIGHT@2014上海润麟实业有限公司
	</div>


	<div class="ui-dialog ui-widget ui-widget-content ui-corner-all ui-front ui-dialog-buttons ui-draggable ui-resizable" style="display: none; position: absolute;" tabindex="-1" role="dialog" aria-describedby="dialog-form" aria-labelledby="ui-id-1">
		<div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
			<span id="ui-id-1" class="ui-dialog-title">预约信息</span>
			<button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only ui-dialog-titlebar-close" role="button" aria-disabled="false" title="close">
				<span class="ui-button-icon-primary ui-icon ui-icon-closethick"></span><span class="ui-button-text">close</span>
			</button>
		</div>
		<div id="dialog-form" class="ui-dialog-content ui-widget-content">
			<p class="validateTips"></p>
			<fieldset>

				<label for="usercount"> 人数</label> <a id="btnMin"><input type="button" class="btn_min" name=""></a><span id="usercount">1</span><a class="forAdd" id="btnPlus"><input type="button" class="btn_plus" name=""></a><br> <label for="amount"> 总金额:</label> <span id="amount">58</span> <br> <label for="name"> 联系人</label> <input type="text" class="text ui-widget-content ui-corner-all" maxlength="10" id="name" name="name"><br> <label for="tel"> 电话&#12288;</label> <input
					type="text" class="text ui-widget-content ui-corner-all" maxlength="11" value="" id="tel" name="tel"><br>
				<div id="radio">

					<div class="iradio_flat-blue checked" style="position: relative;">
						<input type="radio" checked="checked" name="radio" id="radio3" style="position: absolute; opacity: 0;">
						<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins>
					</div>
					<label for="radio3">支付宝</label> <input type="text" style="width: 240px; margin: 5px auto; display: none;" maxlength="36" id="txtTicketNo">
				</div>
				<textarea placeholder="备注：在此输入您的特殊要求" rows="4" id="note" name="note" class="text ui-widget-content ui-corner-all"></textarea>
				<div id="divHiddenHtml" style="display: block"></div>
				<label for="note"> 更改或取消预约，需至少提前3小时致电门店。距开场不足3小时的场次，不能更改或取消。请知悉！</label>
			</fieldset>




		</div>
		<div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix">
			<div class="ui-dialog-buttonset">
				<button type="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" role="button" aria-disabled="false">
					<span class="ui-button-text">确认预约</span>
				</button>
				<button type="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" role="button" aria-disabled="false">
					<span class="ui-button-text">Cancel</span>
				</button>
			</div>
		</div>
		<div class="ui-resizable-handle ui-resizable-n" style="z-index: 90;"></div>
		<div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div>
		<div class="ui-resizable-handle ui-resizable-s" style="z-index: 90;"></div>
		<div class="ui-resizable-handle ui-resizable-w" style="z-index: 90;"></div>
		<div class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se" style="z-index: 90;"></div>
		<div class="ui-resizable-handle ui-resizable-sw" style="z-index: 90;"></div>
		<div class="ui-resizable-handle ui-resizable-ne" style="z-index: 90;"></div>
		<div class="ui-resizable-handle ui-resizable-nw" style="z-index: 90;"></div>
	</div>
</body>
</html>