package com.care.hair.mybatis.review;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.care.hair.review.dto.ReviewDTO;

public interface ReviewMapper {

	public int reviewSave( ReviewDTO dto ); 
	
	public List<ReviewDTO> reviewAllList(
			@Param("s")int start, @Param("e")int end);
	
	public int selectReviewCount(); 
	
	public int delete( int num );

	public ReviewDTO contentView( int num );
	
	// 성근이 작업 
	public int getReviewCnt(int sNum);
	public List<ReviewDTO> getReviewList(int sNum);
	public List<Integer> getGradeCnt(int sNum);
	public List<ReviewDTO> getReview(int sNum);
}