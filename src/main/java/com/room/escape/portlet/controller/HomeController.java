package com.room.escape.portlet.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.room.escape.portlet.domain.Ticket;
import com.room.escape.portlet.service.PortletService;

/**
 * @author Cain
 *
 */
@Controller
public class HomeController {

	@Autowired
	private PortletService portletService;

	private final String[] weekDayArray = { "T_SUNDAY", "T_MONDAY", "T_TUESDAY", "T_WEDNESDAY", "T_THURSDAY", "T_FRIDAY", "T_SATURDAY" };

	@RequestMapping(value = { "/", "/home" })
	public String renderToHomePage(Model model) {
		return "home";
	}

	@RequestMapping(value = "/order")
	public String renderToOrderPage(@RequestParam String ticketName, Model model) {
		Date today = new Date();
		List<Ticket> tickets = this.portletService.findTicketsByTimeAndTicketName(ticketName, this.formatDate(today));

		model.addAttribute("tickets", tickets);
		model.addAttribute("dayWeekMap", this.getDateBar());
		return "order";
	}

	@RequestMapping(value = "/ajaxOrder", method = RequestMethod.POST)
	public @ResponseBody
	String renderToOrderPage(@RequestParam(value = "ticketName", required = false) String ticketName, @RequestParam(value = "date", required = false) String date) {
		List<Ticket> tickets = null;

		if (StringUtils.isEmpty(date)) {
			Date today = new Date();
			tickets = this.portletService.findTicketsByTimeAndTicketName(ticketName, this.formatDate(today));
		} else {
			tickets = this.portletService.findTicketsByTimeAndTicketName(ticketName, date);
		}

		return "order";
	}

	/**
	 * Set up the date bar above the book table.
	 *
	 * @return
	 */
	private Map<String, String> getDateBar() {
		Date today = new Date();
		String weekDay = this.getWeekOfDate(today);
		/*
		 * Map: Key - week, eg. "Sunday", "Monday", "Tuesday", "Wednesday",
		 * "Thursday", "Friday", "Saturday" ; Value - day, eg. 2015-06-22
		 */
		Map<String, String> dayWeekMap = new LinkedHashMap<String, String>();

		// add 7 days(a week) to the map.
		dayWeekMap.put(weekDay, this.formatDate(today));
		for (int i = 0; i < 6; i++) {
			dayWeekMap.put(this.getWeekOfDate(this.incrementDate(today, i + 1)), this.formatDate(this.incrementDate(today, i + 1)));
		}

		return dayWeekMap;
	}

	/**
	 * get the week of a date. eg. 'Monday','Sunday'
	 *
	 *
	 * @param date
	 * @return
	 */
	private String getWeekOfDate(Date date) {
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(date);
		int week = calendar.get(Calendar.DAY_OF_WEEK) - 1;
		if (week < 0) {
			week = 0;
		}
		return this.weekDayArray[week];
	}

	/**
	 * increment a date by 'interval' day. eg. 2015-06-22 -> 2015-06-23
	 *
	 * @param startDate
	 * @param interval
	 * @return
	 */
	private Date incrementDate(Date startDate, int interval) {
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DATE, interval);
		return c.getTime();
	}

	/**
	 * format a date to parretn "yyyy-MM-dd". eg. 2015-06-22
	 *
	 * @param date
	 * @return
	 */
	private String formatDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.CHINA);
		return sdf.format(date);
	}

}
