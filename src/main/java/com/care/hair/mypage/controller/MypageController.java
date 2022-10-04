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

import com.care.hair.common.SessionName;
import com.care.hair.mypage.service.MypageService;
import com.care.hair.review.service.ReviewFileService;

@Controller
@RequestMapping("mypage")
public class MypageController {
	
	@Autowired MypageService ms;

	@GetMapping("/main")
	public String main(Model model, HttpSession session) {
		ms.main(model, (String)session.getAttribute(SessionName.LOGIN));
		return "mypage/main"; 
	}
	
	// 예약 리스트 불러오기 
	@GetMapping("/booking")
	public String booking(String id, Model model) {
		ms.booking(id, model);
		return "mypage/booking"; 
	}
	
	// 매장관리자 예약변경 
	@GetMapping("bookingModify")
	public String bookingModify(int status, int num, HttpSession session) {
		ms.bookingModify(status, num);
		return"redirect:booking?id=" + session.getAttribute(SessionName.LOGIN);
	}
	
	// 매장관리자 예약취소
	@GetMapping("bookingDel")
	public String bookingDel(int num, HttpSession session) {
		ms.bookingDel(num);
		return"redirect:booking?id=" + session.getAttribute(SessionName.LOGIN);
	}
	
	@GetMapping("statusUpdate")
	public String statusUpdate(int num, String id) {
	    ms.statusUpdate(num);
	    return"redirect:history?id="+id;
	}
	
	@GetMapping("/history")
	public String history(Model model, @RequestParam String id) {
		ms.history(model, id);
		return "mypage/history"; 
	}
	
	// 회원정보 수정 (저장된 정보 불러오기) 
	@GetMapping("/infoModify")
	public String infoModify(String id, Model model) {
		ms.infoModify(id, model);
		return "mypage/infoModify"; 
	}
	
	// 회원정보 수정 저장하기 
	@PostMapping("/memberInfoModify")
	public String memberInfoModify(HttpServletRequest req) {
		ms.memberInfoModify(req);
		return "redirect:main"; 
	}
	
	@GetMapping("/likeShop")
	public String likeShop(@RequestParam String id, Model model) {
		ms.likeShop(model, id);
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
