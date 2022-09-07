package com.care.hair.member.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.hair.member.dto.noticeDTO;

public interface AdminService {
	String IMAGE_REPO="c:/spring/image_repo";
	public void shopinfo(Model model);
	public void delshop(String s_num);
	public void newshop(Model model);
	public void shopOK(String num,String id,Model model);
	public void shopNO(String num);
	public void reservation(Model model);
	public void Bmodify(int status, int num);
	public void modifyForm(int s_num,Model model);
	public void sendmail(Model model);
	public void bookingDel(String num);
	public void N_F(MultipartHttpServletRequest mul);
	public void modify(MultipartHttpServletRequest mul);

}
