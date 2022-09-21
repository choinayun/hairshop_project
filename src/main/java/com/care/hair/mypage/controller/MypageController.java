package com.care.hair.mypage.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.hair.mypage.service.MypageService;
import com.care.hair.review.service.ReviewFileService;

@Controller
@RequestMapping("mypage")
public class MypageController {
	
	@Autowired MypageService ms;

	@GetMapping("/main")
	public String main() {
		return "mypage/main"; 
	}
	
	@GetMapping("/booking")
	public String booking(Model model) {
		ms.reservationCheck(model);
		return "mypage/booking"; 
	}
	
	@PostMapping("/bookingStatus")
	public String bookingStatus() {
		return "redirect:booking"; 
	}
	
	@GetMapping("statusUpdate")
	public String statusUpdate(int num) {
	    ms.statusUpdate(num);
	    return"redirect:history";
	}
	
	@GetMapping("/history")
	public String history(Model model) {
		ms.history(model);
		return "mypage/history"; 
	}
	
	// 회원정보 수정 (저장된 정보 불러오기) 
	@GetMapping("/infoModify")
	public String infoModify(String id , Model model) {
		ms.infoModify( id, model );
		return "mypage/infoModify"; 
	}
	
	// 회원정보 수정 저장하기 
	@PostMapping("/memberInfoModify")
	public String memberInfoModify(HttpServletRequest req) {
		ms.memberInfoModify(req);
		return "redirect:main"; 
	}
	
	@GetMapping("/likeShop")
	public String likeShop() {
		return "mypage/likeShop";
	}
	
	@GetMapping("/notice")
	public String notice(Model model) {
		ms.notice(model);
		return "mypage/notice";
	}
	
	@GetMapping("/noticeView")
	public String noticeView(int num, Model model) {
		
		ms.noticeView( num, model ); 
		return "mypage/noticeView"; 
	}
	

	@GetMapping("/registerShop") 
	public String register() {
		return "mypage/registerShop"; 
	} 
	
	// 입점 신청서 저장하기 
	@PostMapping("/registerSave")
	public void registerSave(MultipartHttpServletRequest mul,
							 HttpServletResponse response, 
							 HttpServletRequest request) throws Exception {
		
		String rsave = ms.registerSave(mul, request);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print( rsave );
	}
	
	@GetMapping("/secession")
	public String secession() {
		return "mypage/secession"; 
	}
	
	@GetMapping("/delete")
	public String delete(String id, HttpSession session) {
		ms.delete(id);
		session.invalidate();
		return "redirect:../";
	}
	
	@GetMapping("download")
	public void download(@RequestParam("img") String img,
				HttpServletResponse response) throws IOException {
		
	    response.addHeader(
	    			"Content-disposition","attachment;fileName="+img);
	    File file = new File(ReviewFileService.IMAGE_REPO+"/"+img);
	    FileInputStream in = new FileInputStream(file);
	    FileCopyUtils.copy(in, response.getOutputStream());
	    in.close();
	}
	
	
	
}
