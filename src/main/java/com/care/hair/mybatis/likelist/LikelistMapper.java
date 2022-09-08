package com.care.hair.mybatis.likelist;

import org.apache.ibatis.annotations.Param;

import com.care.hair.likelist.dto.LikelistDTO;

public interface LikelistMapper {
	public LikelistDTO getLike(@Param("sNum") int sNum, @Param("id") String id);
	public void saveLike(@Param("sNum") int sNum, @Param("id") String id);
	public void deleteLike(@Param("sNum") int sNum, @Param("id") String id);
}
