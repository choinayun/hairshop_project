package com.care.hair.qna.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.hair.qna.dto.QnaDTO;
import com.care.hair.qna.service.QnaService;

@Controller
@RequestMapping("/qna")
public class QnaController {
	
	@Autowired QnaService qs;
	
	@GetMapping("/qnaForm")
	public String qna() {
		return "qna/qnaForm";
	}
	
	@PostMapping("/qnaSave")
	public void qnaSave(MultipartHttpServletRequest mul,
						HttpServletResponse response,
						HttpServletRequest request) throws Exception {
		
		String qna = qs.qnaSave(mul, request);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print( qna );
	}
	@GetMapping("/qnaList")
	public String qnaList(Model model) {
		qs.list(model);
		
		return"qna/qnaList";
	}
	@GetMapping("contentView")
	public String contentView(int num,Model model) {
		qs.contentView(num,model);
		qs.replyView(num, model);
		System.out.println(model);
		System.out.println(num);
		return "qna/contentView";
	}
	
	@PostMapping("reply")
	public String replySave(QnaDTO dto) {
		qs.replySave(dto);
		return "redirect:contentView?num=" + dto.getNum();
	}
	@GetMapping("replyView")
	public String replyView(int num,Model model) {
		qs.replyView(num,model);
		return"redirect:contentView";
	}
	

	
}
