$(document).ready(function() {

	// edit profile
	$("#basicInfoEditBtn").click(function() {
		var oddTD = $("#basicInfo tbody td:odd");
		oddTD.each(function() {
			var inputobj = $("<input type='text'>");
			var tdobj = $(this);
			var text = tdobj.html();
			tdobj.html("");
			inputobj.css("border", "0").css("font-size", tdobj.css("font-size")).css("font-family", tdobj.css("font-family")).css("background-color", tdobj.css("background-color")).css("color", "#C75F3E").width(tdobj.width()).val(text).appendTo(tdobj);
		});
		$("#basicInfoEditBtn").attr("disabled", true);
		$("#basicInfoSubmit").css("display", "block");
	});

	// submit profile
	$('#basicInfoSubmitBtn').click(function() {
		// invoke the controller through ajax
		$.ajax({
			type : 'POST',
			url : 'editIndProfile.do',
			dataType : "text",
			data : {
				"username" : $("#username").text(),
				"realName" : $("#realName :first-child").val(),
				"englishName" : $("#englishName :first-child").val(),
				"currentCountry" : $("#currentCountry :first-child").val(),
				"email" : $("#email :first-child").val(),
				"telephone" : $("#telephone :first-child").val(),
				"qq" : $("#qq :first-child").val(),
				"webchat" : $("#webchat :first-child").val()
			},
			success : function(data) {
				$("#basicInfoEditBtn").attr("disabled", false);
				$("#basicInfoSubmit").css("display", "none");
				var oddTD = $("#basicInfo tbody td:odd");
				oddTD.each(function() {
					var tdobj = $(this);
					var tdval = tdobj.children(":first").val();
					tdobj.empty();
					tdobj.html(tdval);
				});
				alert(data);
			},
			error : function(data) {
				$("#basicInfoEditBtn").attr("disabled", false);
				$("#basicInfoSubmit").css("display", "none");
				var oddTD = $("#basicInfo tbody td:odd");
				oddTD.each(function() {
					var tdobj = $(this);
					var tdval = tdobj.children(":first").val();
					tdobj.empty();
					tdobj.html(tdval);
				});
				alert("error");
			}
		});
	});

	// edit personal histories.
	$("input[name='personal_history_edit_btn']").each(function() {
		$(this).click(function() {
			var personalHistoryId = $(this).next("span").text();
			var oddTdId = "#personal_history_table"+personalHistoryId + " tbody td:odd";
			var oddTD = $(oddTdId);
			oddTD.each(function() {
				var inputobj = $("<input type='text'>");
				var tdobj = $(this);
				var text = tdobj.html();
				tdobj.html("");
				inputobj.css("border", "0").css("font-size", tdobj.css("font-size")).css("font-family", tdobj.css("font-family")).css("background-color", tdobj.css("background-color")).css("color", "#C75F3E").width(tdobj.width()).val(text).appendTo(tdobj);
			});
			$(this).attr("disabled", true);
			$("#personal_history_submit"+personalHistoryId).css("display", "block");
		});
	});

	// submit personal histories.
	$("input[name^='personal_history_submit_btn']").click(function() {
		var personal_history_table=$(this).parent().prev("table").attr('id');
		var personal_history_id=$(this).parent().prev("table").children().find("input[name='personal_history_edit_btn']").next("span").text();
		// invoke the controller through ajax
		var university="#"+personal_history_table+" .university :first-child";
		var major="#"+personal_history_table+" .major :first-child";
		var universityDegree="#"+personal_history_table+" .university_degree :first-child";
		var graduationYear="#"+personal_history_table+" .graduation_year :first-child";
		$.ajax({
			type : 'POST',
			url : 'editPerHistory.do',
			dataType : "text",
			data : {
				"username" : $("#username").text(),
				"personalHistoryId" : personal_history_id,
				"university" : $(university).val(),
				"major" : $(major).val(),
				"universityDegree" : $(universityDegree).val(),
				"graduationYear" : $(graduationYear).val()
			},
			success : function(data) {
				var personal_history_edit_btn="#"+personal_history_table+" input[name='personal_history_edit_btn']";
				$(personal_history_edit_btn).attr("disabled", false);
				$(this).parent().css("display", "none");
				var oddTdId = personal_history_table+" tbody td:odd";
				var oddTD = $(oddTdId);
				oddTD.each(function() {
					var tdobj = $(this);
					var tdval = tdobj.children(":first").val();
					tdobj.empty();
					tdobj.html(tdval);
				});
				alert(data);
			},
			error : function(data) {
				var personal_history_edit_btn="#"+personal_history_table+" input[name='personal_history_edit_btn']";
				$(personal_history_edit_btn).attr("disabled", false);
				$(this).parent().css("display", "none");
				var oddTdId = personal_history_table+" tbody td:odd";
				var oddTD = $(oddTdId);
				oddTD.each(function() {
					var tdobj = $(this);
					var tdval = tdobj.children(":first").val();
					tdobj.empty();
					tdobj.html(tdval);
				});
				alert("error");
			}
		});
	});

	// edit award
	$("input[name='award_edit_btn']").click(function() {
		var awardTD=$(this).parent().prev("td");
		awardTD.each(function() {
			var inputobj = $("<input type='text'>");
			var tdobj = $(this);
			var text = tdobj.html();
			tdobj.html("");
			inputobj.css("border", "0").css("font-size", tdobj.css("font-size")).css("font-family", tdobj.css("font-family")).css("background-color", tdobj.css("background-color")).css("color", "#C75F3E").width(tdobj.width()).val(text).appendTo(tdobj);
		});
		$(this).addClass("hide");
		$(this).next("div").removeClass("hide");
		$(this).next("div").addClass("show");
	});

	// submit award
	$("input[name='award_submit_btn']").click(function() {
		// invoke the controller through ajax
		var submitDiv = $(this).parent();
		var awardId = submitDiv.next("span").text();
		$.ajax({
			type : 'POST',
			url : 'editAward.do',
			dataType : "text/plain",
			data : {
				"username" : $("#username").text(),
				"awardId" : awardId,
				"awardDescription" : $(this).parent().parent().prev("td").children(":first").val(),
			},
			success : function(data) {
				submitDiv.prev("input").addClass("show").removeClass("hide");
				submitDiv.removeClass("show").addClass("hide");
				var awardTD =$(this).parent().parent().pre("td");
				awardTD.each(function() {
					var tdobj = $(this);
					var tdval = tdobj.children(":first").val();
					tdobj.empty();
					tdobj.html(tdval);
				});
				alert("success");
			},
			error : function(data) {
				submitDiv.prev("input").addClass("show").removeClass("hide");
				submitDiv.removeClass("show").addClass("hide");
				alert("error");
			}
		});
	});

	// submit profile
	/*
	 * $('#basicInfoSubmit').click(function() { // invoke the controller through
	 * ajax $.ajax({ type : 'POST', url : 'editIndProfile.do', contentType :
	 * "application/json; charset=utf-8", dataType : "json", data :
	 * JSON.stringify(getJsonDataForBasicInfoTable()), success : function(data) {
	 * $("#basicInfoEditBtn").attr("disabled", false);
	 * $("#basicInfoSubmit").css("display", "none"); alert("success"); }, error :
	 * function(data) { $("#basicInfoEditBtn").attr("disabled", false);
	 * $("#basicInfoSubmit").css("display", "none"); alert("error"); } }); });
	 */

	function getJsonDataForBasicInfoTable() {
		var json = {
			"realName" : $("#realName :first-child").val(),
			"englishName" : $("#englishName :first-child").val(),
			"currentCountry" : $("#currentCountry :first-child").val(),
			"email" : $("#email :first-child").val(),
			"telephone" : $("#telephone :first-child").val(),
			"qq" : $("#qq :first-child").val(),
			"webchat" : $("#webchat :first-child").val(),
		};
		return json;
	}

});