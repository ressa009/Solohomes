package com.ateam.solohomes.user.main;

import java.sql.Timestamp;

public class ListDTO {
	private int sr_uid;
	private String sr_subject;
	private String sr_img;
	private Timestamp sr_regdate;
	
	private int g_uid;
	private String g_name;
	private String g_img;
	private int g_price;
	private int g_likecnt;
	
	public ListDTO() {
		super();
		System.out.println("ListDTO() 객체 생성");
	}

	public int getSr_uid() {
		return sr_uid;
	}

	public void setSr_uid(int sr_uid) {
		this.sr_uid = sr_uid;
	}

	public String getSr_subject() {
		return sr_subject;
	}

	public void setSr_subject(String sr_subject) {
		this.sr_subject = sr_subject;
	}

	public String getsr_img() {
		return sr_img;
	}

	public void setsr_img(String sr_img) {
		this.sr_img = sr_img;
	}

	public Timestamp getSr_regdate() {
		return sr_regdate;
	}

	public void setSr_regdate(Timestamp sr_regdate) {
		this.sr_regdate = sr_regdate;
	}

	public int getG_uid() {
		return g_uid;
	}

	public void setG_uid(int g_uid) {
		this.g_uid = g_uid;
	}

	public String getg_name() {
		return g_name;
	}

	public void setg_name(String g_name) {
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
}
