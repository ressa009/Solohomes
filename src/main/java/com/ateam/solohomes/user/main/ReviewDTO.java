package com.ateam.solohomes.user.main;

import java.sql.Timestamp;

public class ReviewDTO {
	private int co_uid; 
	private int mb_uid; 
	private int g_uid;
	private String mb_nn;
	private String co_subject;
	private String co_content;
	private Timestamp co_regdate;
	
	private int re_uid;
	private Timestamp re_regdate;
	private int re_type;
	private String re_content;
    
	public ReviewDTO() {
		super();
		System.out.println("ReviewDTO() 객체 생성");
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

	public int getG_uid() {
		return g_uid;
	}

	public void setG_uid(int g_uid) {
		this.g_uid = g_uid;
	}
	
	public String getMb_nn() {
		return mb_nn;
	}

	public void setMb_nn(String mb_nn) {
		this.mb_nn = mb_nn;
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

	public int getRe_uid() {
		return re_uid;
	}

	public void setRe_uid(int re_uid) {
		this.re_uid = re_uid;
	}

	public Timestamp getRe_regdate() {
		return re_regdate;
	}

	public void setRe_regdate(Timestamp re_regdate) {
		this.re_regdate = re_regdate;
	}

	public int getRe_type() {
		return re_type;
	}

	public void setRe_type(int re_type) {
		this.re_type = re_type;
	}

	public String getRe_content() {
		return re_content;
	}

	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}	
}
