package com.ateam.solohomes.user.main;

import java.util.ArrayList;

public class AjaxReviewList {

	int count;  // 데이터 갯수
	String status; // 처리결과
	ArrayList<ReviewDTO> list; // 데이터
	
	public AjaxReviewList() {
		super();
	}
	public AjaxReviewList(int count, String status, ArrayList<ReviewDTO> list) {
		super();
		this.count = count;
		this.status = status;
		this.list = list;
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
	public ArrayList<ReviewDTO> getList() {
		return list;
	}
	public void setList(ArrayList<ReviewDTO> list) {
		this.list = list;
	}
}
