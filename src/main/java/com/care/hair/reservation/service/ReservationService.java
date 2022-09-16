package com.care.hair.reservation.service;

import java.util.List;

import org.springframework.ui.Model;

import com.care.hair.reservation.dto.ReservationDTO;

public interface ReservationService {

	public void menuSave(int mNum, Model model);
	
	public List<ReservationDTO> dateCheck(String ymd, String sNum);

	public void shopInfo(int sNum, Model model);
	
	public int paymentComplete(ReservationDTO dto);
}
