<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>中华英才网注册页面</title>
<jsp:include page="resourceInclude.jsp"/>

<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript"src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
<script type="text/javascript" src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script> -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
<link rel='stylesheet' href='css/screen.css' type="text/css">
<link rel="stylesheet" href="http://jqueryvalidation.org/files/demo/site-demos.css">

</head>
<body>
<jsp:include page="header.jsp"/>
<div id="main">
     <div class="homePage">
           <div class="registerBasicInfo">
                 <form class="cmxform" id=registerForm name="registerForm" method="post" action="${flowExecutionUrl}">
                       <fieldset>
							<c:forEach
								items="${flowRequestContext.messageContext.allMessages}" var="message">
								<div class="error_message">
									<span style="color: #FF0000">${message.text}</span>
								</div>
							</c:forEach>
						<legend><spring:message code="T_BASIC_INFO" /></legend>
                             <p>
                                   <label for="name"><spring:message code="T_USER_NAME" /></label>
                                   <input id="name" name="name" minlength="2" type="text" required>
                             </p>
                             <p>
                                   <label for="actname"><spring:message code="T_USER_ACTUAL_NAME" /></label>
                                   <input id="actname" name="actname" minlength="2" type="text" required>
                             </p>
                             <p>
                                   <label for="engname"><spring:message code="T_USER_ENGLISH_NAME" /></label>
                                   <input id="engname" name="engname" minlength="2" type="text" required>
                             </p>
                             <p>
                                   <label for="gender"><spring:message code="T_USER_GENDER" /></label>
                                   <input type="radio" id="gender_male" value="MALE" name="gender" /><spring:message code="T_USER_GENDER_MALE" />
                                   <input type="radio" id="gender_female" value="FEMALE" name="gender" /><spring:message code="T_USER_GENDER_FEMALE" />
                                   <label for="gender" class="error"></label>
                             </p>
                             <p>
                                   <label for="cpassword"><spring:message code="T_PASSWORD" /></label>
                                   <input id="cpassword" name="cpassword" type="password" minlength="6" required/>
                             </p>
                             <p>
                                   <label for="password_again"><spring:message code="T_USER_CONFIRM_PASSWORD" /></label>
                                   <input id="password_again" name="password_again" type="password" required/>
                             </p>
                             <legend><spring:message code="T_CONTACT_INFO" /></legend>
                             <p>
                                   <label for="email"><spring:message code="T_USER_EMAIL_ADDRESS" /></label>
                                   <input id="email" name="email" type="email"  required>
                             </p>
                             <p>
                                   <label for="phoneno"><spring:message code="T_USER_PHONE_NUMBER" /></label>
                                   <input id="phoneno" name="phoneno" required />
                             </p>
                             <p>
                                   <input id="submit" name="_eventId_submit" class="submit" type="submit" value="<spring:message code='T_SUBMIT' />">
                             </p>
                             <p>
                                   <input class="submit" type="reset" value="<spring:message code='T_RESET' />">
                             </p>
                       </fieldset>
                 </form>
                 </div>
           </div>
     </div>

<jsp:include page="footer.jsp"/>

</body>

<script>
$.validator.setDefaults({
      submitHandler: function() {
            alert("submitted!");
           return true;
      }
});

 

// validate the comment form when it is submitted
      $("#registerForm").validate({
              rules: {
                    gender: {
                           required: true
                      },
                        password_again: {
                                equalTo: "#cpassword"
                            },
                    phoneno: {
                          number: true
                      }
                    }       
});
</script>

</html>