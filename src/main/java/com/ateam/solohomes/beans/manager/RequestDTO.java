package com.ateam.solohomes.beans.manager;

import java.sql.Timestamp;

public class RequestDTO {
	private int uid;
	private String id;
	private int type;
	private String subject;
	private String content;
	private String response;
	private Timestamp regdate;
	
	public RequestDTO() {
		super();
	}
	public RequestDTO(int uid, String id, int type, String subject, String content, String response, Timestamp regdate) {
		super();
		this.uid = uid;
		this.id = id;
		this.type = type;
		this.subject = subject;
		this.content = content;
		this.response = response;
		this.regdate = regdate;
	}
	
	public int getUid() {return uid;}
	public void setUid(int uid) {this.uid = uid;}
	public String getId() {return id;}
	public void setId(String id) {this.id = id;}
	public int getType() {return type;}
	public void setType(int type) {this.type = type;}
	public String getSubject() {return subject;}
	public void setSubject(String subject) {this.subject = subject;}
	public String getContent() {return content;}
	public void setContent(String content) {this.content = content;}
	public String getResponse() {return response;}
	public void setResponse(String response) {this.response = response;}
	public Timestamp getRegdate() {return regdate;}
	public void setRegdate(Timestamp regdate) {this.regdate = regdate;}
	
}
