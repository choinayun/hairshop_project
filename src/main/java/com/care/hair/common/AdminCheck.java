package com.care.hair.common;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminCheck extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		String user = (String)session.getAttribute("loginUser");
				
		if(user == null || !(user.equals("admin"))) {
			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=utf-8");
			out.print("<script>location.href='" + request.getContextPath() + "/';</script>");
			return false;
		}
		return true;
	}

}
