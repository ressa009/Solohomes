package com.ateam.solohomes.beans.search;

public class SearchDTO {
	private int g_uid;
	private int g_type;
	private String g_name;
	
	public SearchDTO() {
		
	}
	public SearchDTO(int g_uid, int g_type, String g_name) {
		super();
		this.g_uid = g_uid;
		this.g_type = g_type;
		this.g_name = g_name;
	}
	public int getG_uid() {
		return g_uid;
	}
	public void setG_uid(int g_uid) {
		this.g_uid = g_uid;
	}
	public int getG_type() {
		return g_type;
	}
	public void setG_type(int g_type) {
		this.g_type = g_type;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	
	
}
