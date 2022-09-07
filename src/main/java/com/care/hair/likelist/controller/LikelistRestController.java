package com.care.hair.likelist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.care.hair.likelist.service.LikelistService;

@RestController
@RequestMapping("likelist")
public class LikelistRestController {

	@Autowired LikelistService ls;
	
	@GetMapping("likeCheck")
	public String likeCheck(@RequestParam String id, @RequestParam int sNum) {
		return ls.likeCheck(id, sNum);
	}
}
