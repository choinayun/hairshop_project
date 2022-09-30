package com.care.hair.qna.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.hair.qna.dto.QnaDTO;

public interface QnaService {

	public String qnaSave(MultipartHttpServletRequest mul,
						  HttpServletRequest request); 
	public void list(Model model);
	public void contentView(int num,Model model);
	public void replySave(QnaDTO dto);
	public void replyView(int num,Model model);
	public void delreply(int num);
}
