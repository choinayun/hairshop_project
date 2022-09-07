package com.care.hair.mybatis.member;

import org.apache.ibatis.annotations.Param;

public interface MemberMapper {

	public void addrUpdate(@Param("addr") String addr, @Param("id") String id);
	public String getMemberAddr(String id);
}
