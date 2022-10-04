package com.care.hair.review.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.hair.common.SessionName;
import com.care.hair.mybatis.reservation.ReservationMapper;
import com.care.hair.mybatis.review.ReviewMapper;
import com.care.hair.mybatis.shop.ShopMapper;
import com.care.hair.reservation.dto.ReservationDTO;
import com.care.hair.review.dto.ReviewDTO;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired ReviewMapper mapper;	
	@Autowired ReviewFileService rfs;
	@Autowired ReservationMapper reservationMapper;
	@Autowired ShopMapper shopMapper;
	
	public void reviewAllList(Model model, int num, String id) {
		
		int pageLetter = 5;
		int allCount = 0;
		
		try {
			allCount = mapper.selectReviewCount(id); 
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		int repeat = allCount / pageLetter; 
		if( allCount % pageLetter != 0)
			repeat += 1; 
		
		int end = num * pageLetter; 
		int start = end +1 -pageLetter; 
		
		model.addAttribute("repeat", repeat);
		try {
			model.addAttribute("reviewList", mapper.reviewAllList( start, end, id ));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public String reviewSave(MultipartHttpServletRequest mul, 
							 HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute(SessionName.LOGIN);
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
			result = mapper.reviewSave(dto);
			reservationMapper.statusUpdate(Integer.parseInt(request.getParameter("num")), 3);
			shopMapper.ShopGradeUpdate(Integer.parseInt( mul.getParameter("s_num")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg = null, url = null; 
			if( result == 1 ) {
				msg = "리뷰 작성이 완료되었습니다";
				url = request.getContextPath() + "/review/reviewAllList?id=" + id;
			} else {
				msg = "문제가 발생했습니다";
				url = request.getContextPath() + "/review/reviewAllList?id=" + id; 
			}
		
		return rfs.getMessage( msg, url ); 
	}

	public String delete(int num, String img, String id, 
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
			msg = "삭제되었습니다";
			url = request.getContextPath() + 
					"/review/reviewAllList?id=" + id; 
		}else {
			msg = "삭제 실패했습니다";
			url = request.getContextPath() + 
					"/review/contentView?num=" + num ; 	
		}
		
		return rfs.getMessage(msg, url); 	
	}
	
	public void contentView(int num, Model model) {
		try {
			model.addAttribute( "dto", mapper.contentView(num) );
		} catch (Exception e) {
			e.printStackTrace();
		}
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

	@Override
	public void reviewForm(Model model, int num, int sNum) {
		try {
			model.addAttribute("reservation", reservationMapper.getReservation(num));
			model.addAttribute("shop", shopMapper.getShopInfo(sNum));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
