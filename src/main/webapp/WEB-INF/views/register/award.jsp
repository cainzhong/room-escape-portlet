<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Award</title>

<jsp:include page="../resourceInclude.jsp" />

<script type="text/javascript" src="${pageContext.request.contextPath}/js/appendGrid/jquery.appendGrid-1.5.2.min.js"></script>
<link rel='stylesheet' href='css/appendGrid/jquery.appendGrid-1.5.2.css' type="text/css">

</head>

 
<body>
     <jsp:include page="../header.jsp" />

     <div id="main">
           <div class="homePage">
                 <div class="registerBasicInfo">
                    <form class="cmxform" id="awardForm" name="awardForm" method="post" action="${flowExecutionUrl}">
						<table id="tblAppendGrid"></table>
						<br>
						<!-- <button id="btnLoad" type="button">Demo: Load Data</button>
						<button id="btnSerialize" type="button">Demo: jQuery Serialize</button> -->
                        <input id="submit" name="_eventId_submit" class="submit" type="submit" value="<spring:message code='T_SUBMIT' />">
                        <input class="submit" type="reset" value="<spring:message code='T_RESET' />">
                     
				    </form>
                 </div>
           </div>
     </div>     

     <jsp:include page="../footer.jsp" />

</body>


<script>
$(function () {
    // Initialize appendGrid
    $('#tblAppendGrid').appendGrid({
        caption: '获得荣誉',
        initRows: 1,
        columns: [
                { name: 'awardType', display: '荣誉类型', type: 'select', ctrlOptions: { 0: '选择', T_AWARD_TYPE_HONORARY_TITLE: '荣誉称号', T_AWARD_TYPE_THESIS: '论文专著', T_AWARD_TYPE_INTELLECTUAL_PROPERTY: '知识产权', T_AWARD_TYPE_OTHER: '其他'} },
                { name: 'description', display: '描述', type: 'text', ctrlAttr: { maxlength: 200 }, ctrlCss: { width: '160px'} },
                { name: 'referrer', display: '推荐人', type: 'text', ctrlAttr: { maxlength: 100 }, ctrlCss: { width: '160px'} },
                { name: 'other', display: '其他', type: 'text', ctrlAttr: { maxlength: 200 }, ctrlCss: { width: '160px'} },
                { name: 'RecordId', type: 'hidden', value: 0 }
            ]
    });
    // Handle `Load` button click
    $('#btnLoad').button().click(function () {
        $('#tblAppendGrid').appendGrid('load', [
            { 'awardType': 1, 'description': 'Best Student', 'referrer': 'Jason Xiang', 'other': 'Best Student', 'RecordId': 123 },
            { 'awardType': 2, 'description': 'Bad Student', 'referrer': 'Jason Xiang', 'other': 'Best Student', 'RecordId': 124 },
            { 'awardType': 4, 'description': 'SOSO Student', 'referrer': 'Jason Xiang', 'other': 'Best Student', 'RecordId': 125 },
            { 'awardType': 3, 'description': 'just Student', 'referrer': 'Jason Xiang', 'other': 'Best Student', 'RecordId': 126 },
            { 'awardType': 2, 'description': 'not Student', 'referrer': 'Jason Xiang', 'other': 'Best Student', 'RecordId': 127 },
        ]);
    });
    // Handle `Serialize` button click
    $('#btnSerialize').button().click(function () {
        alert('Here is the serialized data!!\n' + $(document.forms[0]).serialize());
    });
});
</script>

</html>