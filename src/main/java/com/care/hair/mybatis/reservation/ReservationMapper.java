package com.care.hair.mybatis.reservation;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.care.hair.menu.dto.MenuDTO;
import com.care.hair.reservation.dto.ReservationDTO;

public interface ReservationMapper {
	public void menuSave(Map<String, Object> map);
	
	public void reservationDate(String rDate);
	
	public MenuDTO selectMenu(int mNum);

	public List<ReservationDTO> dateCheck(@Param("ymd") String param1, @Param("sNum") int param2);

	public void paymentComplete(Map<String, String> dto);

	
	
	
	public void Bmodify(ReservationDTO dto);
	
	public ReservationDTO getReservation(int num);
	public void statusUpdate(@Param("num") int num, @Param("result") int result);
}