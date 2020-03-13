package com.ateam.solohomes.beans;

import java.sql.Timestamp;

public class PurchaseDTO {
	
	private int mb_uid;
	
	private int py_uid;
	private int py_amount;
	private int py_confirm;
	private Timestamp py_regdate; 
	private String py_zipcode;
	private String py_addr;
	private String py_addr2;
	private String py_price;
	
	private int in_uid;
	private String in_img;
	private String in_color;
	
	private int g_uid;
	private String g_name;
	private int g_price;
	
	private int co_uid;
	
	private int cnt;
	
	
	
	public PurchaseDTO() {
		super();
	}



	




	public PurchaseDTO(int mb_uid, int py_uid, int py_amount, int py_confirm, Timestamp py_regdate, String py_zipcode,
			String py_addr, String py_addr2, String py_price, int in_uid, String in_img, String in_color, int g_uid,
			String g_name, int g_price, int co_uid, int cnt) {
		super();
		this.mb_uid = mb_uid;
		this.py_uid = py_uid;
		this.py_amount = py_amount;
		this.py_confirm = py_confirm;
		this.py_regdate = py_regdate;
		this.py_zipcode = py_zipcode;
		this.py_addr = py_addr;
		this.py_addr2 = py_addr2;
		this.py_price = py_price;
		this.in_uid = in_uid;
		this.in_img = in_img;
		this.in_color = in_color;
		this.g_uid = g_uid;
		this.g_name = g_name;
		this.g_price = g_price;
		this.co_uid = co_uid;
		this.cnt = cnt;
	}








	public int getMb_uid() {
		return mb_uid;
	}


	public void setMb_uid(int mb_uid) {
		this.mb_uid = mb_uid;
	}


	public int getPy_uid() {
		return py_uid;
	}


	public void setPy_uid(int py_uid) {
		this.py_uid = py_uid;
	}


	public int getPy_amount() {
		return py_amount;
	}


	public void setPy_amount(int py_amount) {
		this.py_amount = py_amount;
	}


	public int getPy_confirm() {
		return py_confirm;
	}


	public void setPy_confirm(int py_confirm) {
		this.py_confirm = py_confirm;
	}


	public Timestamp getPy_regdate() {
		return py_regdate;
	}


	public void setPy_regdate(Timestamp py_regdate) {
		this.py_regdate = py_regdate;
	}


	public String getPy_zipcode() {
		return py_zipcode;
	}


	public void setPy_zipcode(String py_zipcode) {
		this.py_zipcode = py_zipcode;
	}


	public String getPy_addr() {
		return py_addr;
	}


	public void setPy_addr(String py_addr) {
		this.py_addr = py_addr;
	}


	public String getPy_addr2() {
		return py_addr2;
	}


	public void setPy_addr2(String py_addr2) {
		this.py_addr2 = py_addr2;
	}



	public String getPy_price() {
		return py_price;
	}



	public void setPy_price(String py_price) {
		this.py_price = py_price;
	}



	public void setG_price(int g_price) {
		this.g_price = g_price;
	}



	public int getIn_uid() {
		return in_uid;
	}


	public void setIn_uid(int in_uid) {
		this.in_uid = in_uid;
	}


	public String getIn_img() {
		return in_img;
	}


	public void setIn_img(String in_img) {
		this.in_img = in_img;
	}


	public String getIn_color() {
		return in_color;
	}


	public void setIn_color(String in_color) {
		this.in_color = in_color;
	}


	public int getG_uid() {
		return g_uid;
	}


	public void setG_uid(int g_uid) {
		this.g_uid = g_uid;
	}


	public String getG_name() {
		return g_name;
	}


	public void setG_name(String g_name) {
		this.g_name = g_name;
	}


	public int getG_price() {
		return g_price;
	}


	
	public int getCo_uid() {
		return co_uid;
	}



	public void setCo_uid(int co_uid) {
		this.co_uid = co_uid;
	}


	

	public int getCnt() {
		return cnt;
	}



	public void setCnt(int cnt) {
		this.cnt = cnt;
	}



	@Override
	public String toString() {
		return String.format("[PurchaseDTO %d, %s, %s, %s, %d, %s]", 
				py_uid, g_name, py_regdate, py_amount, py_price, py_confirm);
	}

	
}
