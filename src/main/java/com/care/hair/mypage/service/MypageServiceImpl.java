package com.care.hair.mypage.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.hair.member.dto.MemberDTO;
import com.care.hair.mybatis.member.MemberMapper;
import com.care.hair.mybatis.mypage.MypageMapper;
import com.care.hair.mybatis.reservation.ReservationMapper;
import com.care.hair.mybatis.shop.ShopMapper;
import com.care.hair.notice.dto.NoticeDTO;
import com.care.hair.registration.dto.RegistrationDTO;
import com.care.hair.registration.service.RegistrationFileService;
import com.care.hair.reservation.dto.ReservationDTO;
import com.care.hair.shop.dto.ShopDTO;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired ReservationMapper mapper; // 예약
	@Autowired MemberMapper mmapper; 
	@Autowired RegistrationFileService rfs; 
	@Autowired MypageMapper mymapper; 
	@Autowired ShopMapper shopMapper;
	BCryptPasswordEncoder en = new BCryptPasswordEncoder(); // 비밀번호 암호화 
	
	public void main(Model model, String id) {
		try {
			model.addAttribute("dto", mymapper.getUser(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 입점신청 정보 저장하기 
	public String registerSave(MultipartHttpServletRequest mul,
							 HttpServletRequest request) {
		
		RegistrationDTO dto = new RegistrationDTO();
		
		dto.setId( mul.getParameter("id") );
		dto.setsName( mul.getParameter("s_name") );
		dto.setsAddr( mul.getParameter("s_addr") );
		dto.setsPhone( mul.getParameter("s_phone") );
		
		MultipartFile file1 = mul.getFile("img1");
		MultipartFile file2 = mul.getFile("img2");
		MultipartFile file3 = mul.getFile("img3");
		MultipartFile file4 = mul.getFile("img4");
		
		if(file1.getSize() != 0 ) {
			dto.setImg1( rfs.saveFile(file1));
		}else {
			dto.setImg1("nan");
		}
		if(file2.getSize() != 0 ) {
			dto.setImg2( rfs.saveFile(file2));
		}else {
			dto.setImg2("nan");
		}
		if(file3.getSize() != 0 ) {
			dto.setImg3( rfs.saveFile(file3));
		}else {
			dto.setImg3("nan");
		}
		if(file4.getSize() != 0 ) {
			dto.setImg4( rfs.saveFile(file4));
		}else {
			dto.setImg4("nan");
		}
		
		int result = 0;
		
		try {
			result = mymapper.registerSave(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		String msg = null, url = null; 
		
			if( result == 1 ) {
				msg = "입점신청 작성이 완료되었습니다";
				url = request.getContextPath() + "/mypage/main";
			} else {
				msg = "문제가 발생했습니다";
				url = request.getContextPath() + "/mypage/registerShop"; 
			}
			
		return rfs.getMessage( msg, url );
	}
	
	// 회원정보 수정 (저장된 정보 불러오기) 
	public void infoModify(String id, Model model) {
		try {
			model.addAttribute("dto", mmapper.getUser(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 회원정보 수정 저장하기 
	public void memberInfoModify(HttpServletRequest req) {
		
		MemberDTO dto = new MemberDTO();
		String seq = en.encode( req.getParameter("new_pw"));
			
		dto.setId( req.getParameter("id") );
		dto.setPw( seq );
		dto.setName( req.getParameter("name") );
		dto.setEmail( req.getParameter("email") );
		dto.setAddr( req.getParameter("addr") );
		dto.setPhone( req.getParameter("phone") );
		
		try {
			mymapper.modify( dto );
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 매장관리자 예약 확인하기 
	public void booking(String id, Model model) {
		List<ReservationDTO> list = mymapper.booking(id);
		model.addAttribute("list", list); 
	}
	
	// 매장관리자 예약 변경하기 
	public void bookingModify(int status, int num) {
		ReservationDTO dto = new ReservationDTO();
		dto.setNum(num);
		dto.setStatus(status);
		
		try {
			mymapper.bookingModify(dto); 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 매장관리자 예약 취소하기 
	public void bookingDel(int num) {
		try {
			mymapper.bookingDel(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void statusUpdate(int num) {
		try {
			mapper.statusUpdate(num, 2);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 공지사항 내용 불러오기
	public void notice(Model model) {
		List<NoticeDTO> list = mymapper.notice(model);
		model.addAttribute("list", list);
	}
	
	public void noticeView(int num, Model model) {
		model.addAttribute( "dto", mymapper.noticeView(num) );
	}
	
	// 회원 탈퇴
	public void delete(String id) {
		try {
			mymapper.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 이용 내역 
	public void history(Model model) {
		try {
			model.addAttribute("list", mymapper.history());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 좋아요 누른 샵 리스트 가져오기 
	public void likeShop(Model model) {
		try {
			model.addAttribute("like_list", mymapper.likeShop());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
