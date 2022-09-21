package com.care.hair.mybatis.shop;

import java.util.ArrayList;
import java.util.List;

import com.care.hair.shop.dto.ShopDTO;

public interface ShopMapper {

	public int shopDelete(String id);
	public ArrayList<ShopDTO> shopListAlign(int result);
	public ArrayList<ShopDTO> getShopSearch(String word);
	public ShopDTO getShopInfo(int sNum);
	public List<ShopDTO> shopList();
}