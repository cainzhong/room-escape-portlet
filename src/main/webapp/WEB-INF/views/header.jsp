<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel='stylesheet' href='css/custom.css' type="text/css">
<header class="row nailed header-old-version locked">
	<nav class="nav">
		<ul class="menu-logo">
			<li class="logo-li">
				<a class="logo logo-0004" href="http://www.motorola.com.cn">
					<img src="${pageContext.request.contextPath}/img/logo.PNG" alt="Home" style="opacity: 1;height:45px;margin-top:20px;">
				</a>
			</li>
		</ul>
		<ul class="nav-menu">
			<li class="nav-menu-item"><a href="#" class=""><span>动态发布</span></a>
				<ul class="nav-submenu">
					<li class="nav-submenu-item"><a href="#" class=""><span>Item1</span></a></li>
					<li class="nav-submenu-item"><a href="#" class=""><span>Item2</span></a></li>
					<li class="nav-submenu-item"><a href="#" class=""><span>Item3</span></a></li>
				</ul>
			</li>
			<li class="nav-menu-item"><a href="#" class=""><span>海外联络站</span></a></li>
			<li class="nav-menu-item"><a href="#" class=""><span>项目发布</span></a></li>
			<li class="nav-menu-item"><a href="#" class=""><span>伯乐盼才</span></a></li>
			<li class="nav-menu-item"><a href="#" class=""><span>互动社区</span></a></li>
			<li class="nav-menu-item"><a href="#" class=""><span>其他</span></a>
				<ul class="nav-submenu">
					<li class="nav-submenu-item"><a href="#" class=""><span>贴心服务</span></a></li>
					<li class="nav-submenu-item"><a href="#" class=""><span>活动报道</span></a></li>
					<li class="nav-submenu-item"><a href="#" class=""><span>关于我们</span></a></li>
				</ul>
			</li>
		</ul>
		<ul class="search-item">
			<div class="search-site">
				<form action="http://www.baidu.com/baidu">
					<input id="kw" name="wd" type="text"> 
					<input type="submit" class="baidu-search-button" value="search" title="search">
				</form>
			</div>
		</ul>
		<ul class="loginContainer">
		<c:choose>
			<c:when test="${not empty userName}">
				<li id="loginUser">
					<a title="${userName}"><c:out value="${userName}" /></a>
					<b class="split">-</b>
					<a title="Sign out" href="logoff.do">注销</a>
				</li>
			</c:when>
		<c:otherwise>
				<li>
					<a id="loginButton" title="Login" href="#"><span>登录</span></a>
					<!-- Login Form Starts Here -->
						<div id="loginBox">                
		                    <form id="loginForm" action="login.do">
		                        <fieldset id="body">
		                            <fieldset>
		                                <label for="email">Email Address</label>
		                                <input type="text" name="email" id="email" />
		                            </fieldset>
		                            <fieldset>
		                                <label for="password">Password</label>
		                                <input type="password" name="password" id="password" />
		                            </fieldset>
		                            <input type="submit" id="login" value="Sign in" />
		                            <label for="checkbox"><input type="checkbox" id="checkbox" />Remember me</label>
		                        </fieldset>
		                        <span><a href="#">Forgot your password?</a></span>
		                    </form>
	               		</div>
	               	 <!-- Login Form Ends Here -->
					<b class="split">|</b>
					<a id="registerButton" title="Sign in" href="register.do"><span>注册</span></a>
				</li>
		</c:otherwise>
		</c:choose>
		</ul>
	</nav>
<script type="text/javascript">

//Login Form
$(function() {
    var button = $('#loginButton');
    var box = $('#loginBox');
    var form = $('#loginForm');
    button.removeAttr('href');
    button.mouseup(function(login) {
        box.toggle();
        button.toggleClass('active');
    });
    form.mouseup(function() { 
        return false;
    });
    $(this).mouseup(function(login) {
        if(!($(login.target).parent('#loginButton').length > 0)) {
            button.removeClass('active');
            box.hide();
        }
    });
});

</script>	
	
</header>