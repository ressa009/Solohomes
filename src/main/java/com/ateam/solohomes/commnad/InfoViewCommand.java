package com.ateam.solohomes.commnad;

import java.util.Map;

import org.springframework.ui.Model;

import com.ateam.solohomes.C;
import com.ateam.solohomes.user.main.ProductInfoDAO;
import com.ateam.solohomes.user.main.ProductInfoDTO;

public class InfoViewCommand implements Command {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int g_uid = (Integer)map.get("g_uid");
		int mb_uid = (Integer)map.get("mb_uid");
		
		ProductInfoDAO dao = C.sqlSession.getMapper(ProductInfoDAO.class);
		ProductInfoDTO dto = dao.selectGoods(g_uid);
		ProductInfoDTO dto2 = dao.likeYN(mb_uid, g_uid);
		
		model.addAttribute("goods", dto);
		model.addAttribute("likeYN", dto2);
		model.addAttribute("gInfo", dao.selectgInfo(g_uid));
	}

}
