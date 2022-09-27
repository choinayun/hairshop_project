package com.care.hair;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.care.hair.shop.service.ShopService;

@Controller
public class HomeController {

	@Autowired ShopService ss;
	
	@RequestMapping("/")
	public String home(Model model) {
		ss.getHomeImg(model);
		return "home";
	}
}
