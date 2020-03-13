package com.ateam.solohomes.beans.manager;

import java.sql.Timestamp;

public class MemberRenumDTO {
	private int uid;
	private String id;
	private String password = "";
	private String nn;
	private String name;
	private String phone;
	private String email;
	private String zipcode;
	private String addr;
	private String addr2;
	private Timestamp regdate;
	private int level;
	
	private int reportedNum = 0;
	
	public MemberRenumDTO() {
		super();
	}
	
	public MemberRenumDTO(int uid, String id, String nn, String name, String phone, String email, String zipcode,
			String addr, String addr2, Timestamp regdate, int level) {
		super();
		this.uid = uid;
		this.id = id;
		this.nn = nn;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.zipcode = zipcode;
		this.addr = addr;
		this.addr2 = addr2;
		this.regdate = regdate;
		this.level = level;
	}
	
	public int getUid() {return uid;}
	public void setUid(int uid) {this.uid = uid;}
	public String getId() {return id;}
	public void setId(String id) {this.id = id;}
	public String getNn() {return nn;}
	public void setNn(String nn) {this.nn = nn;}
	public String getName() {return name;}
	public void setName(String name) {this.name = name;}
	public String getPhone() {return phone;}
	public void setPhone(String phone) {this.phone = phone;}
	public String getEmail() {return email;}
	public void setEmail(String email) {this.email = email;}
	public String getZipcode() {return zipcode;}
	public void setZipcode(String zipcode) {this.zipcode = zipcode;}
	public String getAddr() {return addr;}
	public void setAddr(String addr) {this.addr = addr;}
	public String getAddr2() {return addr2;}
	public void setAddr2(String addr2) {this.addr2 = addr2;}
	public Timestamp getRegdate() {return regdate;}
	public void setRegdate(Timestamp regdate) {this.regdate = regdate;}
	public int getLevel() {return level;}
	public void setLevel(int level) {this.level = level;}
	public int getReportedNum() {return reportedNum;}
	public void setReportedNum(int reportedNum) {this.reportedNum = reportedNum;}

	public String getPassword() {return password;}
	public void setPassword(String password) {this.password = password;}
}
