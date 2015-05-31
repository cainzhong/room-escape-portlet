<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Personal History</title>

<jsp:include page="../resourceInclude.jsp" />

<script type="text/javascript" src="${pageContext.request.contextPath}/js/validate/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/validate/messages_zh.js"></script>
<link rel='stylesheet' href='css/screen.css' type="text/css">
<link rel="stylesheet" href="http://jqueryvalidation.org/files/demo/site-demos.css">

</head>

 
<body>
     <jsp:include page="../header.jsp" />

     <div id="main">
           <div class="homePage">
                 <div class="registerBasicInfo">
                       <form class="cmxform" id="historyForm" name="historyForm" method="post" action="${flowExecutionUrl}">
                             <fieldset>
                                   <c:forEach items="${flowRequestContext.messageContext.allMessages}" var="message">
                                         <div class="error_message">
                                               <span style="color: #FF0000">${message.text}</span>
                                         </div>
                                   </c:forEach>
                                   <legend>学历资料</legend>
                                   <p>
                                         <label for="university">毕业大学：</label>
                                         <input id="university" name="university" type="text" required>
                                   <p>
                                   <p>
                                         <label for="degree">学历：</label>
                                         <select id="degree" name="degree" title="请选择您的学历!" required>
                                               <option value="">选择</option>
                                               <option value="0">本科</option>
                                               <option value="1">硕士</option>
                                               <option value="2">博士</option>
                                               <option value="3">博士后</option>
                                               <option value="4">其他</option>
                                         </select>
                                   </p>
                                   <p>
                                         <label for="graduationTime">毕业时间：</label>
                                         <input id="graduationTime" name="graduationTime" type="text" required>
                                   </p>
                                   <legend>获得荣誉</legend>                            
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

     <jsp:include page="../footer.jsp" />

</body>


<script>
      $.validator.setDefaults({
            submitHandler : function() {
                  alert("submitted!");
                 return true;
            }

      });

     // validate the identity form when it is submitted
      $("#historyForm").validate({
            rules : {
                  degree : {
                       required : true
                  }
            }

      });

     
      $( "#graduationTime" ).datepicker({
            inline: true,
            autoSize: true
      });
</script>

</html>