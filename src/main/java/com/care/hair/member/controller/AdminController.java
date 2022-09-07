package com.care.hair.member.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.hair.member.dto.noticeDTO;
import com.care.hair.member.service.AdminService;

@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired AdminService as;

	@GetMapping("admin")
	public String damin() {
		
		return"admin/admin";
	}
	
	@GetMapping("shoplist")
	public String shoplist(Model model) {
		as.shopinfo(model);
		return"admin/shoplist";
	}
	@GetMapping("modifyshop")
	public String modifyshop(int s_num,Model model) {
		as.modifyForm(s_num,model);
		return"admin/modifyshop";
	}
	@GetMapping("deleteshop")
	public String deleteshop(String s_num) {
		as.delshop(s_num);
		return"redirect:shoplist";
	}
	
	@GetMapping("newshop")
	public String newshop(Model model) {
		as.newshop(model);
		
		return"admin/newshop";
	}
	@GetMapping("newshopOK")
	public String newshopOK(String num,String id,Model model) {
		as.shopOK(num,id,model);
		as.sendmail(model);
		return"redirect:newshop";
	}
	@GetMapping("newshopNO")
	public String newshopNO(String num) {
		as.shopNO(num);
		return"redirect:newshop";
	}
	@GetMapping("reservation")
	public String reservation(Model model) {
		as.reservation(model);
		return"admin/reservation";
	}
	@GetMapping("bookingModify")
	public String bookingModify(int status, int num) {
		as.Bmodify(status,num);
		return"redirect:reservation";
	}
	
	@GetMapping("bookingDel")
	public String bookingDel(String num) {
		as.bookingDel(num);
		return"redirect:reservation";
	}
	@GetMapping("noticeWrite")
	public String noticeWrite() {
		return"admin/noticeWrite";
	}
	@PostMapping("N_F")
	public String N_F(MultipartHttpServletRequest mul) {
		as.N_F(mul);
		return"redirect:admin";
	}
	@PostMapping("modify")
	public String modify(MultipartHttpServletRequest mul) {
		as.modify(mul);
		return "redirect:shoplist";
		
	}
	@GetMapping("download")
	public void download(@RequestParam("img") String imageFileName,
				HttpServletResponse rep) throws IOException {
	    rep.addHeader(
		"Content-disposition","attachment;fileName="+imageFileName);
	    File f = new File(AdminService.IMAGE_REPO+"/"+imageFileName);
	    FileInputStream in = new FileInputStream(f);
	    FileCopyUtils.copy(in, rep.getOutputStream());
	    in.close();
	}
}
