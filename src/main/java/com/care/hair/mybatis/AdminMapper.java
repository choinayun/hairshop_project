package com.care.hair.mybatis;

import java.util.List;

import org.springframework.ui.Model;

import com.care.hair.member.dto.memberShopDTO;
import com.care.hair.member.dto.noticeDTO;
import com.care.hair.member.dto.registrationDTO;
import com.care.hair.member.dto.reservationDTO;

public interface AdminMapper {
	public List<memberShopDTO> shopinfo(Model model);
	public void delshop(String s_num);
	public List<registrationDTO>newshop(Model model);
	public void shopOK(String num);
	public void shopOKdel(String num);
	public List<reservationDTO>reservation(Model model);
	public void Bmodify(reservationDTO dto);
	public void bookingDel(String num);
	public void N_F(noticeDTO dto);
	public memberShopDTO getShop(int s_num);
	public void modify(memberShopDTO dto);
}
