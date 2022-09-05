package com.care.hair.mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.care.hair.member.dto.memberDTO;
import com.care.hair.member.dto.memberShopDTO;


public interface MemberMapper {
	public int idchk(String id);
	public int register(memberDTO dto);
	public memberDTO getUser( String id );
	public String find_id(@Param("name")String name,@Param("phone")String phone);
	public int userchk(@Param("id")String id,@Param("name")String name);
	public String getemail(String id);
	public String getpw(String id);
	public List<memberDTO> memberinfo(Model model);
	public void del(String id);
	public void shopChange(String id);
	public void Pmodify(memberDTO dto);
	
}
