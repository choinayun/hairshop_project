package com.care.hair.mybatis.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.care.hair.likelist.dto.LikelistDTO;
import com.care.hair.member.dto.MemberDTO;
import com.care.hair.notice.dto.NoticeDTO;
import com.care.hair.registration.dto.RegistrationDTO;
import com.care.hair.reservation.dto.ReservationDTO;

public interface MypageMapper {

	public List<ReservationDTO> booking( String id );
	public void bookingModify( ReservationDTO dto );
	public void bookingDel( int num ); 
	public List<NoticeDTO> notice( Model model );
	public NoticeDTO noticeView( int num );
	public void modify( MemberDTO dto );
	public MemberDTO getUser( String id );
	public void delete( String id );
	public List<ReservationDTO> history();
	public int registerSave( RegistrationDTO dto );
	public List<LikelistDTO> likeShop(String id);
}
