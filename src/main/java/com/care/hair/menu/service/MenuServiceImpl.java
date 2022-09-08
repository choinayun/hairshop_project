package com.care.hair.menu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.hair.mybatis.menu.MenuMapper;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired MenuMapper mapper;
	
	@Override
	public void getMenuList(Model model) {
		try {
			model.addAttribute("menuList", mapper.getMenuList());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
