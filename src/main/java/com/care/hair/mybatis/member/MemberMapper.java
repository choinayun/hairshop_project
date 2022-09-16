package com.care.hair.mybatis.member;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import org.springframework.ui.Model;

import com.care.hair.member.dto.MemberDTO;

public interface MemberMapper {
	public void addrUpdate(@Param("addr") String addr, @Param("id") String id);
	public String getMemberAddr(String id);
	public int idchk(String id);
	public int register(MemberDTO dto);
	public MemberDTO getUser( String id );
	public String find_id(@Param("name")String name,@Param("phone")String phone);
	public int userchk(@Param("id")String id,@Param("name")String name);
	public String getemail(String id);
	public String getpw(String id);
	public List<MemberDTO> memberinfo(Model model);
	public void del(String id);
	public void shopChange(String id);
	public void Pmodify(MemberDTO dto);
	public String getPhone(String id);
}
