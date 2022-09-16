package com.care.hair.qna.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.hair.mybatis.qna.QnaMapper;
import com.care.hair.qna.dto.QnaDTO;
import com.care.hair.qna.service.QnaFileService;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired QnaMapper qmapper;
	@Autowired QnaFileService qfs;

	public String qnaSave(MultipartHttpServletRequest mul,
						HttpServletRequest request) {
		
		QnaDTO dto = new QnaDTO();
		
		dto.setId( mul.getParameter("id") );
		dto.setTitle( mul.getParameter("title") );
		dto.setContent( mul.getParameter("content") );
	
		MultipartFile file = mul.getFile("img");
		if( file.getSize() != 0 ) {
			dto.setImg( qfs.saveFile(file) );
		}else {
			dto.setImg("nan");
		}
		
		int result = 0;
		result = qmapper.qnaSave(dto);
			
		String msg = null, url = null; 
			if( result == 1 ) {
				msg = "문의하기 작성이 완료되었습니다";
				url = request.getContextPath() + "/";
			} else {
				msg = "문제가 발생했습니다";
				url = request.getContextPath() + "/mypage/qna"; 
			}
		
		return qfs.getMessage( msg, url ); 
		
	}
	public void list(Model model) {
		
		try {
			List<QnaDTO>list=qmapper.list(model);
			model.addAttribute("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void contentView(int num,Model model) {
		try {
			model.addAttribute("dto",qmapper.contentView(num));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public void replySave(QnaDTO dto) {
		try {
			qmapper.replySave(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void replyView(int num,Model model) {
		try {
			model.addAttribute("reply",qmapper.replyView(num));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
