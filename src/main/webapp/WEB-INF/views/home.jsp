<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>密讯馆 -- 密室逃脱</title>

<script type="text/javascript" src="js/lib/jquery-1.8.2.min.js"></script>

<script type="text/javascript" src="js/lib/jquery.mousewheel-3.0.6.pack.js"></script>

<script type="text/javascript" src="js/lib/jquery-ui.js"></script>

<script type="text/javascript" src="js/lib/jquery.cookie.js"></script>

<script type="text/javascript" src="js/icheck/jquery.icheck.min.js"></script>

<script type="text/javascript" src="js/mCustomScrollbar/jquery.mCustomScrollbar.min.js"></script>

<script type="text/javascript" src="js/fancybox/jquery.fancybox.js"></script>

<script type="text/javascript" src="js/script.js"></script>

<link rel="stylesheet" type="text/css" href="css/core.css">
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/ui.css">
<link rel="stylesheet" type="text/css" href="js/icheck/skins/flat/blue.css">
<link rel="stylesheet" type="text/css" href="js/mCustomScrollbar/jquery.mCustomScrollbar.css">
<link rel="stylesheet" type="text/css" href="js/fancybox/jquery.fancybox.css">
<link rel="stylesheet" type="text/css" href="css/style.css">

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
<body style="background: url(http://www.mixunguan.com/images/index_bg.jpg);">
	<form name="aspnetForm" method="post" action="index.aspx" id="aspnetForm">
		<div>
			<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE"
				value="/wEPDwULLTEwMDUyNjYzMjgPZBYCZg9kFgICAw9kFgRmDxYCHgtfIUl0ZW1Db3VudAICFgRmD2QWAmYPFQIBMQznjq/nkIPmuK/lupdkAgEPZBYCZg8VAgEyCeaXl+iIsOW6l2QCAQ8WAh8AAgIWBGYPZBYEZg8VAQExZAIBDxYCHwACAxYGZg9kFgJmDxUDATEJ5rS75Lq65aKTD+i2iueLseino+i/t+exu2QCAQ9kFgJmDxUDATIK5ZOG5ZWmQeaipg/mg4XkvqPkurLlrZDnsbtkAgIPZBYCZg8VAwEzDOWls+eOi+WvhuS9vw/lm6LpmJ/lkIjkvZznsbtkAgEPZBYEZg8VAQEyZAIBDxYCHwACBBYIZg9kFgJmDxUDATQM5aWz546L5a+G5L2/D+WboumYn+WQiOS9nOexu2QCAQ9kFgJmDxUDATUM6Jyh56yU5bCP5pawD+aDheS+o+S6suWtkOexu2QCAg9kFgJmDxUDATYP5YuH6Zev6aOf5Lq65bKbD+aOoue0ouaPreenmOexu2QCAw9kFgJmDxUDATcP5oOK5aSp6a2U55uX5ZuiD+mYtOiwi+eKr+e9quexu2RkxVGP0cUtle5ghVQsROaMsrXoims=">
		</div>

		<div>

			<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="90059987">
		</div>
		<div id="leftBar">
			<div class="popwin">
				<div id="tabs11">
					<ul>


						<li style="font-size: 18px; margin: 0 20px; float: left; font-weight: normal"><a href="#divshopShow1" style="cursor: url('../images/handCursor.cur'), pointer;"> 环球港店 </a></li>

						<li style="font-size: 18px; margin: 0 20px; float: left; font-weight: normal"><a href="#divshopShow2" style="cursor: url('../images/handCursor.cur'), pointer;"> 旗舰店 </a></li>

					</ul>
					<div class="popwin-close">
						<input type="button" id="colse" value="" title="关闭窗口">
					</div>


					<div class="popwin-inner" id="divshopShow1">
						<div class="table-overflow mCustomScrollbar _mCS_1" style="overflow: hidden;">
							<div class="mCustomScrollBox mCS-dark-thick" id="mCSB_1" style="position: relative; height: 100%; overflow: hidden; max-width: 100%; max-height: 450px;">
								<div class="mCSB_container mCS_no_scrollbar" style="position: relative; top: 0px;">
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
								<div class="mCSB_scrollTools" style="position: absolute; display: none;">
									<a class="mCSB_buttonUp" oncontextmenu="return false;"></a>
									<div class="mCSB_draggerContainer">
										<div class="mCSB_dragger" style="position: absolute; top: 0px;" oncontextmenu="return false;">
											<div class="mCSB_dragger_bar" style="position: relative;"></div>
										</div>
										<div class="mCSB_draggerRail"></div>
									</div>
									<a class="mCSB_buttonDown" oncontextmenu="return false;"></a>
								</div>
							</div>
						</div>
					</div>

					<div class="popwin-inner" id="divshopShow2">
						<div class="table-overflow mCustomScrollbar _mCS_2" style="overflow: hidden;">
							<div class="mCustomScrollBox mCS-dark-thick" id="mCSB_2" style="position: relative; height: 100%; overflow: hidden; max-width: 100%; max-height: 450px;">
								<div class="mCSB_container mCS_no_scrollbar" style="position: relative; top: 0px;">
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
								<div class="mCSB_scrollTools" style="position: absolute; display: none;">
									<a class="mCSB_buttonUp" oncontextmenu="return false;"></a>
									<div class="mCSB_draggerContainer">
										<div class="mCSB_dragger" style="position: absolute; top: 0px;" oncontextmenu="return false;">
											<div class="mCSB_dragger_bar" style="position: relative;"></div>
										</div>
										<div class="mCSB_draggerRail"></div>
									</div>
									<a class="mCSB_buttonDown" oncontextmenu="return false;"></a>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>

			<script>
				function doPopWin() {
					popwin();
				}
				$(function() {
					$("#choose").click(doPopWin);
					$("#colse").click(closewin);

					$(".table-overflow>div>div>div>span").click(function() {
						location = "order.aspx?id=" + $(this).attr("href");
					});
				});
			</script>

			<!-- InstanceEndEditable -->
			<div class="shadow"></div>
			<div onclick="window.location = 'index.aspx'">
				<a href="/" style="cursor: url('../images/handCursor.cur'), pointer;"> <img src="/images/logo.jpg"></a>
			</div>
			<div id="leftNav">
				<div id="choose" class="">
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
					<input title="手机号码" type="text" id="signinNameInput" class="roundInput" placeholder="手机号码" name="SignForm[name]" maxlength="45"> <input title="登录密码" type="password" id="signinPassInput" class="roundInput" placeholder="初始密码为手机后4位" name="SignForm[password]" maxlength="30">
					<div style="margin-left: 10px; float: left">
						<div class="icheckbox_flat-blue checked" style="position: relative;">
							<input type="checkbox" checked="checked" name="SignForm[remember]" id="rememberInput" style="position: absolute; opacity: 0;">
							<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
						</div>
						<label id="rememberLabel" for="rememberInput">下次自动登录</label>
					</div>
					<div class="smallButton ilb" onclick="doSubmit()">登 录</div>


				</div>
				<div id="logedUser" style="display: none;">
					<div id="leftUserLinkBox">
						<span id="leftUserName"></span> <br> <span class="leftUserLink" onclick="window.location = 'usercenter.aspx';">个人管理</span> <span class="leftUserLink" id="leftUserLogout" onclick="doLogout();">退出登录</span>
					</div>
				</div>
				<div class="clearfloat"></div>
				<hr>
			</div>
		</div>

		<script>
			function doLogout() {
				$.ajax({
					url : "loaddata.aspx",
					data : {
						a : 'logout'
					},
					dataType : "json",
					success : function(ret) {
						if (ret.isError) {
							alert(ret.msg);
						} else {
							$.cookie("uname", null, {
								path : "/",
								expires : -1
							});
							$.cookie("pass", null, {
								path : "/",
								expires : -1
							});
							window.location.reload();
						}
					},
					error : function(ret) {
						alert("登出失败。");
						return false;
					}
				});
			}
			function doSubmit() {
				$.ajax({
					url : "loaddata.aspx",
					data : {
						a : 'login',
						u : $("#signinNameInput").val(),
						p : $("#signinPassInput").val()
					},
					dataType : "json",
					success : function(ret) {
						if (ret.isError) {
							alert(ret.msg);
						} else {
							if ($("#rememberInput").attr("checked") == "checked") {
								var expiresDate = 365 * 10;

								$.cookie('uname', $("#signinNameInput").val(), {
									path : "/",
									expires : expiresDate
								});
								$.cookie('pass', $("#signinPassInput").val(), {
									path : "/",
									expires : expiresDate
								});
							}
							$("#leftLoginForm").hide();
							$("#leftUserName").html(ret.uname);
							$("#logedUser").show();

							window.location = 'usercenter.aspx';

						}
					},
					error : function(ret) {
						alert("登录失败。");
						return false;
					}
				});
			}
			//如果用户已经登陆
			if ("" == "1") {
				$("#logedUser").show();
				$("#leftLoginForm").hide();
				$('#leftLoginTitle').unbind("click");
				$("#leftLoginTitle").click(function() {
					window.location = 'usercenter.aspx';
				});
			} else {
				$("#logedUser").hide();
				$("#leftLoginForm").hide();

				if ($.cookie('uname') != undefined && $.cookie('uname') != "") {

					$("#signinNameInput").val($.cookie('uname'));
					$("#signinPassInput").val($.cookie('pass'));
					doSubmit();
				}

				$("#leftLoginTitle").click(function() {
					$("#leftLoginForm").show();
				});
			}
		</script>

		<div>


			<script>
				document.body.style.background = "url('images/index_bg.jpg')";
			</script>

			<table width="100%" border="0" class="tb_cont">
				<tbody>
					<tr>
						<td><a href="order.aspx?id=1"> <img src="images/bg_01.png" width="310" height="205"></a></td>
						<td align="right"><a href="order.aspx?id=1"> <img src="images/bg_01_1.png" width="310" height="150"></a></td>
					</tr>
					<tr>
						<td>&gt;<a href="order.aspx?id=2"><img src="images/bg_02_1.png" width="340" height="180"></a></td>
						<td align="right"><a href="order.aspx?id=2"> <img src="images/bg_02.png" width="310" height="205"></a></td>
					</tr>
					<tr>
						<td><a href="order.aspx?id=3"><img src="images/bg_03.png" width="310" height="205"></a></td>
						<td align="right"><a href="order.aspx?id=3"> <img src="images/bg_03_1.png" width="360" height="150"></a></td>
					</tr>
				</tbody>
			</table>


		</div>
	</form>
	<div style="text-align: center; color: #fff; font-size: 18px; position: fixed; bottom: 0px; left: 40%">
		<a href="http://www.miibeian.gov.cn/">沪ICP备10217145号</a> COPYRIGHT@2014上海润麟实业有限公司
	</div>


</body>
</html>