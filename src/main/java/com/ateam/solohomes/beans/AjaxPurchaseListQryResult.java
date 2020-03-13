package com.ateam.solohomes.beans;

public class AjaxPurchaseListQryResult {
	int count; // DML 결과값
	String status; // 쿼리 결과
	
	public AjaxPurchaseListQryResult() {}
	
	public AjaxPurchaseListQryResult(int count, String status) {
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
