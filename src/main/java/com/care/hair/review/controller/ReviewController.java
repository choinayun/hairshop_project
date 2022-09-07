package com.care.hair.review.controller;

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
	
	@GetMapping("reviewListForm")
	public String reviewListForm(@RequestParam int sNum, Model model) {
		rs.getReviewList(sNum, model);
		return "review/reviewListForm";
	}
}
