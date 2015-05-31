$(document).ready(function() {

	// edit profile
	$("#basic_info_edit_btn").click(function() {
		var odd_td = $("#basic_info tbody td:odd");
		odd_td.each(function() {
			if ($(this).attr('id') == "current_region") {
				// break current loop
				return true;
			}
			var inputobj = $("<input type='text'>");
			var tdobj = $(this);
			var text = tdobj.html();
			tdobj.html("");
			inputobj.val(text).appendTo(tdobj);
		});

		$("#current_region_view").addClass("hide");
		$("#current_region_edit").removeClass("hide");

		$("#basic_info_edit_btn").css("pointer-events", "none");
		$("#basic_info_submit").css("display", "block");
	});

	// trigger when the page on load.
	changeCountryCity();

	// cascade drop down list.
	$("#current_region_edit .current_country_edit").change(function() {
		changeCountryCity();
	});
	function changeCountryCity() {
		$("#current_region_edit .current_country_edit option").each(function() {
			if ($(this).is(":selected")) {
				var option_val = $(this).val();
				$(".current_city_edit").hide();
				var select_id = "#current_region_edit" + " ." + option_val;
				$(select_id).show();
			}
		});
	}

	// submit profile, invoke the controller through ajax
	$('#basic_info_submit_btn').click(function() {
		var current_country_edit_val = $("#current_region_edit .current_country_edit").val();
		var current_city_edit_id = "#current_region_edit" + " ." + current_country_edit_val;
		var current_city_edit_val = $(current_city_edit_id).val();

		$.ajax({
			type : 'POST',
			url : 'editBasicInfo',
			dataType : "text",
			data : {
				"username" : $("#username").text(),
				"realName" : $("#real_name :first-child").val(),
				"englishName" : $("#english_name :first-child").val(),
				// TODO
				"currentCountry" : current_country_edit_val,
				"currentCity" : current_city_edit_val,
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

	// edit personal history.
	$("a[name='personal_history_edit_btn']").each(function() {
		$(this).click(function() {
			var personal_history_id = $(this).next("a").next("span").text();

			// store university_degree value
			var university_degree_id = "#personal_history_table" + personal_history_id + " .university_degree";
			var university_degree_val = $(university_degree_id).html();
			var university_degree_td = $(university_degree_id);
			// store graduation_year value
			var graduation_year_id = "#personal_history_table" + personal_history_id + " .graduation_year";
			var graduation_year_val = $(graduation_year_id).html();
			var graduation_year_td = $(graduation_year_id);

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
			$(this).next("a").hide();
			$("#personal_history_submit" + personal_history_id).css("display", "block");

			// get drop down values from property files for university degree.
			$.ajax({
				type : 'POST',
				url : 'getDropDownValsFromProperties',
				dataType : "json",
				data : {
					"regex" : "T_UNIVERSITY_DEGREE_"
				},
				success : function(data) {
					var selectobj = $("<select>");
					$.each(data, function(i, item) {
						selectobj.append("<option value=" + item.key + ">" + item.value + "</option>");
					});
					selectobj.append("</select>");
					university_degree_td.html("");
					selectobj.appendTo(university_degree_td);
					var select_id = university_degree_id + " select option:contains(" + university_degree_val + ")";
					$(select_id).map(function() {
						if ($(this).text() == university_degree_val) {
							$(this).attr("selected", "selected");
						}
					});

				},
				error : function(data) {
					$("#dialog-ajax-error").dialog("open");
				}
			});

			// get drop down values form property files for graduation year.
			$.ajax({
				type : 'POST',
				url : 'getDropDownValsFromProperties',
				dataType : "json",
				data : {
					"regex" : "T_YEAR_"
				},
				success : function(data) {
					var selectobj = $("<select>");
					$.each(data, function(i, item) {
						selectobj.append("<option value=" + item.key + ">" + item.value + "</option>");
					});
					selectobj.append("</select>");
					graduation_year_td.html("");
					selectobj.appendTo(graduation_year_td);
					var select_id = graduation_year_id + " select option:contains(" + graduation_year_val + ")";
					$(select_id).map(function() {
						if ($(this).text() == graduation_year_val) {
							$(this).attr("selected", "selected");
						}
					});
				},
				error : function(data) {
					$("#dialog-ajax-error").dialog("open");
				}
			});

		});
	});

	// submit personal history, invoke the controller through ajax
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
			url : 'editPerHistory',
			dataType : "text",
			data : {
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
		var award_tr_id = $(this).parent().parent().attr('id');
		var award_type_td = $(this).parent().prev("td").prev("td");
		var award_description_td = $(this).parent().prev("td");

		var award_type_val = award_type_td.html();

		// get drop down values from property files for award type.
		$.ajax({
			type : 'POST',
			url : 'getDropDownValsFromProperties',
			dataType : "json",
			data : {
				"regex" : "T_AWARD_"
			},
			success : function(data) {
				var selectobj = $("<select>");
				$.each(data, function(i, item) {
					selectobj.append("<option value=" + item.key + ">" + item.value + "</option>");
				});
				selectobj.append("</select>");
				award_type_td.html("");
				selectobj.appendTo(award_type_td);
				var select_id = "#" + award_tr_id + " .award_type select option:contains(" + award_type_val + ")";
				$(select_id).map(function() {
					if ($(this).text() == award_type_val) {
						$(this).attr("selected", "selected");
					}
				});
			},
			error : function(data) {
				$("#dialog-ajax-error").dialog("open");
			}
		});

		var input_award_description = $("<input type='text'>");
		var award_description_val = award_description_td.html();
		award_description_td.html("");
		input_award_description.val(award_description_val).appendTo(award_description_td);

		$(this).hide();
		$(this).next("a").hide();
		$(this).next("a").next("div").show();
	});

	// submit award, invoke the controller through ajax
	$("a[name='award_submit_btn']").click(function() {
		var submit_div = $(this).parent();
		var award_id = submit_div.next("span").text();
		$.ajax({
			type : 'POST',
			url : 'editAward',
			dataType : "text",
			data : {
				"awardId" : award_id,
				"awardType" : $(this).parent().parent().prev("td").prev("td").children(":first").val(),
				"awardDescription" : $(this).parent().parent().prev("td").children(":first").val()
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

	/* For reference only */
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
	/* For reference only */
	
	$("a[name='personal_history_add_btn']").click(function(){
		$("#dialog_add_personal_history").dialog("open");
		
		// get drop down values from property files for university degree.
		var university_degree_div = $("#add_personal_history .university_degree");
		$.ajax({
			type : 'POST',
			url : 'getDropDownValsFromProperties',
			dataType : "json",
			data : {
				"regex" : "T_UNIVERSITY_DEGREE_"
			},
			success : function(data) {
				var selectobj = $("<select name='graduation_year'>");
				$.each(data, function(i, item) {
					selectobj.append("<option value=" + item.key + ">" + item.value + "</option>");
				});
				selectobj.append("</select>");
				selectobj.appendTo(university_degree_div);
			},
			error : function(data) {
				$("#dialog-ajax-error").dialog("open");
			}
		});

		// get drop down values form property files for graduation year.
		var graduation_year_div = $("#add_personal_history .graduation_year");
		$.ajax({
			type : 'POST',
			url : 'getDropDownValsFromProperties',
			dataType : "json",
			data : {
				"regex" : "T_YEAR_"
			},
			success : function(data) {
				var selectobj = $("<select name='graduation_year'>");
				$.each(data, function(i, item) {
					selectobj.append("<option value=" + item.key + ">" + item.value + "</option>");
				});
				selectobj.append("</select>");
				selectobj.appendTo(graduation_year_div);
			},
			error : function(data) {
				$("#dialog-ajax-error").dialog("open");
			}
		});
	});
	

});