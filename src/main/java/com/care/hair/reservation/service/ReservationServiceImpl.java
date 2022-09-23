package com.care.hair.reservation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.hair.mybatis.reservation.ReservationMapper;

@Service
public class ReservationServiceImpl 
					implements ReservationService{

	@Autowired ReservationMapper mapper;
	
	public void menuSave(int mNum, Model model) {
		try {
			model.addAttribute("dto", mapper.selectMenu(mNum));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
