package com.ateam.solohomes.beans;

import java.sql.Timestamp;

public class ReviewDTO {
	
	private int co_uid;
	private int mb_uid;
	private int py_uid;
	private int g_uid;
	private String co_subject;
	private String co_content;
	private Timestamp co_regdate;
	
	
	public ReviewDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public ReviewDTO(int co_uid, int mb_uid, int py_uid, int g_uid, String co_subject, String co_content,
			Timestamp co_regdate) {
		super();
		this.co_uid = co_uid;
		this.mb_uid = mb_uid;
		this.py_uid = py_uid;
		this.g_uid = g_uid;
		this.co_subject = co_subject;
		this.co_content = co_content;
		this.co_regdate = co_regdate;
	}


	public int getCo_uid() {
		return co_uid;
	}


	public void setCo_uid(int co_uid) {
		this.co_uid = co_uid;
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


	public int getG_uid() {
		return g_uid;
	}


	public void setG_uid(int g_uid) {
		this.g_uid = g_uid;
	}


	public String getCo_subject() {
		return co_subject;
	}


	public void setCo_subject(String co_subject) {
		this.co_subject = co_subject;
	}


	public String getCo_content() {
		return co_content;
	}


	public void setCo_content(String co_content) {
		this.co_content = co_content;
	}


	public Timestamp getCo_regdate() {
		return co_regdate;
	}


	public void setCo_regdate(Timestamp co_regdate) {
		this.co_regdate = co_regdate;
	}
	
	
	
	

}
