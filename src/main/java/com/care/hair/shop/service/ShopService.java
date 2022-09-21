package com.care.hair.shop.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.ui.Model;

import com.care.hair.shop.dto.ShopDTO;

public interface ShopService {
	
	public ArrayList<ShopDTO> getShopList(int result);
	public ArrayList<ShopDTO> getShopSearch(String word);
	public void getShopInfo(int sNum, Model model, String id);
	public void saveWord(String word, Model model, String id);
	public Map<Integer, Object> shopList();
}
