package com.care.hair.reservation.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.hair.payment.service.PaymentService;
import com.care.hair.reservation.dto.ReservationDTO;
import com.care.hair.reservation.service.ReservationService;

@Controller
@RequestMapping("reservation")
public class ReservationController {
	@Autowired ReservationService res;

	
	
	@GetMapping("infoChoice")
	public String infoChoice(@RequestParam int sNum, Model model) {
		System.out.println("mNum : " + sNum);
		
		res.shopInfo(sNum, model);
		
		return "menu/infoChoice";
	}
	
	@GetMapping("dateChoice")
	public String dateChoice(@RequestParam int mNum, Model model) {
		System.out.println("mNum : " + mNum);
		
		res.menuSave(mNum,model);
		
		return "reservation/dateChoice";
	}
	
	
	@GetMapping("/dateCheck")
	@ResponseBody
	public List<ReservationDTO> dateChk(@Param("ymd") String ymd, @Param("sNum") String sNum, Model model) {
		List<ReservationDTO> list = res.dateCheck(ymd, sNum);
		return list;
		
	}

	

/*	
	@PostMapping("check")
	public String check(ReservationDTO dto) {
		
		int result = res.check(dto);
		
		return "reservation/payment";
	}
*/
}
