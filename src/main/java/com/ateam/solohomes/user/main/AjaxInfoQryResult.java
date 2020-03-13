package com.ateam.solohomes.user.main;

public class AjaxInfoQryResult {
	
	int count;//DML결과값
	String status; // 쿼리결과
	public AjaxInfoQryResult() {
		super();
	}
	public AjaxInfoQryResult(int count, String status) {
		super();
		this.count = count;
		this.status = status;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
