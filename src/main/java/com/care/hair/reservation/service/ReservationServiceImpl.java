package com.care.hair.reservation.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.hair.mybatis.reservation.ReservationMapper;
import com.care.hair.mybatis.shop.ShopMapper;
import com.care.hair.reservation.dto.ReservationDTO;
import com.care.hair.shop.dto.ShopDTO;

@Service
public class ReservationServiceImpl 
					implements ReservationService{

	@Autowired ReservationMapper mapper;
	@Autowired ShopMapper shopMapper;
	
	public void menuSave(int mNum, Model model) {
		try {
		 model.addAttribute("dto", mapper.selectMenu(mNum));
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void shopInfo(int sNum, Model model) {
		try {
			ShopDTO dto = shopMapper.getShopInfo(sNum);
			model.addAttribute("shopInfo", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	public List<ReservationDTO> dateCheck(String ymd, String sNum) {
		System.out.println("ymd >>>" + ymd);
		try {
			return mapper.dateCheck(ymd, sNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int paymentComplete(ReservationDTO dto) {
		
		try {
			return mapper.paymentComplete( dto );
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

}
