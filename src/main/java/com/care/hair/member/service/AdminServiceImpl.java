package com.care.hair.member.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.hair.member.dto.MemberDTO;
import com.care.hair.mybatis.member.AdminMapper;
import com.care.hair.mybatis.member.MemberMapper;
import com.care.hair.notice.dto.NoticeDTO;
import com.care.hair.registration.dto.RegistrationDTO;
import com.care.hair.reservation.dto.ReservationDTO;
import com.care.hair.shop.dto.ShopDTO;


@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired AdminMapper admapper;
	@Autowired MemberMapper mapper;
	@Autowired JavaMailSender mailSender;
	
	public void shopinfo(Model model) {
		try {
			List<ShopDTO>list=admapper.shopinfo(model);
			model.addAttribute("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void delshop(String sNum) {
		try {
			admapper.delshop(sNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void newshop(Model model) {
		try {
			List<RegistrationDTO>list=admapper.newshop(model);
			model.addAttribute("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void shopOK(String num,String id,Model model) {

		try {
			RegistrationDTO dto = admapper.getRegistration(Integer.parseInt(num));
			admapper.shopOK(dto);
			mapper.getemail(id);
			model.addAttribute("email",mapper.getemail(id));
			mapper.shopChange(id);
			admapper.shopOKdel(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void shopNO(String num) {
		try {
			admapper.shopOKdel(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void reservation(Model model) {
		try {
			List<ReservationDTO>list=admapper.reservation(model);
			model.addAttribute("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		

	}

	public void Bmodify(int status, int num) {
		ReservationDTO dto=new ReservationDTO();
		dto.setNum(num);
		dto.setStatus(status);
		
		try {
			admapper.Bmodify(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	public void sendmail(Model model) {
		MimeMessage message = mailSender.createMimeMessage();
		 MemberDTO dto=new MemberDTO();
		
		 dto.setEmail((String)model.getAttribute("email"));
			
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; 
		String hostSMTPid = "itsehyeon981012@gmail.com";
		String hostSMTPpwd = "fvrskaqmlblcinkj";
		
		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "itsehyeon981012@gmail.com";
		String fromName = "헤어샵 관리자 입니다.";
		String subject = "헤어샵 관리자 입니다.";
		String msg = "회원님의 매장이 정상적으로 등록되었습니다. 마이페이지를 확인해주세요."
				+ "궁금하신 점이 있으시면 관리자에게 문의 바랍니다.";
		
		
		// 받는 사람 E-Mail 주소
		String mail = dto.getEmail();
		try {
			MimeMessageHelper mm =new MimeMessageHelper(message,true,"UTF-8");
			mm.setSubject(subject);
			mm.setTo(dto.getEmail());
			mm.setText(msg);
			mailSender.send(message);
			
			
			
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	
		
	
	}
	public void bookingDel(String num) {
		try {
			admapper.bookingDel(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void N_F(MultipartHttpServletRequest mul) {
		NoticeDTO dto = new NoticeDTO();
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		MultipartFile file = mul.getFile("img");
		if(file.getSize() != 0) {
			SimpleDateFormat f = new SimpleDateFormat("_yyyyMMddHHmmss_");
			String  sysFileName= "n" + f.format(new Date());
			sysFileName += file.getOriginalFilename();
			dto.setImg(sysFileName);
			File saveFile = new File(IMAGE_REPO+"/"+sysFileName);
			try {
				file.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			dto.setImg("nan");
		}
		try {
			admapper.N_F(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void modifyForm( int sNum , Model model) {
		try {
			ShopDTO dto = admapper.getShop(sNum);
			model.addAttribute("dto", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void modify(MultipartHttpServletRequest mul) {
		ShopDTO dto= new ShopDTO();
		ArrayList<String> imgList = new ArrayList<String>();
		String fileName;
		String[] originNames = mul.getParameterValues("originName");
		int index = 0;
	
		dto.setsNum(Integer.parseInt(mul.getParameter("s_num")));
		dto.setsAddr(mul.getParameter("s_addr"));
		dto.setsName(mul.getParameter("s_name"));
		dto.setsPhone(mul.getParameter("s_phone"));

		for(MultipartFile file : mul.getFiles("img")) {
			
			if(file.getSize() != 0) {
				SimpleDateFormat simpl = new SimpleDateFormat("_yyyyMMddHHmmss");
				Date date = new Date();
				fileName = "s" + simpl.format(date);
				fileName += file.getOriginalFilename();
				
				imgList.add(fileName);
				File f = new File(IMAGE_REPO+"/"+fileName);
				try {
					file.transferTo(f);
				} catch (Exception e) {
					e.printStackTrace();
				}
				if(!originNames[index].equals("nan")) {
					File originFile = new File(IMAGE_REPO+"/"+originNames[index]);
					originFile.delete();
				}
				
			}else {
				imgList.add(originNames[index]);
			}
			
			index++;
			
		}
		
		dto.setImg1(imgList.get(0));
		dto.setImg2(imgList.get(1));
		dto.setImg3(imgList.get(2));
		dto.setImg4(imgList.get(3));
		
		try {
			admapper.modify(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}	
	


	

