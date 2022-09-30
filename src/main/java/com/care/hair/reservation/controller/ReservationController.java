package com.care.hair.reservation.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.hair.common.SessionName;
import com.care.hair.reservation.dto.ReservationDTO;
import com.care.hair.reservation.service.ReservationService;

@Controller
@RequestMapping("reservation")
public class ReservationController {
	
	@Autowired ReservationService res;

	@GetMapping("infoChoice")
	public String infoChoice(@RequestParam int sNum, Model model) {
		res.shopInfo(sNum, model);

		return "menu/infoChoice";
	}

	@GetMapping("dateChoice")
	public String dateChoice(@RequestParam int mNum, Model model, HttpSession session) {

		res.menuSave(mNum,model, (String)session.getAttribute(SessionName.LOGIN));

		return "reservation/dateChoice";
	}


	@GetMapping(value = "/dateCheck", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<ReservationDTO> dateChk(@RequestParam String ymd, @RequestParam String sNum, Model model) {
		List<ReservationDTO> list = res.dateCheck(ymd, sNum);
		return list;
	}
	

	@PostMapping(value = "paymentComplete",
			produces = "application/json; charset=utf-8")
	@ResponseBody
	public void paymentComplete(@RequestBody Map<String, String> dto) {
		res.paymentComplete(dto);
	}




	/*	
	@PostMapping("check")
	public String check(ReservationDTO dto) {

		int result = res.check(dto);

		return "reservation/payment";
	}
	 */
}
