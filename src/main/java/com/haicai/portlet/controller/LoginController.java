package com.haicai.portlet.controller;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.haicai.portlet.service.LoginService;

@Controller
public class LoginController {

	private static Logger logger = Logger.getLogger(LoginController.class);

	@Autowired
	private LoginService loginService;
//
//	@RequestMapping(value = "/login.do")
//	public @ResponseBody
//	String loginPage(@RequestParam(value = "username", required = false) String username, @RequestParam(value = "password", required = false) String password, Model model) {
//		boolean validUser = this.loginService.hasMatchedLoginUser(username, password);
//		if (validUser) {
//			return username;
//		} else {
//			model.addAttribute("error", "User name or password is incorrect!");
//			return "error";
//		}
//
//	}

	/**
	 * Render to login page.
	 *
	 * @param username
	 * @param password
	 * @param error
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String getloginPage(@RequestParam(value = "username", required = false) String username, @RequestParam(value = "password", required = false) String password, @RequestParam(value = "error", required = false) boolean error, Model model) {
		LoginController.logger.debug("Received request to show login page.");

		if (error == true) {
			// Assign an error message
			model.addAttribute("error", "You have entered an invalid username or password!");
		} else {
			model.addAttribute("error", "");
		}
		return "login";
	}

	/**
	 * Render to access denied page.
	 *
	 * @return
	 */
	@RequestMapping(value = "/denied.do", method = RequestMethod.GET)
	public String getDeniedPage() {
		return "403";
	}

	/**
	 * Log off and return to home page.
	 *
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "logoff.do")
	public String logOff(HttpServletRequest request) {
		Enumeration<?> enu = request.getSession().getAttributeNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			request.getSession().removeAttribute(name);
		}
		return "home";
	}
}
