package com.online.shopping.orange.pages.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * @author Cain
 *
 */
@Controller
public class HomeController
{
	@RequestMapping("home.do")
	public String findUserAccount(String username,Model model) {
		return "home";
	}
}
