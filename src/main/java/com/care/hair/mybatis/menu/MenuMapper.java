package com.care.hair.mybatis.menu;

import java.util.List;

import com.care.hair.menu.dto.MenuDTO;

public interface MenuMapper {
	public List<MenuDTO> getMenu();
	public List<MenuDTO> getMenuList();
}
