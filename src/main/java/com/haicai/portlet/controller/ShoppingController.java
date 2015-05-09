package com.haicai.portlet.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.online.shopping.orange.domain.OrderedItem;
import com.online.shopping.orange.pages.service.ShoppingService;


/**
 * @author Cain
 *
 */
@Controller
public class ShoppingController
{
	@Autowired
	private ShoppingService shoppingService;

	@RequestMapping("shoppingcart.do")
	public String shoppingCartPage(@RequestParam long userAccountId,String username,Model model) {
		List<OrderedItem> orderedItemList=this.shoppingService.findOrderedItemForUser(userAccountId);
		model.addAttribute("orderedItemList", orderedItemList);
		return "shoppingCart";
	}

	@RequestMapping(value="/buy.do")
	public @ResponseBody String renderToShoppongCartPage(@RequestParam(value = "userAccountId", required = false) String userAccountId, Model model) {
		return "shoppingCart";
	}

}
