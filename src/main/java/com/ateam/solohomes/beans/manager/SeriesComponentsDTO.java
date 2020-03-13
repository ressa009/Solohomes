package com.ateam.solohomes.beans.manager;

import java.sql.Timestamp;
import java.util.ArrayList;

import com.ateam.solohomes.beans.GoodsDTO;

public class SeriesComponentsDTO {
	private int sr_uid;
	private String sr_subject;
	private String sr_img;
	private Timestamp sr_regdate;
	private ArrayList<GoodsDTO> goodsList;

	public SeriesComponentsDTO() {
		super();
	}
	public SeriesComponentsDTO(int sr_uid, String sr_subject, String sr_img, Timestamp sr_regdate,
			ArrayList<GoodsDTO> goodsList) {
		super();
		this.sr_uid = sr_uid;
		this.sr_subject = sr_subject;
		this.sr_img = sr_img;
		this.sr_regdate = sr_regdate;
		this.goodsList = goodsList;
	}

	public int getSr_uid() {return sr_uid;}
	public void setSr_uid(int sr_uid) {this.sr_uid = sr_uid;}
	public String getSr_subject() {return sr_subject;}
	public void setSr_subject(String sr_subject) {this.sr_subject = sr_subject;}
	public String getSr_img() {return sr_img;}
	public void setSr_img(String sr_img) {this.sr_img = sr_img;}
	public Timestamp getSr_regdate() {return sr_regdate;}
	public void setSr_regdate(Timestamp sr_regdate) {this.sr_regdate = sr_regdate;}
	public ArrayList<GoodsDTO> getGoodsList() {return goodsList;}
	public void setGoodsList(ArrayList<GoodsDTO> goodsList) {this.goodsList = goodsList;}
}
