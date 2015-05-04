package com.online.shopping.orange.pages.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	private ShoppingService ShoppingCartService;
	
	@RequestMapping("shoppingcart.do")
	public String shoppingCartPage(String username,Model model) {
		List<OrderedItem> orderedItemList=ShoppingCartService.findOrderedItemForUser(1L);
		model.addAttribute("orderedItemList", orderedItemList);
		return "shopping_cart";
	}
	
	@RequestMapping("buy.do")
	public String renderToShoppongCartPage(){
		return null;
	}
}
