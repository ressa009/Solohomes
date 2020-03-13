package com.ateam.solohomes.user.main;

public class ProductInfoDTO {
	private int g_uid;
	private int g_type;
	private String g_name;
	private String g_img;
	private int g_price;
	private int g_likecnt;
	
	private int in_uid;    
    private String in_color;
    private String in_img;
    private int in_inv;
    
    private int gl_uid;
    private int mb_uid;
    
    private int cr_uid;
    private int cr_amount;
    
	public ProductInfoDTO() {
		super();
		System.out.println("ProductInfoDTO() 객체 생성");
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

	public int getGl_uid() {
		return gl_uid;
	}

	public void setGl_uid(int gl_uid) {
		this.gl_uid = gl_uid;
	}

	public int getMb_uid() {
		return mb_uid;
	}

	public void setMb_uid(int mb_uid) {
		this.mb_uid = mb_uid;
	}

	public int getCr_uid() {
		return cr_uid;
	}

	public void setCr_uid(int cr_uid) {
		this.cr_uid = cr_uid;
	}

	public int getCr_amount() {
		return cr_amount;
	}

	public void setCr_amount(int cr_amount) {
		this.cr_amount = cr_amount;
	}
	
	
}
