package com.care.hair.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.hair.reservation.service.ReservationService;

@Controller
@RequestMapping("reservation")
public class ReservationController {
	@Autowired ReservationService res;

	@GetMapping("infoChoice")
	public String infoChoice() {
		
		return "menu/infoChoice";
	}
	
	@GetMapping("dateChoice")
	public String dateChoice(@RequestParam int mNum, Model model) {
		System.out.println("mNum : " + mNum);
		
		res.menuSave(mNum, model);
		
		return "reservation/dateChoice";
	}
	
/*	
	@PostMapping("check")
	public String check(ReservationDTO dto) {
		
		int result = res.check(dto);
		
		return "reservation/payment";
	}
*/
}
