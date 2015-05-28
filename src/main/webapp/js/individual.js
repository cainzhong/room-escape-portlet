$(document).ready(function() {

	// edit profile
	$("#basic_info_edit_btn").click(function() {
		var odd_td = $("#basic_info tbody td:odd");
		odd_td.each(function() {
			var inputobj = $("<input type='text'>");
			var tdobj = $(this);
			var text = tdobj.html();
			tdobj.html("");
			inputobj.val(text).appendTo(tdobj);
		});
		$("#basic_info_edit_btn").css("pointer-events", "none");
		$("#basic_info_submit").css("display", "block");
	});

	// submit profile, invoke the controller through ajax
	$('#basic_info_submit_btn').click(function() {
		$.ajax({
			type : 'POST',
			url : 'editIndProfile.do',
			dataType : "text",
			data : {
				"username" : $("#username").text(),
				"realName" : $("#real_name :first-child").val(),
				"englishName" : $("#english_name :first-child").val(),
				"currentCountry" : $("#current_country :first-child").val(),
				"email" : $("#email :first-child").val(),
				"telephone" : $("#telephone :first-child").val(),
				"qq" : $("#qq :first-child").val(),
				"webchat" : $("#webchat :first-child").val()
			},
			success : function(data) {
				$("#basic_info_edit_btn").css("pointer-events", "auto");
				$("#basic_info_submit").css("display", "none");
				$("#dialog-success").dialog("open");
			},
			error : function(data) {
				$("#basic_info_edit_btn").css("pointer-events", "auto");
				$("#basic_info_submit").css("display", "none");
				$("#dialog-error").dialog("open");
			}
		});
	});

	// edit personal histories.
	$("a[name='personal_history_edit_btn']").each(function() {
		$(this).click(function() {
			var personal_history_id = $(this).next("span").text();
			var odd_td_id = "#personal_history_table" + personal_history_id + " tbody td:odd";
			var odd_td = $(odd_td_id);
			odd_td.each(function() {
				var inputobj = $("<input type='text'>");
				var tdobj = $(this);
				var text = tdobj.html();
				tdobj.html("");
				inputobj.val(text).appendTo(tdobj);
			});
			$(this).css("pointer-events", "none");
			$("#personal_history_submit" + personal_history_id).css("display", "block");

			// get selector values for university degree.
			var university_degree_id = "#personal_history_table" + personal_history_id + " .university_degree";
			var university_degree_val = $(university_degree_id).html();
			var university_degree_td = $(university_degree_id);
			$.ajax({
				type : 'POST',
				url : 'getSelectorValues.do',
				dataType : "json",
				data : {},
				success : function(data) {
					var selectobj = $("<select>");
					$.each(data, function(i, item) {
						selectobj.append("<option value=" + item.key + ">" + item.value + "</option>");
					});
					selectobj.append("</select>");
					university_degree_td.html("");
					selectobj.appendTo(university_degree_td);
					var select_id = university_degree + "  select option:contains(" + university_degree_val + ")";
					$(select_id).attr("selected", "selected");
				},
				error : function(data) {
					$("#dialog-ajax-error").dialog("open");
				}
			});

		});
	});

	// submit personal histories, invoke the controller through ajax
	$("a[name^='personal_history_submit_btn']").click(function() {
		var submit_div = $(this).parent();

		var personal_history_table = $(this).parent().prev("table").attr('id');
		var personal_history_id = $(this).parent().prev("table").children().find("a[name='personal_history_edit_btn']").next("span").text();

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
				submit_div.css("display", "none");
				$("#dialog-success").dialog("open");
			},
			error : function(data) {
				var personal_history_edit_btn = "#" + personal_history_table + " a[name='personal_history_edit_btn']";
				$(personal_history_edit_btn).css("pointer-events", "auto");
				$(this).parent().css("display", "none");
				$("#dialog-error").dialog("open");
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

	// submit award, invoke the controller through ajax
	$("a[name='award_submit_btn']").click(function() {
		var submit_div = $(this).parent();
		var awardId = submit_div.next("span").text();
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
				submit_div.prev("a").addClass("show").removeClass("hide");
				submit_div.removeClass("show").addClass("hide");
				$("#dialog-success").dialog("open");
			},
			error : function(data) {
				submit_div.prev("a").addClass("show").removeClass("hide");
				submit_div.removeClass("show").addClass("hide");
				$("#dialog-error").dialog("open");
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