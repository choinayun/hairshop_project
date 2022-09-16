package com.care.hair.qna.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class QnaDTO {

	private String id, title, content, img; 
	private Timestamp qDate; 
	private int num, groupNum;
	public int getGroupNum() {
		return groupNum;
	}
	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getqDate() {
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(qDate);
	}
	public void setqDate(Timestamp qDate) {
		this.qDate = qDate;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	} 
	
	
}
