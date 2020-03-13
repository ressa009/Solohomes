package com.ateam.solohomes.beans;

public class MemberDTO {
	
	private int mb_uid;
	private String mb_id;
	private String mb_pw;
	private String mb_nn;
	private String mb_name;
	private String mb_phone;
	private String mb_email;
	private String mb_emailhash;
	private int mb_emailsign;
	private String mb_zipcode;
	private String mb_addr;
	private String mb_addr2;
	private String mb_regdate;
	private int mb_level;
	
	
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}



	public MemberDTO(int mb_uid, String mb_id, String mb_pw, String mb_nn, String mb_name, String mb_phone,
			String mb_email, String mb_emailhash, int mb_emailsign, String mb_zipcode, String mb_addr, String mb_addr2,
			String mb_regdate, int mb_level) {
		super();
		this.mb_uid = mb_uid;
		this.mb_id = mb_id;
		this.mb_pw = mb_pw;
		this.mb_nn = mb_nn;
		this.mb_name = mb_name;
		this.mb_phone = mb_phone;
		this.mb_email = mb_email;
		this.mb_emailhash = mb_emailhash;
		this.mb_emailsign = mb_emailsign;
		this.mb_zipcode = mb_zipcode;
		this.mb_addr = mb_addr;
		this.mb_addr2 = mb_addr2;
		this.mb_regdate = mb_regdate;
		this.mb_level = mb_level;
	}



	public int getMb_uid() {
		return mb_uid;
	}


	public void setMb_uid(int mb_uid) {
		this.mb_uid = mb_uid;
	}


	public String getmb_id() {
		return mb_id;
	}


	public void setmb_id(String mb_id) {
		this.mb_id = mb_id;
	}


	public String getMb_pw() {
		return mb_pw;
	}


	public void setMb_pw(String mb_pw) {
		this.mb_pw = mb_pw;
	}


	public String getMb_nn() {
		return mb_nn;
	}


	public void setMb_nn(String mb_nn) {
		this.mb_nn = mb_nn;
	}


	public String getMb_name() {
		return mb_name;
	}

	
	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}


	public String getMb_phone() {
		return mb_phone;
	}


	public void setMb_phone(String mb_phone) {
		this.mb_phone = mb_phone;
	}


	public String getMb_email() {
		return mb_email;
	}


	public void setMb_email(String mb_email) {
		this.mb_email = mb_email;
	}


	public String getMb_emailhash() {
		return mb_emailhash;
	}


	public void setMb_emailhash(String mb_emailhash) {
		this.mb_emailhash = mb_emailhash;
	}


	public int getMb_emailsign() {
		return mb_emailsign;
	}


	public void setMb_emailsign(int mb_emailsign) {
		this.mb_emailsign = mb_emailsign;
	}


	public String getMb_zipcode() {
		return mb_zipcode;
	}


	public void setMb_zipcode(String mb_zipcode) {
		this.mb_zipcode = mb_zipcode;
	}


	public String getMb_addr() {
		return mb_addr;
	}


	public void setMb_addr(String mb_addr) {
		this.mb_addr = mb_addr;
	}


	public String getMb_addr2() {
		return mb_addr2;
	}


	public void setMb_addr2(String mb_addr2) {
		this.mb_addr2 = mb_addr2;
	}


	public String getMb_regdate() {
		return mb_regdate;
	}


	public void setMb_regdate(String mb_regdate) {
		this.mb_regdate = mb_regdate;
	}


	public int getMb_level() {
		return mb_level;
	}


	public void setMb_level(int mb_level) {
		this.mb_level = mb_level;
	}

	
	@Override
	public String toString() {
		return String.format("[MemberDTO: %d, %s, %s, %s, %s, %s]", 
				mb_uid, mb_nn, mb_name, mb_email, mb_phone, mb_regdate);
	}
	
	
}
