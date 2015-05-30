$(document).ready(function() {

	// edit profile
	$("#basic_info_edit_btn").click(function() {
		// store university_degree value
		var current_country_id = "#basic_info" + " .current_country";
		var current_city_id = "#basic_info" + " .current_city";
		var current_country_val = $(current_country_id).html();
		var current_city_val = $(current_city_id).html();
		
		var current_region_td = $("#current_region");
		
		var odd_td = $("#basic_info tbody td:odd");
		odd_td.each(function() {
			var inputobj = $("<input type='text'>");
			var tdobj = $(this);
			var text = tdobj.html();
			tdobj.html("");
			inputobj.val(text).appendTo(tdobj);
		});
		
		// get drop down values from property files for country and city.
		$.ajax({
			type : 'POST',
			url : 'getCountryDropDownValsFromProperties',
			dataType : "json",
			data : {
			},
			success : function(data) {
				var selectobj = $("<select>");
				$.each(data, function(i, item) {
					selectobj.append("<option value=" + item.key + ">" + item.value + "</option>");
				});
				selectobj.append("</select>");
				current_region_td.html("");
				selectobj.appendTo(current_region_td);
				var select_id = current_region_td + " select option:contains(" + current_country_val + ")";
				$(select_id).map(function() {
					if ($(this).text() == current_country_val) {
						$(this).attr("selected", "selected");
					}
				});
				
				// get drop down values from property files for city.
				$.ajax({
					type : 'POST',
					url : 'getCityDropDownValsFromProperties',
					dataType : "json",
					data : {
					},
					success : function(data) {
						var selectobj = $("<select>");
						$.each(data, function(i, item) {
							selectobj.append("<option value=" + item.key + ">" + item.value + "</option>");
						});
						selectobj.append("</select>");
						selectobj.appendTo(current_region_td);
						var select_id = current_city_id + " select option:contains(" + current_city_val + ")";
						$(select_id).map(function() {
							if ($(this).text() == current_city_val) {
								$(this).attr("selected", "selected");
							}
						});

					},
					error : function(data) {
						$("#dialog-ajax-error").dialog("open");
					}
				});

			},
			error : function(data) {
				$("#dialog-ajax-error").dialog("open");
			}
		});
		
		$("#basic_info_edit_btn").css("pointer-events", "none");
		$("#basic_info_submit").css("display", "block");
	});

	// submit profile, invoke the controller through ajax
	$('#basic_info_submit_btn').click(function() {
		$.ajax({
			type : 'POST',
			url : 'editBasicInfo',
			dataType : "text",
			data : {
				"username" : $("#username").text(),
				"realName" : $("#real_name :first-child").val(),
				"englishName" : $("#english_name :first-child").val(),
				//TODO
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

	// edit personal history.
	$("a[name='personal_history_edit_btn']").each(function() {
		$(this).click(function() {
			var personal_history_id = $(this).next("span").text();

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

		$(this).addClass("hide");
		$(this).next("div").removeClass("hide");
		$(this).next("div").addClass("show");
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