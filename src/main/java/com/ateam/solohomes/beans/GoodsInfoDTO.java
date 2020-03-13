package com.ateam.solohomes.beans;

public class GoodsInfoDTO {
	
	private int g_uid;
	private int in_uid;
	private String in_color;
	private String in_img;
	private int in_inv;
	
	
	public GoodsInfoDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public GoodsInfoDTO(int in_uid, String in_color, String in_img, int in_inv) {
		super();
		this.in_uid = in_uid;
		this.in_color = in_color;
		this.in_img = in_img;
		this.in_inv = in_inv;
	}


	public int getG_uid() {
		return g_uid;
	}


	public void setG_uid(int g_uid) {
		this.g_uid = g_uid;
	}


	public int getIn_uid() {
		return in_uid;
	}


	public void setIn_uid(int in_uid) {
		this.in_uid = in_uid;
	}


	public String getIn_color() {
		return in_color;
	}


	public void setIn_color(String in_color) {
		this.in_color = in_color;
	}


	public String getIn_img() {
		return in_img;
	}


	public void setIn_img(String in_img) {
		this.in_img = in_img;
	}


	public int getIn_inv() {
		return in_inv;
	}


	public void setIn_inv(int in_inv) {
		this.in_inv = in_inv;
	}
	
	
	
}
