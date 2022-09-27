package com.care.hair.shop.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.hair.mybatis.likelist.LikelistMapper;
import com.care.hair.mybatis.member.MemberMapper;
import com.care.hair.mybatis.menu.MenuMapper;
import com.care.hair.mybatis.review.ReviewMapper;
import com.care.hair.mybatis.shop.ShopMapper;
import com.care.hair.review.dto.ReviewDTO;
import com.care.hair.shop.dto.ShopDTO;

@Service
public class ShopServiceImpl implements ShopService {

	@Autowired ShopMapper mapper;
	@Autowired MemberMapper memberMapper;
	@Autowired LikelistMapper likelistMapper;
	@Autowired MenuMapper menuMapper;
	@Autowired ReviewMapper reviewMapper;

	@Override
	public ArrayList<ShopDTO> getShopList(int result) {
		try {
			return mapper.shopListAlign(result);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return null;
	}

	@Override
	public void getShopInfo(int sNum, Model model, String id) {
		ShopDTO dto = mapper.getShopInfo(sNum);
		model.addAttribute("shopInfo", dto);
		model.addAttribute("grade", (int)dto.getGrade());
		
		try {
			if(id != null) {
				model.addAttribute("like", likelistMapper.getLike(sNum, id));
			}
			model.addAttribute("menu", menuMapper.getMenuList());
			model.addAttribute("review", reviewMapper.getReviewList(sNum));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void saveWord(String word, Model model, String id) {
		model.addAttribute("word", word);
		try {
			if(id == null) {
				model.addAttribute("userAddr", "서울 강남구 신사동 668-33");
			}else {
				model.addAttribute("userAddr", memberMapper.getMemberAddr(id));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public ArrayList<ShopDTO> getShopSearch(String word) {
		try {
			return mapper.getShopSearch(word);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void getHomeImg(Model model) {
		try {
			model.addAttribute("gradeImg", mapper.getGradeImg());
			model.addAttribute("reviewImg", mapper.getReviewImg());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
