package com.care.hair.mybatis.reservation;

import java.util.List;
import java.util.Map;


import com.care.hair.menu.dto.MenuDTO;
import com.care.hair.reservation.dto.ReservationDTO;

public interface ReservationMapper {
	public void menuSave(Map<String, Object> map);
	
	public void reservationDate(String rDate);
	
	public MenuDTO selectMenu(int mNum);

	public List<ReservationDTO> dateCheck(String param1, String param2);

	public int paymentComplete(ReservationDTO dto);
	
}
