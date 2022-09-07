package com.care.hair.review.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ReviewDTO {
	private Timestamp rDate;
	private String content;
	private String id;
	private int num;
	private int sNum;
	private String img;
	private float grade;
	private String info;
	
	public String getrDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(rDate);
	}
	public void setrDate(Timestamp rDate) {
		this.rDate = rDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getsNum() {
		return sNum;
	}
	public void setsNum(int sNum) {
		this.sNum = sNum;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public float getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
}
