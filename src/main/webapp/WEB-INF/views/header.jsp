<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					<a title="Sign out" href="logoff.do">注销</a>
				</li>
			</c:when>
		<c:otherwise>
				<li>
					<a title="Login" href="login.do">登录</a>
					<b class="split">|</b>
					<a title="Sign in" href="register.do">注册</a>
				</li>
		</c:otherwise>
		</c:choose>
		</ul>

		<ul class="menu-logo" style="margin-left: 450px;">
			<li class="logo-li">
				<a class="logo logo-0004" href="http://www.motorola.com.cn">
					<img src="${pageContext.request.contextPath}/img/logo.PNG" alt="Home" style="opacity: 1;height:45px;margin-top:20px;">
				</a>
			</li>
		</ul>
		<ul class="nav-items" style="margin-left: 350px;">
			<li class="dropdown"><a href="#" class=""><span>动态发布</span></a> <!-- <ul>
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
			<li class="dropdown "><a href="#" class=""><span>海外联络站</span></a></li>
			
			<li><a href="#" class=""><span>项目发布</span></a></li>
			<li><a href="#" class=""><span>伯乐盼才</span></a></li>
			<li><a href="#" class=""><span>互动社区</span></a></li>
			<li><a href="#" class=""><span>其他</span></a></li>
		</ul>
		</nav>
	
		<div class="search-site">
			<form action="http://www.baidu.com/baidu">
				<input id="kw" name="wd" type="text"> 
				<input type="submit" class="baidu-search-button" value="search" title="search">
			</form>
		</div>
</header>