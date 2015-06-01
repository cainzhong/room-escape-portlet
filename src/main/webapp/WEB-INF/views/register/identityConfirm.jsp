<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Identity Confirm</title>

<jsp:include page="../resourceInclude.jsp" />

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
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
					<form class="cmxform" id="form2" method="post" action="cont/upload" enctype="multipart/form-data">
						<fieldset>
						<legend>身份认证</legend>
						<p>
							<label for="file">图片上传：</label> 
							<input id="imgInp" name="file" type="file" required>
							<button value="Submit" onclick="uploadJqueryForm()">Upload</button>
							<div id="result"></div>
							<!-- <img id="blah" src="#" alt="your image" /> -->
						
						</fieldset>
					</form>	
						
					<form class="cmxform" id="identityForm" name="identityForm" method="post" action="${flowExecutionUrl}" enctype="multipart/form-data">
						<fieldset>
						<c:forEach items="${flowRequestContext.messageContext.allMessages}" var="message">
							<div class="error_message">
								<span style="color: #FF0000">${message.text}</span>
							</div>
						</c:forEach>
						<p>
							<label for="currentCountry">所在国家：</label> 
							<input id="currentCountry" name="currentCountry" type="text" required>
						</p>
						<p>
							<label for="currentCity">所在城市：</label> 
							<input id="currentCity" name="currentCity" type="text" required>
						</p>
						<p>
							<label for="id">证件号：</label> 
							<select id="idType" name="idType" title="请选择一种证件类型!" required>
								<option value="">选择</option>
								<option value="0">护照</option>
								<option value="1">身份证</option>
							</select>
							<input id="idNumber" name="idNumber" type="text" required>
						</p>
						<input type="hidden" id="formatedFileName" name="formatedFileName"/>
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

	$("#identityForm").validate({
		
	});
	
/* 	 function readURL(input) {
	       if (input.files && input.files[0]) {
	           var reader = new FileReader();
	            reader.onload = function (e) {
	                $('#blah').attr('src', e.target.result);
	           }
	            reader.readAsDataURL(input.files[0]);
	        }
	    }

	    $("#imgInp").change(function(){
	        readURL(this);
	    }); */
	    
	
	    
	  //using jquery.form.js
	    function uploadJqueryForm(){
	        $('#result').html('');
	        
	    	$("#form2").validate({
	    		
	    	});
	    	
	       $("#form2").ajaxForm({
	        success:function(data) { 
	        	var result = data.split("##");
	              $('#result').html(result[0]);
	              $('#formatedFileName').val(result[1]);
	         },
	         dataType:"text"
	       }).submit();
	       
	    }
</script>

</html>