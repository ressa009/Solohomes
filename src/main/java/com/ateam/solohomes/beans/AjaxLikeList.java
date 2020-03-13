package com.ateam.solohomes.beans;

import java.util.ArrayList;

public class AjaxLikeList {
	int count; // 데이터 개수
	String status; // 처리 결과
	ArrayList<GoodsDTO> list; // 데이터
	
	
	public AjaxLikeList() {
		
	}


	public AjaxLikeList(int count, String status, ArrayList<GoodsDTO> list) {
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


	public ArrayList<GoodsDTO> getList() {
		return list;
	}


	public void setList(ArrayList<GoodsDTO> list) {
		this.list = list;
	}
	
	
}
