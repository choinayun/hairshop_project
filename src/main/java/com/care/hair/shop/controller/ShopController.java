package com.care.hair.shop.controller;

import java.io.File;
import java.io.FileInputStream;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.hair.common.Repository;
import com.care.hair.common.SessionName;
import com.care.hair.member.service.MemberService;
import com.care.hair.shop.service.ShopService;

@Controller
@RequestMapping("shop")
public class ShopController implements SessionName {

	@Autowired ShopService ss;
	@Autowired MemberService ms;
	
	@GetMapping("shopListForm")
	public String shopSearchForm(@RequestParam(value = "result", required = false, defaultValue="0") String result, HttpSession session, Model model) {
		session.setAttribute(LOGIN, "aaa");
		ms.getMemberAddr(model, (String)session.getAttribute(LOGIN), result);
		return "shop/shopListForm";
	}
	
	@GetMapping("download")
	public void download(@RequestParam String fileName, HttpServletResponse response) throws Exception {
		response.addHeader("Content-disposition", "attachment; fileName=" + fileName);
		File file = new File(Repository.IMAGE_REPO + "\\" + fileName);
		FileInputStream in = new FileInputStream(file);
		FileCopyUtils.copy(in, response.getOutputStream());
	}
	
	@GetMapping("shopInfo")
	public String shopInfo(@RequestParam int sNum, Model model, HttpSession session) {
		ss.getShopInfo(sNum, model, (String)session.getAttribute(LOGIN));
		return "shop/shopInfo";
	}
	
	@GetMapping("shopSearch")
	public String shopSearch(@RequestParam String word, Model model, HttpSession session) {
		ss.saveWord(word, model, (String)session.getAttribute(LOGIN));
		return "shop/shopSearch";
	}

	
}
