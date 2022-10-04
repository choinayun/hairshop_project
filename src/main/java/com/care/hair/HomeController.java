package com.care.hair;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import com.care.hair.shop.service.ShopService;

@Controller
public class HomeController {

	@Autowired ShopService ss;
	
	@RequestMapping("/")
	public String home(Model model) {
		ss.getHomeImg(model);
		return "home";
	}
	private IamportClient api;
	
	public HomeController() {
	    	// REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
			// this.api = new IamportClient("2115366248371044","70VNjB4ppK7cO7HrolFt6cSnulCcdw6OJGOQEVBqafYOJMmnJ02PdDiodxUL9GUhIGbGdbWVWSGvRGqe");
			this.api = new IamportClient("0664714173421671","98s2Xx9pRkJ9iV4b5U4gUuHjFHupDaYGyMYn179DVewEC2XvFcEqPk3E8q4NUEZARhx5TpK5lusUe61g");
		}
	
		@ResponseBody
		@RequestMapping(value="/verifyIamport/{imp_uid}")
		public IamportResponse<Payment> paymentByImpUid(
				Model model
				, Locale locale
				, HttpSession session
				, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
		{	
				return api.paymentByImpUid(imp_uid);
		}
	
	@GetMapping("/hairshop_policy")
	public String hairshop_policy() {
		return "default/hairshop_policy";
	}
	
}
