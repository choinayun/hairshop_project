package com.care.hair.member.service;

import org.springframework.ui.Model;

public interface MemberService {
	
	public void addrUpdate(String addr, String id);
	public void getMemberAddr(Model model, String id, String result);
}
