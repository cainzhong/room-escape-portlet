<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Online Shopping</title>
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
				<a href="#"><img src="css/img/1.jpg" alt="image01"><span>http://www.colazionedamichy.it/</span></a>
				<a href="#"><img src="css/img/2.jpg" alt="image02"><span>http://www.percivalclo.com/</span></a>
				<a href="#"><img src="css/img/3.jpg" alt="image03"><span>http://www.wanda.net/fr</span></a>
				<a href="#"><img src="css/img/4.jpg" alt="image04"><span>http://lifeingreenville.com/</span></a>
				<a href="#"><img src="css/img/5.jpg" alt="image05"><span>http://circlemeetups.com/</span></a>
				<a href="#"><img src="css/img/6.jpg" alt="image06"><span>http://www.castirondesign.com/</span></a>
				<a href="#"><img src="css/img/7.jpg" alt="image07"><span>http://www.foundrycollective.com/</span></a>
				<a href="#"><img src="css/img/8.jpg" alt="image08"><span>http://www.mathiassterner.com/home</span></a>
				<a href="#"><img src="css/img/9.jpg" alt="image09"><span>http://learnlakenona.com/</span></a>
				<a href="#"><img src="css/img/10.jpg" alt="image10"><span>http://www.neighborhood-studio.com/</span></a>
				<a href="#"><img src="css/img/11.jpg" alt="image11"><span>http://www.beckindesign.com/</span></a>
				<a href="#"><img src="css/img/12.jpg" alt="image12"><span>http://kicksend.com/</span></a>
			</div>
		</section>
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