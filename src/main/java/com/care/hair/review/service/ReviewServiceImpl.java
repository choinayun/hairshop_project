package com.care.hair.review.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.hair.mybatis.review.ReviewMapper;
import com.care.hair.mybatis.shop.ShopMapper;
import com.care.hair.review.dto.ReviewDTO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired ReviewMapper mapper;
	@Autowired ShopMapper shopMapper;
	
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
