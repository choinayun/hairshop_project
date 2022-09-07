package com.care.hair.mybatis.member;

import java.util.List;

import org.springframework.ui.Model;

import com.care.hair.notice.dto.NoticeDTO;
import com.care.hair.registration.dto.RegistrationDTO;
import com.care.hair.reservation.dto.ReservationDTO;
import com.care.hair.shop.dto.ShopDTO;

public interface AdminMapper {
	public List<ShopDTO> shopinfo(Model model);
	public void delshop(String sNum);
	public List<RegistrationDTO>newshop(Model model);
	public void shopOK(String num);
	public void shopOKdel(String num);
	public List<ReservationDTO>reservation(Model model);
	public void Bmodify(ReservationDTO dto);
	public void bookingDel(String num);
	public void N_F(NoticeDTO dto);
	public ShopDTO getShop(int sNum);
	public void modify(ShopDTO dto);
}
