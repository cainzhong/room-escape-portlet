package com.haicai.portlet.controller;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.online.shopping.orange.pages.service.LoginService;

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;

	/*@RequestMapping(value = "/login.do")
	public String loginPage(
			@RequestParam(value = "userName", required = false) String userName,
			@RequestParam(value = "password", required = false) String password,
			Model model) {
		if (userName == null || password == null) {
			return "login";
		} else {
			boolean validUser = this.loginService.hasMatchedLoginUser(userName,
					password);
			if (validUser) {
				model.addAttribute("userName", userName);
				return "home";
			} else {
				model.addAttribute("error",
						"User name or password is incorrect!");
				return "login";
			}
		}
	}*/
	
	@RequestMapping(value="/login.do")
	public @ResponseBody String loginPage(@RequestParam(value = "userName", required = false) String userName, @RequestParam(value = "password", required = false) String password,Model model) {
		return userName;
	}

	@RequestMapping(value = "logoff.do")
	public String logOff(HttpServletRequest request) {
		Enumeration<?> enu = request.getSession().getAttributeNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			request.getSession().removeAttribute(name);
		}
		return "home";
	}

	@RequestMapping(value = "/register.do")
	public String registerPage(Model model) {
		return "register";
	}
}
