package com.care.hair.review.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

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

import com.care.hair.review.service.ReviewFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.hair.review.service.ReviewService;

@Controller
@RequestMapping("review")
public class ReviewController {

	@Autowired ReviewService rs;

	@GetMapping("reviewAllList")
	public String reviewAllList(Model model,
					@RequestParam(value="num", required=false, defaultValue="1") int num) {
		rs.reviewAllList( model, num );
		
		return "review/reviewAllList";
	}
	
	@GetMapping("reviewForm")
	public String reviewForm(Model model, @RequestParam int num, @RequestParam int sNum) {
		rs.reviewForm(model, num, sNum);
		return "review/reviewForm";
	}
	
	// 리뷰 저장하기 
	@PostMapping("reviewSave")
	public void reviewSave(MultipartHttpServletRequest mul,
						   HttpServletResponse response,
						   HttpServletRequest request) throws Exception {
		
		String message = rs.reviewSave(mul, request);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print( message );
	}
	
	// 리뷰 상세내용 (사진 불러오기) 
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
	
	// 리뷰 삭제하기 
	@GetMapping("delete")
	public void delete(int num, String img, 
					   HttpServletResponse response,
					   HttpServletRequest request ) throws IOException {
		
		String msg = rs.delete(num, img, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print( msg );
	}
	
	// 리뷰 상세보기 
	@GetMapping("contentView")
	public String contentView(int num, Model model) {
		
		rs.contentView( num, model ); 
		
		return "review/contentView"; 
	}

	
	
	// 성근이 작업
	@GetMapping("reviewListForm")
	public String reviewListForm(@RequestParam int sNum, Model model) {
		rs.getReviewList(sNum, model);
		return "review/reviewListForm";
	}
}
