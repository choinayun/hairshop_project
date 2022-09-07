package com.care.hair.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.hair.common.SessionName;
import com.care.hair.member.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController implements SessionName {

	@Autowired MemberService ms;
	
	@GetMapping("addrUpdate")
	public String addrUpdate(@RequestParam String addr, HttpSession session) {
		ms.addrUpdate(addr, (String)session.getAttribute(LOGIN));
		return "redirect:../shop/shopListForm";
	}
}
