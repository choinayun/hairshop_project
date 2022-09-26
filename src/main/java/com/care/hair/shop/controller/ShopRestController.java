package com.care.hair.shop.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.care.hair.shop.dto.ShopDTO;
import com.care.hair.shop.service.ShopService;

@RestController
@RequestMapping("shop")
public class ShopRestController {

	@Autowired ShopService ss;
	
	@GetMapping(value = "getShopList", produces = "application/json; charset=utf-8")
	public ArrayList<ShopDTO> getShopList(@RequestParam int result) {
		return ss.getShopList(result);
	}

	@GetMapping(value = "getShopSearch", produces = "application/json; charset=utf-8")
	public ArrayList<ShopDTO> getShopSearch(@RequestParam String word){
		return ss.getShopSearch(word.toUpperCase());
	}
	
}
