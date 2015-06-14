package com.room.escape.portlet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Cain
 * 
 */
@Controller
public class HomeController {
	@RequestMapping(value = { "/", "/home" })
	public String renderToHomePage(Model model) {
		return "home";
	}

}
