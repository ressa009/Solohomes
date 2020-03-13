package com.ateam.solohomes.beans;

import java.util.ArrayList;

public class AjaxRequestList {
	int count; // 데이터 개수
	String status; // 처리 결과
	ArrayList<RequestDTO> list; // 데이터
	
	
	public AjaxRequestList() {
		
	}


	public AjaxRequestList(int count, String status, ArrayList<RequestDTO> list) {
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


	public ArrayList<RequestDTO> getList() {
		return list;
	}


	public void setList(ArrayList<RequestDTO> list) {
		this.list = list;
	}
	
	
}
