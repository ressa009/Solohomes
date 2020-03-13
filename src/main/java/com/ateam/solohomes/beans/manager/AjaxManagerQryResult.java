package com.ateam.solohomes.beans.manager;

public class AjaxManagerQryResult {
	int count; // dml result
	String status; // query result
	
	
	public AjaxManagerQryResult() {
		super();
	}
	public AjaxManagerQryResult(int count, String status) {
		super();
		this.count = count;
		this.status = status;
	}
	
	public int getCount() {return count;}
	public void setCount(int count) {this.count = count;}
	public String getStatus() {return status;}
	public void setStatus(String status) {this.status = status;}
	
}
