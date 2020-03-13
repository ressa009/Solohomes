package com.ateam.solohomes.beans;

import com.ateam.solohomes.beans.ReviewDTO;



public class AjaxReviewList {
	int count; // 데이터 개수
	String status; // 처리 결과
	ReviewDTO dto; // 데이터
	
	
	public AjaxReviewList() {
		
	}


	public AjaxReviewList(int count, String status, ReviewDTO dto) {
		super();
		this.count = count;
		this.status = status;
		this.dto = dto;
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



	public ReviewDTO getDto() {
		return dto;
	}


	public void setDto(ReviewDTO dto) {
		this.dto = dto;
	}

	
	
}
