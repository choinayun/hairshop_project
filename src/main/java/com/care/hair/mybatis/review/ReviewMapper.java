package com.care.hair.mybatis.review;

import java.util.List;

import com.care.hair.review.dto.ReviewDTO;

public interface ReviewMapper {
	
	public int getReviewCnt(int sNum);
	public List<ReviewDTO> getReviewList(int sNum);
	public List<Integer> getGradeCnt(int sNum);
	public List<ReviewDTO> getReview(int sNum);
}
