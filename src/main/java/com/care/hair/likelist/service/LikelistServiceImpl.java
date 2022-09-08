package com.care.hair.likelist.service;

import javax.naming.spi.DirStateFactory.Result;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.hair.likelist.dto.LikelistDTO;
import com.care.hair.mybatis.likelist.LikelistMapper;

@Service
public class LikelistServiceImpl implements LikelistService {

	@Autowired LikelistMapper mapper;
	
	@Override
	public String likeCheck(String id, int sNum) {
		String result = "";
		
		LikelistDTO dto = new LikelistDTO();
		try {
			dto = mapper.getLike(sNum, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(dto == null) {
			try {
				result = "true"; 
				mapper.saveLike(sNum, id);				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			try {
				result = "false";
				mapper.deleteLike(sNum, id);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}

}
