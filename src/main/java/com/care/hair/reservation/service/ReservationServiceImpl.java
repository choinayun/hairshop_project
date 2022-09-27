package com.care.hair.reservation.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.hair.member.dto.MemberDTO;
import com.care.hair.mybatis.member.MemberMapper;
import com.care.hair.mybatis.reservation.ReservationMapper;
import com.care.hair.mybatis.shop.ShopMapper;
import com.care.hair.reservation.dto.ReservationDTO;
import com.care.hair.shop.dto.ShopDTO;

@Service
public class ReservationServiceImpl 
					implements ReservationService{

	@Autowired ReservationMapper mapper;
	@Autowired ShopMapper shopMapper;
	@Autowired MemberMapper memberMapper;
	
	public void menuSave(int mNum, Model model, String id) {
		try {
			model.addAttribute("dto", mapper.selectMenu(mNum));
			model.addAttribute("phone", memberMapper.getPhone(id));
			model.addAttribute("name",memberMapper.getName(id));
			model.addAttribute("email",memberMapper.getemail(id));
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
			return mapper.dateCheck(ymd, Integer.parseInt(sNum));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void paymentComplete(Map<String, String> dto) {
		try {
			mapper.paymentComplete( dto );
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void getPhone(String id, Model model) {
		MemberDTO dto = memberMapper.getUser(id);
		model.addAttribute("getPhone", dto);
	}
	public void getName(String id, Model model) {
		MemberDTO dto = memberMapper.getUser(id);
		model.addAttribute("getName", dto);
	}
	public void getemail(String id, Model model) {
		MemberDTO dto = memberMapper.getUser(id);
		model.addAttribute("getemail", dto);
	}


}
