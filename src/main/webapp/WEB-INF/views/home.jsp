<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Online Shopping</title>
<link rel='stylesheet' href='css/main.css' type="text/css">
</head>
<body class="">
	<header class="row nailed header-old-version locked"> 
		<nav class="in-grid">
			<ul class="loginBar">
				<li class="desktop-only"><a class="search-open"></a></li>
				<li class="cart-li"><a class="cart empty minicarttotal" href="https://www.motorola.com.cn/cart"><span class="num-items">0</span></a></li>
				<c:choose>
					<c:when test="${not empty userName}">
						<li>
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
				<li class="dropdown ">
					<a href="#" class=" "><span>手机</span></a>
					<!-- <ul>
						<li><a
							href="http://www.motorola.com.cn/Mobile-Phones/Moto-X/x%2B1-pdp-china.html"
							class="  ">Moto X</a></li>
						<li><a
							href="http://www.motorola.com.cn/Mobile-Phones/Moto-G-LTE/moto-g-lte-cn.html"
							class="  ">Moto G LTE</a></li>
						<li><a
							href="http://www.motorola.com.cn/Mobile-Phones/Moto-X-Pro/moto-x-pro-cn.html"
							class="  ">Moto X Pro</a></li>
					</ul> -->
				</li>
				<li class="dropdown ">
					<a href="#" class=" "><span>配件</span></a>
					<!-- <ul>
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
					</ul> -->
				</li>
				<li><a href="http://www.motorola.com.cn/Corded-and-Cordless-Phones-1/" class="  "><span>数字无绳电话机</span></a></li>
				<li class="dropdown ">
					<a href="#" class=" "><span>服务与支持</span></a>
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
					</ul> -->
				</li>
			</ul>
		</nav>
	
	
	
	<div class="search-site">
		<div class="in-grid">
			<li class="searchbar baidusearch"><label for="gsc-i-id1"
				class="tablet-mobile-only searchbox-default-text"></label>
				<div class="search-site">
					<div class="input text">
						<form action="http://zhannei.baidu.com/cse/search">
							<input type="text" name="q"> <input type="hidden"
								name="s" value="13782572958611160228"> <input
								type="hidden" name="entry" value="1"> <input
								type="submit" class="gsc-search-button gsc-search-button-v2"
								title="search">
						</form>
					</div>
				</div></li>
		</div>
	</div>
	</header>

	<div id="container" class="home-page" style="margin-top: 71px;">
		<div class="hero-container">
			<section class="three-column-editorial"
				id="homepage-hero-main-moto-x-pro">
			<div class="hero-img"
				style="background-image: url('/on/demandware.static/Sites-Motorola_CN-Site/Sites-Motorola_CN-Library/zh_CN/v1429223683413/homepage/homepage-hero/main-moto-x-pro/MotoX-Pro-CN-HomePage-Fullbleed-32615.jpg')"></div>
			<div class="in-grid card-size" style="height: 629px;">
				<div class="hero-main-card">
					<div class="card-content">
						<div class="description right">
							<div class="inner">

								<div class="lock-up-logo">
									<img
										src="http://www.motorola.com.cn/on/demandware.static/Sites-Motorola_CN-Site/Sites-Motorola_CN-Library/zh_CN/v1429223683413/logos/moto-x-pro-ffffff.svg"
										alt="Moto X Pro" style="width: 300px; height: 60px;">
								</div>
								<div class="lock-up-logo-mobile">
									<img
										src="http://www.motorola.com.cn/on/demandware.static/Sites-Motorola_CN-Site/Sites-Motorola_CN-Library/zh_CN/v1429223683413/logos/moto-x-pro-ffffff.svg"
										alt="Moto X Pro" style="width: 300px; height: 60px;">
								</div>
								<h2>选择大不同</h2>
								<p>探索无限 力量之选</p>
								<div class="homepage-cta-button">
									<a class="button blue-1 medium"
										href="http://www.motorola.com.cn/Mobile-Phones/Moto-X-Pro/moto-x-pro-cn.html"
										target="_self"><span>了解更多</span></a>
								</div>
								<div class="homepage-cta-button-mobile">
									<a class="button blue-1 medium"
										href="http://www.motorola.com.cn/Mobile-Phones/Moto-X-Pro/moto-x-pro-cn.html"
										target="_self"><span>了解更多</span></a>
								</div>





							</div>

						</div>
					</div>
				</div>
				<div class="hero-promo-wrapper">

					<ul class="row overflow">

						<li id="homepage-hero-bin-moto-hint" class="col">
							<div class="panel-transp">
								<div class="panel">
									<div class="overview">
										<div style="">
											<div class="content-herocard editorial-paragraph">
												<div class="promo-text-wrapper">
													<h4>Moto Hint超凡美学</h4>
													<p>舒适佩戴 自由操控</p>
												</div>


												<p class="cta">
													<a class="medium"
														href="/consumers/accessories/Moto-Hint/moto-hint-cn.html"><span>了解更多</span></a>
												</p>

											</div>

											<div class="image">
												<img
													src="/on/demandware.static/Sites-Motorola_CN-Site/Sites-Motorola_CN-Library/zh_CN/v1429223683413/homepage/homepage-hero/bin-moto-hint/MOTO-HOMEPAGE-BIN1-HINT-182X200.png"
													alt="homepage-hero-bin-moto-hint">
											</div>

										</div>
									</div>
								</div>
							</div>
						</li>

						<li id="homepage-hero-bin-moto-g" class="col">
							<div class="panel-transp">
								<div class="panel">
									<div class="overview">
										<div style="">
											<div class="content-herocard editorial-paragraph">
												<div class="promo-text-wrapper">
													<h4>Moto G选择玩出色</h4>
													<p>可更换多彩外壳尽显时尚个性</p>
												</div>


												<p class="cta">
													<a class="medium"
														href="/Mobile-Phones/Moto-G-LTE/moto-g-lte-cn.html"><span>了解更多</span></a>
												</p>

											</div>

											<div class="image">
												<img
													src="/on/demandware.static/Sites-Motorola_CN-Site/Sites-Motorola_CN-Library/zh_CN/v1429223683413/homepage/homepage-hero/bin-moto-g/MOTO-HOMEPAGE-BIN2-G-CN-182X200.png"
													alt="homepage-hero-bin-moto-g">
											</div>

										</div>
									</div>
								</div>
							</div>
						</li>

						<li id="homepage-hero-bin-moto-x" class="col">
							<div class="panel-transp">
								<div class="panel">
									<div class="overview">
										<div style="">
											<div class="content-herocard editorial-paragraph">
												<div class="promo-text-wrapper">
													<h4>惊鸿之美 惊艳之选</h4>
													<p>镶金红皮限量版全球首发</p>
												</div>


												<p class="cta">
													<a class="medium"
														href="/Mobile-Phones/Moto-X/x%2B1-pdp-china.html"><span>探索Moto
															X</span></a>
												</p>

											</div>

											<div class="image">
												<img
													src="/on/demandware.static/Sites-Motorola_CN-Site/Sites-Motorola_CN-Library/zh_CN/v1429223683413/homepage/homepage-hero/bin-moto-x/MOTO-HOMEPAGE-BIN-CN-XSpecial-400x400.png"
													alt="homepage-hero-bin-moto-x">
											</div>

										</div>
									</div>
								</div>
							</div>
						</li>

					</ul>

				</div>
			</div>
			</section>



		</div>





		<footer data-autoplay-interval="0">

		<div class="signup-form-wrapper row">
			<div class="in-grid row padlr10">
				<div class="signup-form-description">

					<div class="contentasset">
						<!-- dwMarker="content" dwContentID="detRQiaagJ4EkaaadkbwEScYFo" -->
						<h4>让我们保持联系</h4>
						<p>注册 Motorola, 第一时间得到促销信息及新闻.</p>
					</div>
					<!-- End contentasset -->
				</div>
				<div class="signup-form">
					<div class="input text valid" style="width: 405px;">
						<input name="emailAddress" type="email" value=""
							placeholder="电子邮箱地址" class="textinput"> <span
							class="email-address-error"></span>
					</div>
				</div>
				<button id="saveEmail" class="button blue-2 medium disabled">注册</button>
			</div>

			<div class="follow-us">
				<div class="contentasset">
					<!-- dwMarker="content" dwContentID="cdfOQiaagFbPUaaadhHMJrzA6G" -->
					<a id="icon-weibo" href="http://e.weibo.com/hellomoto"
						target="_blank"><img
						src="http://www.motorola.com.cn/on/demandware.static/Sites-Motorola_CN-Site/Sites-Motorola_CN-Library/zh_CN/v1429223683413/icon_weibo.png"
						width="25" height="25" alt="新浪微博" style="margin-top: 12px"></a>

				</div>
				<!-- End contentasset -->
			</div>
		</div>
	</div>

	<div class="footer-links in-grid row">

		<div class="col">
			<h5>更多产品</h5>
			<ul>


				<li><a
					href="http://www.motorola.com.cn/Mobile-Phones/Moto-X/x%2B1-pdp-china.html"
					class=" ">Moto X</a></li>


				<li><a
					href="http://www.motorola.com.cn/Mobile-Phones/Moto-G-LTE/moto-g-lte-cn.html"
					class=" ">Moto G LTE</a></li>


				<li><a
					href="http://www.motorola.com.cn/Mobile-Phones/Moto-X-Pro/moto-x-pro-cn.html"
					class=" ">Moto X Pro</a></li>


				<li><a
					href="http://www.motorola.com.cn/Corded-and-Cordless-Phones-1/"
					class=" ">数字无绳电话机</a></li>

			</ul>
		</div>

		<div class="col">
			<h5>服务与支持</h5>
			<ul>


				<li><a
					href="https://motorola-global-zn-ch.custhelp.com/app/mcp/service"
					class=" ">与我们联系</a></li>


				<li><a
					href="https://motorola-global-zn-ch.custhelp.com/app/home"
					class=" ">所有产品</a></li>


				<li><a
					href="https://motorola-global-zn-ch.custhelp.com/app/answers/detail/a_id/91628"
					class=" ">USB所有驱动程序</a></li>


				<li><a
					href="https://motorola-global-zn-ch.custhelp.com/app/answers/detail/a_id/93327"
					class=" ">所有驱动程序</a></li>


				<li><a
					href="https://pages.motorola-mail.com/registration-cn-zh/"
					class=" ">注册</a></li>

			</ul>
		</div>

		<div class="col">
			<h5>关于摩托罗拉</h5>
			<ul>


				<li><a href="http://www.lenovo.com" class=" ">关于联想</a></li>


				<li><a
					href="http://www.motorola.com.cn/About-Motorola/about-motorola-cn.html"
					class=" ">关于摩托罗拉</a></li>


				<li><a
					href="http://www.motorola.com.cn/consumers/About_Motorola-Legal-Privacy_Policy/About_Motorola-Legal-Privacy_Policy,zh_CN,pg.html"
					class=" ">隐私权声明</a></li>


				<li><a
					href="http://www.motorola.com.cn/consumers/about-motorola-CN/About_Motorola-Legal-Terms_of_Use/About_Motorola-Legal-Terms_of_Use.html"
					class=" ">使用条款</a></li>

			</ul>
		</div>

	</div>
	<div class="footer-bottom">
		<div class="in-grid row padlr10">
			<ul class="links">


				<li><span class="location zh_CN">中国</span> <span class="spacer">|</span></li>
				<li><a
					href="http://www.motorola.com/sites/country_selector/selector.html">变更</a></li>

			</ul>
			<div class="site-wide-disclaimers">
				<div class="in-grid row">
					<div class="all-rights-left span_6">
						<div class="contentasset">
							<!-- dwMarker="content" dwContentID="bcEI2iaagJPaAaaadkTQNx527v" -->
							<img
								src="http://www.motorola.com.cn/on/demandware.static/Sites-Motorola_CN-Site/Sites-Motorola_CN-Library/zh_CN/v1429223683413/logos/motorola-logo-white.svg"
								width="130" height="40" alt="Motorola"
								style="margin-bottom: 23px">
							<p>
								© <span id="calendarYear">2015</span> Motorola Mobility LLC.
								版权所有
							</p>
							<p>本公司保留所有权利 | ICP备案证书号：京ICP备09071891号-6</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</footer>
</body>
</html>