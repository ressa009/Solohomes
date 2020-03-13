package com.ateam.solohomes.beans;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface CategoryDAO {

	public ArrayList<GoodsDTO> selectByTypee(int g_type);	// 카테고리에서 타입값으로 GoodsDTO 뽑기
	public ArrayList<GoodsDTO> selectByGtype(@Param("sortColumn") int sortColumn,@Param("g_type") int g_type);	// 타입정렬
	
	
	
}
