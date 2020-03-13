package com.ateam.solohomes.beans.manager;

public class MonthlySalesDTO {
	private String year_month;
	private Integer amount;
	
	public MonthlySalesDTO() {
		super();
	}
	public MonthlySalesDTO(String year_month, Integer amount) {
		super();
		this.year_month = year_month;
		this.amount = amount;
	}
	
	public String getYear_month() {return year_month;}
	public void setYear_month(String year_month) {this.year_month = year_month;}
	public Integer getAmount() {return amount;}
	public void setAmount(Integer amount) {this.amount = amount;}
	
}
