package com.ateam.solohomes.controller;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.AjaxCategoryList;
import com.ateam.solohomes.beans.CategoryDAO;
import com.ateam.solohomes.beans.GoodsDTO;

@RestController
@RequestMapping(value ="/Cajax")
public class CategoryRestController {

	
	@RequestMapping(value="/typeCheck.do/{sortType}/{g_type}")
	public AjaxCategoryList typeCheck(@PathVariable("sortType") int sortType,
															@PathVariable("g_type") int g_type) {
		ArrayList<GoodsDTO> list = null;
		AjaxCategoryList result = new AjaxCategoryList();
		int sortColumnNum = 1;
		CategoryDAO gdao = C.sqlSession.getMapper(CategoryDAO.class);
		
		switch(sortType) {
			case 0:
				sortColumnNum = 1;
				break;
			case 1:
				sortColumnNum = 6;
				break;
			case 2:
				sortColumnNum = 7;
				break;
			default:
				break;
		}
		
		list = gdao.selectByGtype(sortColumnNum, g_type);
		
		result.setList(list);
		result.setCount(list.size());
		
		if(list.size() > 0 && list != null) {
			result.setStatus("success");
		} else {
			result.setStatus("fail");
		}
	
		return result;
	}
	
}
