package com.ateam.solohomes.beans.manager;

import java.util.ArrayList;

public class AjaxSeriesList {
	int count;
	String status;
	ArrayList<SeriesComponentsDTO> list;
	
	public AjaxSeriesList() {
		super();
	}
	public AjaxSeriesList(int count, String status, ArrayList<SeriesComponentsDTO> list) {
		super();
		this.count = count;
		this.status = status;
		this.list = list;
	}

	public int getCount() {return count;}
	public void setCount(int count) {this.count = count;}
	public String getStatus() {return status;}	
	public void setStatus(String status) {this.status = status;}
	public ArrayList<SeriesComponentsDTO> getList() {return list;}
	public void setList(ArrayList<SeriesComponentsDTO> list) {this.list = list;}
}
