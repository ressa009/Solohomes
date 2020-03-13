package com.ateam.solohomes.commnad;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.ui.Model;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.GoodsDTO;
import com.ateam.solohomes.beans.GoodsInfoDTO;
import com.ateam.solohomes.beans.manager.ManagerDAO;

public class ManagerSelectGoodsCommmand implements Command {

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		int g_uid = (Integer)map.get("g_uid");
		
		ManagerDAO dao = C.sqlSession.getMapper(ManagerDAO.class);
		
		GoodsDTO gDto = null;
		ArrayList<GoodsInfoDTO> inList = null;
		
		gDto = dao.selectGoodsByUid(g_uid);
		inList = dao.selectGoodsInfosByGuid(g_uid);
		
		if (gDto != null) {
			model.addAttribute("goods", gDto);
		}
		if (inList != null && inList.size() > 0) {
			model.addAttribute("inList", inList);
		}
	}
}
