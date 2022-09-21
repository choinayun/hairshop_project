package com.care.hair.review.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.hair.review.dto.ReviewDTO;

public interface ReviewService {

	public String reviewSave(MultipartHttpServletRequest mul, 
							 HttpServletRequest request);
	
	public void reviewAllList(Model model, int num); 
	
	public String delete(int num, String img,
						 HttpServletRequest request); 	
	
	public void contentView(int num, Model model);
	
	// 성근이 작업
	public String getReviewCnt(int sNum);
	public void getReviewList(int sNum, Model model);
	public List<Integer> getGradeCnt(int sNum);
	public List<ReviewDTO> getReview(int sNum);

}
