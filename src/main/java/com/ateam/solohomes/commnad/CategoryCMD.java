package com.ateam.solohomes.commnad;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.CategoryDAO;
import com.ateam.solohomes.beans.GoodsDTO;

public class CategoryCMD implements Command {

	@Override
	public void execute(Model model) {
		
		int g_type = (Integer) model.getAttribute("g_type");
		System.out.println(g_type);
		
		CategoryDAO dao = C.sqlSession.getMapper(CategoryDAO.class);
		ArrayList<GoodsDTO> gdto = new ArrayList<GoodsDTO>();
		String typeName ="";
	
		
		switch(g_type) {
			case 1:
				gdto = dao.selectByTypee(g_type);
				typeName= "침대";
				break;
			case 2:
				gdto = dao.selectByTypee(g_type);
				typeName= "화장대";
			break;
			case 3:
				gdto = dao.selectByTypee(g_type);
				typeName= "서랍장";
			break;
			case 4:
				gdto = dao.selectByTypee(g_type);
				typeName= "소파";
			break;
			case 5:
				gdto = dao.selectByTypee(g_type);
				typeName= "거실장";
			break;
			case 6:
				gdto = dao.selectByTypee(g_type);
				typeName= "옷장";
			break;
			case 7:
				gdto = dao.selectByTypee(g_type);
				typeName= "테이블";
			break;
			case 8:
				gdto = dao.selectByTypee(g_type);
				typeName= "의자";
			break;
			case 9:
				gdto = dao.selectByTypee(g_type);
				typeName= "책상";
			break;
			case 10:
				gdto = dao.selectByTypee(g_type);
				typeName= "책장";
			break;
			default:
				break;
		}
		
		
		model.addAttribute("gdto", gdto);
		model.addAttribute("typeName", typeName);
		

		
	}

}
