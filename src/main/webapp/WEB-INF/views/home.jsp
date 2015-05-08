<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>中华海外人才网</title>
<link rel='stylesheet' href='css/custom.css' type="text/css">
<jsp:include page="resourceInclude.jsp"/>
</head>
<body class="">
	<jsp:include page="header.jsp"/>

	<div class="container">
		<header style="display:none">
			<h1>
				3D Gallery <span>with CSS3 &amp; jQuery</span>
			</h1>
			<nav class="codrops-demos"> 
				<a href="http://tympanus.net/codrops/2012/02/06/3d-gallery-with-css3-and-jquery/">Navigation</a>
				<a href="http://tympanus.net/codrops/2012/02/06/3d-gallery-with-css3-and-jquery/">Auto-Slideshow</a>
				<a class="current-demo" href="http://www.accenture.com">12 Elements</a>
			</nav> 
		</header>
		<section id="dg-container" class="dg-container">
			<div class="dg-wrapper">
				<a href="<c:url value='detail.do'><c:param name="productId" value="10001" /></c:url>"><img src="css/img/fudan01.jpg" alt="image01"><span></span></a>
				<a href="<c:url value='detail.do'><c:param name="productId" value="10002" /></c:url>"><img src="css/img/fudan02.jpg" alt="image02"><span></span></a>
				<a href="<c:url value='detail.do'><c:param name="productId" value="10003" /></c:url>"><img src="css/img/fudan03.jpg" alt="image03"><span></span></a>
				<a href="<c:url value='detail.do'><c:param name="productId" value="10004" /></c:url>"><img src="css/img/jiaoda01.jpg" alt="image04"><span></span></a>
				<a href="<c:url value='detail.do'><c:param name="productId" value="10005" /></c:url>"><img src="css/img/jiaoda02.jpg" alt="image05"><span></span></a>
				<a href="<c:url value='detail.do'><c:param name="productId" value="10006" /></c:url>"><img src="css/img/jiaoda03.jpg" alt="image06"><span></span></a>
				<a href="<c:url value='detail.do'><c:param name="productId" value="10007" /></c:url>"><img src="css/img/harvard01.jpg" alt="image07"><span></span></a>
				<a href="<c:url value='detail.do'><c:param name="productId" value="10008" /></c:url>"><img src="css/img/harvard02.jpg" alt="image08"><span></span></a>
				<a href="<c:url value='detail.do'><c:param name="productId" value="10009" /></c:url>"><img src="css/img/harvard03.jpg" alt="image09"><span></span></a>
				<a href="<c:url value='detail.do'><c:param name="productId" value="10010" /></c:url>"><img src="css/img/tongji01.jpg" alt="image10"><span></span></a>
				<a href="<c:url value='detail.do'><c:param name="productId" value="10011" /></c:url>"><img src="css/img/tongji02.jpg" alt="image11"><span></span></a>
				<a href="<c:url value='detail.do'><c:param name="productId" value="10012" /></c:url>"><img src="css/img/tongji03.jpg" alt="image12"><span></span></a>
			</div>
		</section>	
	</div>
	
	<div>
		<div class="leftHomePageStyle">
			<div class="floatLeft"><label class="navFont"><spring:message code="T_COLLECT_RESUME" /></label></div> 
			<br>
			<div class="floatLeft" style="margin-top:0px;">
				<a class="" href="#">
					<img src="${pageContext.request.contextPath}/img/collecCV.PNG" alt="Home" style="opacity: 1;height:45px;margin-top:20px;">
				</a>
			</div>
			<br>
			<div class="floatLeft underlineWord"><label style="text-align: left;"><spring:message code="T_RESUME_INFO" /></label></div>
			<div class="floatLeft"><label style="text-align:center;font-size:12px;"><spring:message code="T_WEICHAT_INFO" /></label></div> 
			<div class="floatLeft" style="margin-top:0px;">
				<a class="" href="#">
					<img src="${pageContext.request.contextPath}/img/QRimg.PNG" alt="Home" style="opacity: 1;height:160px;width:250px;margin-top:10px;">
				</a>
			</div>
			<div class="floatLeft"><label style="font-size:12px;"><spring:message htmlEscape="false" code="T_COMPANY_INFO" arguments="021-61353110,021-61353109" /></label></div> 
		</div>
		<div class="centerHomePageStyle">
			<div class="floatLeft underlineWord" style="width:400px;">
				<div class="floatLeft"><label class="navFont"><spring:message code="T_RECRUIT" /></label></div>
				<br>
				<div class="floatLeft"><p>This portlet is used to show the information of the recruitment</p>
					<p>This is used for company, which want someone from the society</p>
				</div>
			</div>
			<div class="floatLeft">
				<div class="floatLeft"><label class="navFont"><spring:message code="T_TALENTS_ANNOUNCE" /></label></div>
				<br>
				<div class="floatLeft"><p>This portlet is used to show the information of the talented people</p>
					<p>Here is to show the info where users want to be recruited.</p>
				</div>
			</div>
		</div>
		
		<div class="rightHomePageStyle">
			<div class="floatLeft">
				<div class="floatLeft"><label class="navFont"><spring:message code="T_TV_ADVERTISEMENT" /></label></div>
				<br>
				<div class="floatLeft" style="margin-top: 10px;"> 
					<embed src="http://player.youku.com/player.php/sid/XNjE0MTkzODg4/v.swf" allowFullScreen="true" quality="high" width="250" height="250" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash"></embed>
				</div>
			</div>
			<br>
			<div class="floatLeft">
				<div class="floatLeft underlineWord"><label class="navFont"><spring:message code="T_DAILY_SENTENCE" /></label></div>
				<div class="floatLeft"><p>This portlet is used to show the daily nice English word.</p>
					<p>This part should be updated everyday, and should have a "Click" function, user can see the previous English word.</p>
				</div>
			</div>
			<div class="floatLeft">
				<div class="floatLeft underlineWord"><label class="navFont"><spring:message code="T_DAILY_POLICY_UPDATE" /></label></div>
				<div class="floatLeft"><p>This portlet is used to show the recent updated policy news.</p>
					<p>This part should be updated everyweek for latest policy for education information, and should have a "Raise Question" function, user can leave a question for the news.</p>
					<p>And should have a "More" function, user can see more news.</p>
				</div>
			</div>
		</div>
	
	</div>

	<jsp:include page="footer.jsp"/>
	
</body>
<script type="text/javascript">
// 3DGallery
$('#dg-container').gallery({
	autoplay : true
});
</script>
</html>