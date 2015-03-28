package com.online.shopping.orange.hibernate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.online.shopping.orange.domain.UserAccount;
import com.online.shopping.orange.repository.service.OrangeRepository;

/**
 * Hello world!
 *
 */
@Controller
public class HibernateController 
{
	@Autowired
	private OrangeRepository orangeRepository;
	
	@RequestMapping("hibernate.do")
	public String findUserAccount(String username,Model model) {
		List<UserAccount> userAccountList=orangeRepository.findUserAccountByUserName(username);
		model.addAttribute("userAccountList", userAccountList);
		return "hibernate_test";
	}
}
