package com.ateam.solohomes.beans;

import java.sql.Timestamp;

public class RequestDTO {
	
	private int mb_uid;
	private int rq_uid;
	private int rq_type;
	private String rq_type_str;
	private String rq_subject;
	private String rq_content;
	private String rq_response;
	private Timestamp rq_regdate;
	
	public RequestDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RequestDTO(int rq_uid, int mb_uid, int rq_type, String rq_subject, String rq_content, String rq_response,
			Timestamp rq_regdate) {
		super();
		this.rq_uid = rq_uid;
		this.mb_uid = mb_uid;
		this.rq_type = rq_type;
		this.rq_subject = rq_subject;
		this.rq_content = rq_content;
		this.rq_response = rq_response;
		this.rq_regdate = rq_regdate;
	}

	public int getRq_uid() {
		return rq_uid;
	}

	public void setRq_uid(int rq_uid) {
		this.rq_uid = rq_uid;
	}

	public int getMb_uid() {
		return mb_uid;
	}

	public void setMb_uid(int mb_uid) {
		this.mb_uid = mb_uid;
	}

	public int getRq_type() {
		return rq_type;
	}

	public void setRq_type(int rq_type) {
		this.rq_type = rq_type;
	}

	public String getRq_subject() {
		return rq_subject;
	}

	public void setRq_subject(String rq_subject) {
		this.rq_subject = rq_subject;
	}

	public String getRq_content() {
		return rq_content;
	}

	public void setRq_content(String rq_content) {
		this.rq_content = rq_content;
	}

	public String getRq_response() {
		return rq_response;
	}

	public void setRq_response(String rq_response) {
		this.rq_response = rq_response;
	}

	public Timestamp getRq_regdate() {
		return rq_regdate;
	}

	public void setRq_regdate(Timestamp rq_regdate) {
		this.rq_regdate = rq_regdate;
	}

	public String getRq_type_str() {
		return rq_type_str;
	}

	public void setRq_type_str(String rq_type_str) {
		this.rq_type_str = rq_type_str;
	}

	
	
	
}
