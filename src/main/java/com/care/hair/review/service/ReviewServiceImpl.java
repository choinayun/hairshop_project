package com.care.hair.review.service;

import javax.servlet.http.HttpServletRequest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.hair.mybatis.review.ReviewMapper;
import com.care.hair.mybatis.shop.ShopMapper;
import com.care.hair.reservation.dto.ReservationDTO;
import com.care.hair.review.dto.ReviewDTO;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired ReviewMapper mapper;	
	@Autowired ReviewFileService rfs;
	
	@Autowired ShopMapper shopMapper;
	
	public void reviewAllList(Model model, int num) {
		
		System.out.println("reviewAllList 실행");
		
		int pageLetter = 5;
		
		int allCount = 0;
		
		try {
			allCount = mapper.selectReviewCount(); 
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		int repeat = allCount / pageLetter; 
		if( allCount % pageLetter != 0)
			repeat += 1; 
		
		int end = num * pageLetter; 
		int start = end +1 -pageLetter; 
		
		model.addAttribute("repeat", repeat);
		model.addAttribute("reviewList", mapper.reviewAllList( start, end ));
		
	}

	public String reviewSave(MultipartHttpServletRequest mul, 
							 HttpServletRequest request) {
		
		ReviewDTO dto = new ReviewDTO();
		
		dto.setId( mul.getParameter("id") );	
		dto.setInfo( mul.getParameter("info") );
		dto.setContent( mul.getParameter("content") );
		dto.setsNum(Integer.parseInt( mul.getParameter("s_num") ));
		dto.setGrade(Integer.parseInt( mul.getParameter("grade") ));
		
		MultipartFile file = mul.getFile("img");
		
			if( file.getSize() != 0 ) {
				dto.setImg( rfs.saveFile(file) );
			}else {
				dto.setImg("nan");
			}
			
		int result = 0;
		try {
			System.out.println("dto s_num >>>" + dto.getsNum());
			result = mapper.reviewSave(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg = null, url = null; 
			if( result == 1 ) {
				msg = "리뷰 작성이 완료되었습니다";
				url = request.getContextPath() + "/review/reviewAllList";
			} else {
				msg = "문제가 발생했습니다";
				url = request.getContextPath() + "/review/reviewForm"; 
			}
		
		return rfs.getMessage( msg, url ); 
	}

	public String delete(int num, String img, 
						 HttpServletRequest request) {
		
		int result = 0;
		try {
			result = mapper.delete(num); 
		} catch (Exception e) {
			e.printStackTrace(); 
		}
		
		String msg, url; 
		if( result == 1) {
			rfs.deleteImage(img);
			msg = "성공적으로 삭제되었습니다";
			url = request.getContextPath() + 
					"/review/reviewAllList"; 
		}else {
			msg = "삭제 실패했습니다";
			url = request.getContextPath() + 
					"/review/contentView?num=" + num ; 	
		}
		
		return rfs.getMessage(msg, url); 	
	}
	
	public void contentView(int num, Model model) {
		
		model.addAttribute( "dto", mapper.contentView(num) );
	}
	
	public void reviewForm(Model model, int num) {
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 성근이 작업 
	@Override
	public String getReviewCnt(int sNum) {
		try {
			return "" + mapper.getReviewCnt(sNum);			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "0";
	}

	@Override
	public void getReviewList(int sNum, Model model) {
		try {
			model.addAttribute("review", mapper.getReviewList(sNum));
			model.addAttribute("shop", shopMapper.getShopInfo(sNum));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Integer> getGradeCnt(int sNum) {
		try {
			return mapper.getGradeCnt(sNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ReviewDTO> getReview(int sNum) {
		try {
			return mapper.getReview(sNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
