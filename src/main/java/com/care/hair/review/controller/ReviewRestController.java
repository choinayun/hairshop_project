package com.care.hair.review.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.care.hair.review.dto.ReviewDTO;
import com.care.hair.review.service.ReviewService;

@RestController
@RequestMapping("review")
public class ReviewRestController {

	@Autowired ReviewService rs; 
	
	@GetMapping("getReviewCnt")
	public String getReviewCnt(@RequestParam int sNum) {
		return rs.getReviewCnt(sNum);
	}
	
	@GetMapping(value = "getGradeCnt", produces = "application/json; charset=utf-8")
	public List<Integer> getGradeCnt(@RequestParam int sNum) {
		return rs.getGradeCnt(sNum);
	}
	
	@GetMapping(value = "getReview", produces = "application/json; charset=utf-8")
	public List<ReviewDTO> getReviewList(@RequestParam int sNum) {
		return rs.getReview(sNum);
	}
}