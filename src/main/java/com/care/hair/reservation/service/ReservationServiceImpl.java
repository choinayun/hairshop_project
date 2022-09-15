package com.care.hair.reservation.service;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.hair.mybatis.reservation.ReservationMapper;
import com.care.hair.reservation.dto.ReservationDTO;

@Service
public class ReservationServiceImpl 
					implements ReservationService{

	@Autowired ReservationMapper mapper;
	
	public void menuSave(int mNum, Model model) {
		model.addAttribute("dto", mapper.selectMenu(mNum));
		
	}

	public void reservDate(String r_date) {
		
		
	}

	


}
