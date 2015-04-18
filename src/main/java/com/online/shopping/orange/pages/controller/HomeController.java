package com.online.shopping.orange.pages.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.online.shopping.orange.domain.UserAccount;
import com.online.shopping.orange.hibernate.service.OrangeHinernateService;

/**
 * Hello world!
 *
 */
@Controller
public class HomeController 
{
//	@Autowired
//	private OrangeHinernateService orangeHinernateService;
	
	@RequestMapping("home.do")
	public String findUserAccount(String username,Model model) {
//		List<UserAccount> userAccountList=orangeHinernateService.findUserAccountByUserName(username);
//		model.addAttribute("userAccountList", userAccountList);
		return "home";
	}
}
