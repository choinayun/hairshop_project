package com.care.hair.reservation.service;

import org.springframework.ui.Model;

public interface ReservationService {

	public void menuSave(int mNum, Model model);
	
	public void reservDate(String r_date);
}
