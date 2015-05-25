<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>View Cart</title>
<jsp:include page="resourceInclude.jsp"/>
</head>

<body>
<jsp:include page="header.jsp"/>

<div id="main">
     <div class="homePage">
      <h1>Register Success</h1>
      <h4>感谢您注册成为海才网的普通会员，请实时关注我们的最新动态，<br/></br>如欲进一步投送工作简历或发布项目合作，请点击“下一步”去完善您的个人资料；</h4>
      <a href="${flowExecutionUrl}&_eventId=next">下一步</a>
   </div>
</div>

<jsp:include page="footer.jsp"/>
</body>

</html>