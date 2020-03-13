package com.ateam.solohomes.beans;

public class GoodsDTO {
	
	private int g_uid;
	private int g_type;
	private String g_name;
	private String g_img;
	private String g_size;
	private int g_price;
	private int g_likecnt;
	
	private int gl_uid;  // 마이페이지 좋아요 때문에 추가 - 이미지 02/23 
	
	
	public GoodsDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public GoodsDTO(int g_uid, int g_type, String g_name, String g_img, String g_size, int g_price, int g_likecnt) {
		super();
		this.g_uid = g_uid;
		this.g_type = g_type;
		this.g_name = g_name;
		this.g_img = g_img;
		this.g_size = g_size;
		this.g_price = g_price;
		this.g_likecnt = g_likecnt;
	}
	


	// 마이페이지 좋아요 때문에 추가 - 이미지 02/23 
	public GoodsDTO(int g_uid, int g_type, String g_name, String g_img, String g_size, int g_price, int g_likecnt, int gl_uid) {
		super();
		this.g_uid = g_uid;
		this.g_type = g_type;
		this.g_name = g_name;
		this.g_img = g_img;
		this.g_size = g_size;
		this.g_price = g_price;
		this.g_likecnt = g_likecnt;
		this.gl_uid = gl_uid;
	}


	public int getG_uid() {
		return g_uid;
	}


	public void setG_uid(int g_uid) {
		this.g_uid = g_uid;
	}


	public int getG_type() {
		return g_type;
	}


	public void setG_type(int g_type) {
		this.g_type = g_type;
	}


	public String getG_name() {
		return g_name;
	}


	public void setG_name(String g_name) {
		this.g_name = g_name;
	}


	public String getG_img() {
		return g_img;
	}


	public void setG_img(String g_img) {
		this.g_img = g_img;
	}


	public String getG_size() {
		return g_size;
	}


	public void setG_size(String g_size) {
		this.g_size = g_size;
	}


	public int getG_price() {
		return g_price;
	}


	public void setG_price(int g_price) {
		this.g_price = g_price;
	}


	public int getG_likecnt() {
		return g_likecnt;
	}


	public void setG_likecnt(int g_likecnt) {
		this.g_likecnt = g_likecnt;
	}


	public int getGl_uid() {
		return gl_uid;
	}


	public void setGl_uid(int gl_uid) {
		this.gl_uid = gl_uid;
	}
	
	
	
	

}
