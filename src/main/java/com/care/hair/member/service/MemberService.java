package com.care.hair.member.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.hair.member.dto.MemberDTO;

public interface MemberService {
	public void addrUpdate(String addr, String id);
	public void getMemberAddr(Model model, String id, String result);
	public int idchk(String id);
	public int register(MemberDTO dto);
	public int login_chk( HttpServletRequest request);
	public String find_id(RedirectAttributes rs, String name,String phone);
	public String getemail(String id,Model model);
	public String sendmail(Model model);
	public String getpw(String id,Model model);
	public void memberinfo(Model model);
	public void del(String id);
	public void Pmodify(String id,int position);
	
}
