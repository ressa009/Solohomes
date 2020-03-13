package com.ateam.solohomes.beans;

import java.sql.Timestamp;

public class SeriesDTO {
	private int sr_uid;
	private String sr_subject;
	private String sr_img;
	private Timestamp sr_regdate;
	
	private int srg_uid;
	
	private int g_uid;
	private int g_type;
	private String g_name;
	private String g_img;
	private String g_size;
	private int g_price;
	private int g_likecnt;
	
	public SeriesDTO() {
		
	}
	public SeriesDTO(int sr_uid, String sr_subject, String sr_img, Timestamp sr_regdate, int srg_uid, int g_uid,
			int g_type, String g_name, String g_img, String g_size, int g_price, int g_likecnt) {
		super();
		this.sr_uid = sr_uid;
		this.sr_subject = sr_subject;
		this.sr_img = sr_img;
		this.sr_regdate = sr_regdate;
		this.srg_uid = srg_uid;
		this.g_uid = g_uid;
		this.g_type = g_type;
		this.g_name = g_name;
		this.g_img = g_img;
		this.g_size = g_size;
		this.g_price = g_price;
		this.g_likecnt = g_likecnt;
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
	public String getSr_img() {
		return sr_img;
	}
	public void setSr_img(String sr_img) {
		this.sr_img = sr_img;
	}
	public Timestamp getSr_regdate() {
		return sr_regdate;
	}
	public void setSr_regdate(Timestamp sr_regdate) {
		this.sr_regdate = sr_regdate;
	}
	public int getSrg_uid() {
		return srg_uid;
	}
	public void setSrg_uid(int srg_uid) {
		this.srg_uid = srg_uid;
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
	
	
}