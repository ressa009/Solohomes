package com.ateam.solohomes.beans.manager;

public class DailySalesDTO {
	private String day;
	private Integer quantity = 0;
	private Integer amount;
	
	private Integer stack_amount = 0;
	
	public DailySalesDTO() {
		super();
	}
	public DailySalesDTO(String day, Integer quantity, Integer amount) {
		super();
		this.day = day;
		this.quantity = quantity;
		this.amount = amount;
	}
	
	public String getDay() {return day;}
	public void setDay(String day) {this.day = day;}
	public Integer getQuantity() {return quantity;}
	public void setQuantity(Integer quantity) {this.quantity = quantity;}
	public Integer getAmount() {return amount;}
	public void setAmount(Integer amount) {this.amount = amount;}
	public Integer getStack_amount() {return stack_amount;}
	public void setStack_amount(Integer stack_amount) {this.stack_amount = stack_amount;}
}
