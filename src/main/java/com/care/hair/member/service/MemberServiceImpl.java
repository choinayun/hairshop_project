package com.care.hair.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.hair.mybatis.member.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired MemberMapper mapper; 
	
	@Override
	public void addrUpdate(String addr, String id) {
		try {
			mapper.addrUpdate(addr, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void getMemberAddr(Model model, String id, String result) {
		model.addAttribute("result", result);
		model.addAttribute("userAddr", mapper.getMemberAddr(id));
	}

	
}
