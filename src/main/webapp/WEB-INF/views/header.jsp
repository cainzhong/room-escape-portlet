<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel='stylesheet' href='css/custom.css' type="text/css">
<header class="row nailed header-old-version locked">
	<nav class="in-grid">
		<ul class="loginBar">
		<c:choose>
			<c:when test="${not empty userName}">
				<li id="loginUser">
					<a title="${userName}"><c:out value="${userName}" /></a>
					<b class="split">-</b>
					<a title="Sign out" href="logoff.do">Sign out</a>
				</li>
			</c:when>
		<c:otherwise>
				<li>
					<a title="Login" href="login.do">Login</a>
					<b class="split">-</b>
					<a title="Sign in" href="register.do">Sign in</a>
				</li>
		</c:otherwise>
		</c:choose>
		</ul>

		<ul class="menu-logo">
			<li class="logo-li">
				<a class="logo logo-0004" href="http://www.motorola.com.cn">
					<img src="${pageContext.request.contextPath}/img/logo-animation-header-sm-0005.png" alt="Home" style="opacity: 1;">
				</a>
			</li>
		</ul>
		<ul class="nav-items">
			<li class="dropdown "><a href="#" class=" "><span>MOBILE PHONES</span></a> <!-- <ul>
								<li><a
									href="http://www.motorola.com.cn/Mobile-Phones/Moto-X/x%2B1-pdp-china.html"
									class="  ">Moto X</a></li>
								<li><a
									href="http://www.motorola.com.cn/Mobile-Phones/Moto-G-LTE/moto-g-lte-cn.html"
									class="  ">Moto G LTE</a></li>
								<li><a
									href="http://www.motorola.com.cn/Mobile-Phones/Moto-X-Pro/moto-x-pro-cn.html"
									class="  ">Moto X Pro</a></li>
							</ul> --></li>
			<li class="dropdown "><a href="#" class=" "><span>ACCESSORIES</span></a> <!-- <ul>
								<li><a
									href="http://www.motorola.com.cn/consumers/accessories/Moto-Hint/moto-hint-cn.html"
									class="  ">Moto Hint</a></li>
								<li><a
									href="http://www.motorola.com.cn/consumers/accessories/Motorola-Buds-Wireless-Headphones/buds-wireless-headphones-cn.html"
									class="  ">Motorola Buds</a></li>
								<li><a
									href="http://www.motorola.com.cn/consumers/accessories/Power-Pack-Micro/power-pack-micro-cn.html"
									class="  ">Power Pack Micro</a></li>
								<li><a
									href="http://www.motorola.com.cn/consumers/accessories/Moto-G-%E5%A4%9A%E5%BD%A9%E5%90%8E%E5%A3%B3/moto-g-color-shells-cn.html"
									class="  ">Moto G多彩后壳</a></li>
							</ul> --></li>
			<li><a
				href="http://www.motorola.com.cn/Corded-and-Cordless-Phones-1/"
				class="  "><span>SPECIALS</span></a></li>
			<li class="dropdown "><a href="#" class=" "><span>GET HELP</span></a>
				<!-- <ul>
								<li><a
									href="https://motorola-global-zn-ch.custhelp.com/app/home"
									class="  ">所有产品</a></li>
								<li><a
									href="https://motorola-global-zn-ch.custhelp.com/app/software-upgrade-news/g_id/1981"
									class="  ">所有软件</a></li>
								<li><a
									href="https://motorola-global-zn-ch.custhelp.com/app/answers/detail/a_id/91628"
									class="  ">USB所有驱动程序</a></li>
								<li><a
									href="https://motorola-global-zn-ch.custhelp.com/app/mcp/service"
									class="  ">联系我们</a></li>
							</ul> --></li>
		</ul>
		</nav>
	
		<div class="search-site">
			<form action="http://www.baidu.com/baidu">
				<input id="kw" name="wd" type="text"> 
				<input type="submit" class="baidu-search-button" value="search" title="search">
			</form>
		</div>
</header>