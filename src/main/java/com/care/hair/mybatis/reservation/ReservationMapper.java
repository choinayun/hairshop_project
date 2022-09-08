package com.care.hair.mybatis.reservation;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.care.hair.menu.dto.MenuDTO;
import com.care.hair.reservation.dto.ReservationDTO;

public interface ReservationMapper {
	public void menuSave(Map<String, Object> map);
	
	public void reservationDate(String r_date);
	
	public MenuDTO selectMenu(int mNum);
	
}
