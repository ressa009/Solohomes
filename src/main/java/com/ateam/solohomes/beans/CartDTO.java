package com.ateam.solohomes.beans;

import java.sql.Timestamp;

public class CartDTO {

	private int cr_uid;
	private int mb_uid;
	private int in_uid;
	private int cr_amount;
	private Timestamp cr_regdate;
	
	public CartDTO() {
		
	}
	
	public CartDTO(int cr_uid, int mb_uid, int in_uid, int cr_amount, Timestamp cr_regdate) {
		super();
		this.cr_uid = cr_uid;
		this.mb_uid = mb_uid;
		this.in_uid = in_uid;
		this.cr_amount = cr_amount;
		this.cr_regdate = cr_regdate;
	}

	public int getCr_uid() {
		return cr_uid;
	}
	public void setCr_uid(int cr_uid) {
		this.cr_uid = cr_uid;
	}
	public int getMb_uid() {
		return mb_uid;
	}
	public void setMb_uid(int mb_uid) {
		this.mb_uid = mb_uid;
	}
	public int getIn_uid() {
		return in_uid;
	}
	public void setIn_uid(int in_uid) {
		this.in_uid = in_uid;
	}
	public int getCr_amount() {
		return cr_amount;
	}
	public void setCr_amount(int cr_amount) {
		this.cr_amount = cr_amount;
	}
	public Timestamp getCr_regdate() {
		return cr_regdate;
	}
	public void setCr_regdate(Timestamp cr_regdate) {
		this.cr_regdate = cr_regdate;
	}
	
	
}
