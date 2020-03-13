package com.ateam.solohomes.user.main;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface ProductInfoDAO{
	// 가구정보 띄우기
	public ProductInfoDTO selectGoods(int g_uid);
	
	// 가구상세정보
	public ArrayList<ProductInfoDTO> selectgInfo(int g_uid);
	
	// 좋아요 개수 및 여부
	public ArrayList<ProductInfoDTO> likeCnt(int g_uid);
	public ProductInfoDTO likeYN(int mb_uid, int g_uid);
	
	// 좋아요
	public int likePlus(int g_uid);	
	public int likeInsert(int mb_uid, int g_uid);
	
	// 좋아요 취소
	public int likeMinus(int g_uid);	
	public int likeDelete(int mb_uid, int g_uid);
	
	// 장바구니
	public int cartInsert(@Param("dto") ProductInfoDTO dto);
}
