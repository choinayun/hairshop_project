package com.care.hair.menu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.care.hair.menu.service.MenuService;

@Controller
@RequestMapping("menu")
public class MenuController {
	@Autowired MenuService me;
	
	@GetMapping("infoChoice")
	public String infoChoice(Model model) {
		me.getMenu(model);
		
		return "reservation/infoChoice";
	}
	
}
