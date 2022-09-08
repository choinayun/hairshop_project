package com.care.hair.mybatis.reservation;

import java.util.Map;


import com.care.hair.menu.dto.MenuDTO;

public interface ReservationMapper {
	public void menuSave(Map<String, Object> map);
	
	public void reservationDate(String rDate);
	
	public MenuDTO selectMenu(int mNum);
	
}
