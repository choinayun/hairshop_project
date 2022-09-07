package com.care.hair.review.service;

import java.util.List;

import org.springframework.ui.Model;

import com.care.hair.review.dto.ReviewDTO;

public interface ReviewService {
	
	public String getReviewCnt(int sNum);
	public void getReviewList(int sNum, Model model);
	public List<Integer> getGradeCnt(int sNum);
	public List<ReviewDTO> getReview(int sNum);
}
