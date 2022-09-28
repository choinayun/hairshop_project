package com.care.hair.mybatis.qna;

import java.util.List;

import org.springframework.ui.Model;

import com.care.hair.qna.dto.QnaDTO;

public interface QnaMapper {

	public int qnaSave (QnaDTO dto);
	public List<QnaDTO>list(Model model);
	public QnaDTO contentView(int num);
	public void replySave(QnaDTO dto);
	public List<QnaDTO> replyView(int num);
	public void delreply(int num);
}
