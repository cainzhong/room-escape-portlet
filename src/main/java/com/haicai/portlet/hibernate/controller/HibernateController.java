package com.haicai.portlet.hibernate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.haicai.domain.User;
import com.haicai.portlet.hibernate.service.HCHinernateService;

/**
 * Hello world!
 *
 */
@Controller
public class HibernateController 
{
	@Autowired
	private HCHinernateService hcHinernateService;
	
	@RequestMapping("hibernate.do")
	public String findUserAccount(String username,Model model) {
		List<User> userList=hcHinernateService.findAllUsers();
		model.addAttribute("userList", userList);
		return "hibernate_test";
	}
}
