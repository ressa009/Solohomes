package com.ateam.solohomes.beans.manager;

import java.util.ArrayList;

public class AjaxRequestList {
	int count;
	String status;
	String sortColumn;
	ArrayList<RequestDTO> list;
	
	public AjaxRequestList() {
		super();
	}
	public AjaxRequestList(int count, String status, String sortColumn, ArrayList<RequestDTO> list) {
		super();
		this.count = count;
		this.status = status;
		this.sortColumn = sortColumn;
		this.list = list;
	}
	
	public int getCount() {return count;}
	public void setCount(int count) {this.count = count;}
	public String getStatus() {return status;}
	public void setStatus(String status) {this.status = status;}
	public String getSortColumn() {return sortColumn;}
	public void setSortColumn(String sortColumn) {this.sortColumn = sortColumn;}
	public ArrayList<RequestDTO> getList() {return list;}
	public void setList(ArrayList<RequestDTO> list) {this.list = list;}
	
	
}
