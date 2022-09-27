package com.care.hair.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.hair.mybatis.member.MemberMapper;

import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.hair.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired MemberMapper mapper;
	BCryptPasswordEncoder en = new BCryptPasswordEncoder();
	@Autowired JavaMailSender mailSender;
	
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
		try {
			model.addAttribute("result", result);
			if(id == null) {
				model.addAttribute("userAddr", "서울 강남구 신사동 668-33");
			}else {
				model.addAttribute("userAddr", mapper.getMemberAddr(id));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public int idchk(String id) {
		int cnt= mapper.idchk(id);
		return cnt;
	}	
	public int register(MemberDTO dto) {
		String seq = en.encode( dto.getPw() );
		dto.setPw( seq );
		
		try {
			return mapper.register( dto );
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int login_chk(HttpServletRequest request) {
		MemberDTO dto = 
				mapper.getUser(request.getParameter("id") );
		if( dto != null ) {
			if( en.matches(request.getParameter("pw"), dto.getPw() )  || dto.getPw().equals( request.getParameter("pw") )) {
				return 0;
			}
		}
		return 1;
	}
	public void find_id(RedirectAttributes rs,String name,String phone) {
		try {
			String findId = mapper.find_id(name, phone);
			if(findId == null) {
				rs.addAttribute("id", "없음");
			}else {
				rs.addAttribute("id", findId);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getemail(String id,Model model) {
		
		mapper.getemail(id);
		String email="";
		model.addAttribute("email",mapper.getemail(id));
		return email;
	}
	public String getpw(String id,Model model) {
		String pw="";
		mapper.getpw(id);
		model.addAttribute("pw",mapper.getpw(id));
		
		return pw;
	}
	public String sendmail(Model model) {
		 MimeMessage message = mailSender.createMimeMessage();
		 MemberDTO dto=new MemberDTO();
		
		 dto.setEmail((String)model.getAttribute("email"));
		 dto.setPw((String)model.getAttribute("pw"));
			
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; 
		String hostSMTPid = "itsehyeon981012@gmail.com";
		String hostSMTPpwd = "fvrskaqmlblcinkj";
		
		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "itsehyeon981012@gmail.com";
		String fromName = "헤어샵 비밀번호 찾기 서비스";
		String subject = "안녕하세요. 비밀번호를 발급하였습니다.";
		String msg = dto.getPw();
		
		
		String result="";
		
		// 받는 사람 E-Mail 주소
		String mail = dto.getEmail();
		try {
			MimeMessageHelper mm = new MimeMessageHelper(message,true,"UTF-8");
			mm.setSubject(subject);
			mm.setTo(dto.getEmail());
			mm.setText(dto.getPw());
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public void memberinfo(Model model) {
		try {
			List<MemberDTO> list = mapper.memberinfo(model);
			model.addAttribute("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void del(String id) {
		try {
			mapper.del(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void Pmodify(String id,int position) {
		MemberDTO dto= new MemberDTO();
		dto.setId(id);
		dto.setPosition(position);
		mapper.Pmodify(dto);
	}

}
