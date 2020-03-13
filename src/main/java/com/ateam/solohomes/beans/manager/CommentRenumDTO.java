package com.ateam.solohomes.beans.manager;

import java.sql.Timestamp;

public class CommentRenumDTO {
	private int co_uid;
	private int mb_uid;
	private int g_uid;
	
	private String mb_id;
	private String g_name;
	
	private String subject;
	private String content;
	private Timestamp regdate;
	private int reportedNum = 0;
	
	
	public CommentRenumDTO() {
		super();
	}
	public CommentRenumDTO(int co_uid, int mb_uid, int g_uid, String mb_id, String g_name, String subject,
			String content, Timestamp regdate, int reportedNum) {
		super();
		this.co_uid = co_uid;
		this.mb_uid = mb_uid;
		this.g_uid = g_uid;
		this.mb_id = mb_id;
		this.g_name = g_name;
		this.subject = subject;
		this.content = content;
		this.regdate = regdate;
		this.reportedNum = reportedNum;
	}
	
	public int getCo_uid() {return co_uid;}
	public void setCo_uid(int co_uid) {this.co_uid = co_uid;}
	public int getMb_uid() {return mb_uid;}
	public void setMb_uid(int mb_uid) {this.mb_uid = mb_uid;}
	public int getG_uid() {return g_uid;}
	public void setG_uid(int g_uid) {this.g_uid = g_uid;}
	public String getMb_id() {return mb_id;}
	public void setMb_id(String mb_id) {this.mb_id = mb_id;}
	public String getG_name() {return g_name;}
	public void setG_name(String g_name) {this.g_name = g_name;}
	public String getSubject() {return subject;}
	public void setSubject(String subject) {this.subject = subject;}
	public String getContent() {return content;}
	public void setContent(String content) {this.content = content;}
	public Timestamp getRegdate() {return regdate;}
	public void setRegdate(Timestamp regdate) {this.regdate = regdate;}
	public int getReportedNum() {return reportedNum;}
	public void setReportedNum(int reportedNum) {this.reportedNum = reportedNum;}
	
	
}


