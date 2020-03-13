package com.ateam.solohomes.beans.manager;

import java.util.ArrayList;

public class AjaxGoodsList {
	int count;
	String status;
	ArrayList<GoodsSalNumDTO> list;
	
	public AjaxGoodsList() {
		super();
	}
	public AjaxGoodsList(int count, String status, ArrayList<GoodsSalNumDTO> list) {
		super();
		this.count = count;
		this.status = status;
		this.list = list;
	}
	
	public int getCount() {return count;}
	public void setCount(int count) {this.count = count;}
	public String getStatus() {return status;}
	public void setStatus(String status) {this.status = status;}
	public ArrayList<GoodsSalNumDTO> getList() {return list;}
	public void setList(ArrayList<GoodsSalNumDTO> list) {this.list = list;}
}
