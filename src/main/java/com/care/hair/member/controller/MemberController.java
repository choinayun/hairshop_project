package com.care.hair.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.hair.common.SessionName;
import com.care.hair.member.dto.memberDTO;
import com.care.hair.member.service.MemberService;


@Controller
@RequestMapping("member")
public class MemberController implements SessionName {
	private static final String LOGIN = null;
	@Autowired MemberService ms;
	
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	@GetMapping("/join")
	public String join() {
		return "member/join";
	}
	@PostMapping("/idchk")
	@ResponseBody
	public int idchk(@RequestParam("id") String id) {
		int cnt = ms.idchk(id);
		return cnt;
		
	}
	@PostMapping("/register")
	public String register(memberDTO dto) {
		
		int result = ms.register(dto);
		if(result == 1) {
			return "redirect:login";
			}
		
		return "redirect:join";
	}
	
	@PostMapping("/login_chk")
	public String user_check(HttpServletRequest request) {
		int result = ms.login_chk(request);
		System.out.println("req:"+request);
		if(result == 0) {
			HttpSession session = request.getSession(true);
			session.setAttribute(SessionName.LOGIN, request.getParameter("id"));
			
			session.isNew();
			return "redirect:main";
		}
		return "redirect:login";
	}
	
	@GetMapping("/main")
	public String main() {
		return"member/main";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session){
		
		session.invalidate();
		return "redirect:/member/main";
	}
	@GetMapping("findid")
	public String findid(){
		
		return "member/findid";
	}
	@PostMapping("find_id")
	public String find_id(@RequestParam("name") String name,@RequestParam("phone") String phone, RedirectAttributes rs) {
		
		ms.find_id(rs, name, phone);
			
			System.out.println("result:"+rs);

		return "redirect:/member/result";			
			
	}
	
	@GetMapping("result")
	public String result(@RequestParam String id, Model model) {
		model.addAttribute("id", id);
		return"member/result";
	}
	
	@GetMapping("findpw")
	public String findpw() {
		return"member/findpw";
	}
	@GetMapping("/userchk")
	@ResponseBody
	public String userchk(@RequestParam("id") String id,Model model) {
		
		int cnt = ms.idchk(id);
		System.out.println();
		if(cnt==1) {
			
			ms.getemail(id,model);
			ms.getpw(id, model);
			ms.sendmail(model);
			cnt=1;
		}else {
			
			
		}
		
		return ""+cnt;
		
	}
	
	@GetMapping("memberinfo")
	public String memberinfo(Model model) {
		ms.memberinfo(model);
		return"member/memberinfo";
	}
	@GetMapping("/del")
	public String del(String id) {
		 ms.del(id);
		
		return "redirect:memberinfo";
		
	}
	
	@GetMapping("positionModify")
	public String positionModify(String id,int position) {
		ms.Pmodify(id,position);
		return"redirect:memberinfo";
	}
	
	
	

	
}
