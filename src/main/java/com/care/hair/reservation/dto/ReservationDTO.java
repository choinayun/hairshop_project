package com.care.hair.reservation.dto;

import com.care.hair.menu.dto.MenuDTO;

public class ReservationDTO {
	private String id, name, info, r_date, price, r_time;
	private int status, s_shop, num;

	private MenuDTO menu;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getS_shop() {
		return s_shop;
	}
	public void setS_shop(int s_shop) {
		this.s_shop = s_shop;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getR_time() {
		return r_time;
	}
	public void setR_time(String r_time) {
		this.r_time = r_time;
	}
	public MenuDTO getMenu() {
		return menu;
	}
	public void setMenu(MenuDTO menu) {
		this.menu = menu;
	}
	
}
