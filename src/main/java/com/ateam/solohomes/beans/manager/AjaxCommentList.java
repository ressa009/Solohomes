package com.ateam.solohomes.beans.manager;

import java.util.ArrayList;

public class AjaxCommentList {
	int count;
	String status;
	String sortColumn;
	ArrayList<CommentRenumDTO> list;
	
	public AjaxCommentList() {
		super();
	}
	public AjaxCommentList(int count, String status, String sortColumn, ArrayList<CommentRenumDTO> list) {
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
	public ArrayList<CommentRenumDTO> getList() {return list;}
	public void setList(ArrayList<CommentRenumDTO> list) {this.list = list;}
}
