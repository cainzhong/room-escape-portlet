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
		$("#basicInfoEditBtn").css("pointer-events", "none");
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
				$("#basicInfoEditBtn").css("pointer-events", "auto");
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
				$("#basicInfoEditBtn").css("pointer-events", "auto");
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
	$("a[name='personal_history_edit_btn']").each(function() {
		$(this).click(function() {
			var personalHistoryId = $(this).next("span").text();
			var oddTdId = "#personal_history_table" + personalHistoryId + " tbody td:odd";
			var oddTD = $(oddTdId);
			oddTD.each(function() {
				var inputobj = $("<input type='text'>");
				var tdobj = $(this);
				var text = tdobj.html();
				tdobj.html("");
				inputobj.css("border", "0").css("font-size", tdobj.css("font-size")).css("font-family", tdobj.css("font-family")).css("background-color", tdobj.css("background-color")).css("color", "#C75F3E").width(tdobj.width()).val(text).appendTo(tdobj);
			});
			$(this).css("pointer-events", "none");
			$("#personal_history_submit" + personalHistoryId).css("display", "block");
		});
	});

	// submit personal histories.
	$("a[name^='personal_history_submit_btn']").click(function() {
		var submitDiv = $(this).parent();

		var personal_history_table = $(this).parent().prev("table").attr('id');
		var personal_history_id = $(this).parent().prev("table").children().find("a[name='personal_history_edit_btn']").next("span").text();
		// invoke the controller through ajax
		var university = "#" + personal_history_table + " .university :first-child";
		var major = "#" + personal_history_table + " .major :first-child";
		var universityDegree = "#" + personal_history_table + " .university_degree :first-child";
		var graduationYear = "#" + personal_history_table + " .graduation_year :first-child";
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
				var personal_history_edit_btn = "#" + personal_history_table + " a[name='personal_history_edit_btn']";
				$(personal_history_edit_btn).css("pointer-events", "auto");
				submitDiv.css("display", "none");
				var oddTdId = "#" + personal_history_table + " tbody td:odd";
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
				var personal_history_edit_btn = "#" + personal_history_table + " a[name='personal_history_edit_btn']";
				$(personal_history_edit_btn).css("pointer-events", "auto");
				$(this).parent().css("display", "none");
				var oddTdId = "#" + personal_history_table + " tbody td:odd";
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
	$("a[name='award_edit_btn']").click(function() {
		var award_description = $(this).parent().prev("td");
		var award_type = $(this).parent().prev("td").prev("td");

		var input_award_description = $("<input type='text'>");
		var award_description_txt = award_description.html();
		award_description.html("");
		input_award_description.val(award_description_txt).appendTo(award_description);

		var input_award_type = $("<input type='text'>");
		var award_type_txt = award_type.html();
		award_type.html("");
		input_award_type.val(award_type_txt).appendTo(award_type);

		$(this).addClass("hide");
		$(this).next("div").removeClass("hide");
		$(this).next("div").addClass("show");
	});

	// submit award
	$("a[name='award_submit_btn']").click(function() {
		// invoke the controller through ajax
		var submitDiv = $(this).parent();
		var awardId = submitDiv.next("span").text();
		$.ajax({
			type : 'POST',
			url : 'editAward.do',
			dataType : "text",
			data : {
				"username" : $("#username").text(),
				"awardId" : awardId,
				"awardDescription" : $(this).parent().parent().prev("td").children(":first").val(),
			},
			success : function(data) {
				submitDiv.prev("a").addClass("show").removeClass("hide");
				submitDiv.removeClass("show").addClass("hide");
				var award_type = submitDiv.parent().parent().children().eq(1);
				var award_description = submitDiv.parent().parent().children().eq(2);
				var award_type_val = award_type.children(":first").val();
				var award_description_val = award_description.children(":first").val();
				award_type.empty();
				award_type.html(award_type_val);
				award_description.empty();
				award_description.html(award_description_val);

				alert("success");
			},
			error : function(data) {
				submitDiv.prev("a").addClass("show").removeClass("hide");
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