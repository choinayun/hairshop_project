package com.care.hair.mypage.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface MypageService {

	public void main(Model model, String id);
	public String registerSave(MultipartHttpServletRequest mul,
							   HttpServletRequest request); 
	public void infoModify(String id, Model model);
	public void memberInfoModify(HttpServletRequest req);
	public void likeShop(Model model, String id);
	public void booking(String id, Model model);
	public void bookingModify(int status, int num); 
	public void bookingDel(int num);
	public void statusUpdate(int num);
	public void notice(Model model);
	public void noticeView(int num, Model model);
	public void delete(String id);
	public void history(Model model, String id);
	
}
