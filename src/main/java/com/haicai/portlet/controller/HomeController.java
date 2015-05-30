package com.haicai.portlet.controller;

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

	@RequestMapping(value = "detail", params = "productId")
	public String renderToProductDetailPage(String productId) {
		String detailPage = null;
		switch (productId) {
		case "10001":
			detailPage = "productDetail";
			break;
		case "10002":
			detailPage = "productDetail";
			break;
		case "10003":
			detailPage = "productDetail";
			break;
		case "10004":
			detailPage = "productDetail";
			break;
		case "10005":
			detailPage = "productDetail";
			break;
		case "10006":
			detailPage = "productDetail";
			break;
		case "10007":
			detailPage = "productDetail";
			break;
		case "10008":
			detailPage = "productDetail";
			break;
		case "10009":
			detailPage = "productDetail";
			break;
		case "10010":
			detailPage = "productDetail";
			break;
		case "10011":
			detailPage = "productDetail";
			break;
		case "10012":
			detailPage = "productDetail";
			break;
		default:
			detailPage = "home";
			break;
		}
		return detailPage;
	}
}
