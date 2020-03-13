package com.ateam.solohomes.beans.manager;

import com.ateam.solohomes.beans.GoodsDTO;

public class GoodsSalNumDTO extends GoodsDTO {
	private int salNum = 0;

	public GoodsSalNumDTO() {
		super();
	}
	
	public int getSalNum() {return salNum;}
	public void setSalNum(int salNum) {this.salNum = salNum;}
}
