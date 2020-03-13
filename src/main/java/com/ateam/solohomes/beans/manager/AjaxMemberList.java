package com.ateam.solohomes.beans.manager;

import java.util.ArrayList;

public class AjaxMemberList {
	int count;
	String status;
	String sortColumn;
	ArrayList<MemberRenumDTO> list;
	
	public AjaxMemberList() {
		super();
	}
	public AjaxMemberList(int count, String status, String sortColumn, ArrayList<MemberRenumDTO> list) {
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
	public ArrayList<MemberRenumDTO> getList() {return list;}
	public void setList(ArrayList<MemberRenumDTO> list) {this.list = list;}
	public String getSortColumn() {return sortColumn;}
	public void setSortColumn(String sortColumn) {this.sortColumn = sortColumn;}
	
	
}
