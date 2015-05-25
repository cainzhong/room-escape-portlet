package com.haicai.portlet.controller;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.haicai.portlet.service.LoginService;

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;

//	@RequestMapping(value = "/login.do")
//	public @ResponseBody
//	String loginPage(@RequestParam(value = "userName", required = false) String username, @RequestParam(value = "password", required = false) String password, Model model) {
//		boolean validUser = this.loginService.hasMatchedLoginUser(username, password);
//		if (validUser) {
//			return username;
//		} else {
//			model.addAttribute("error", "User name or password is incorrect!");
//			return "error";
//		}
//
//	}

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
