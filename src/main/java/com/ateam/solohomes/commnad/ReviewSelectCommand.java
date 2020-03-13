package com.ateam.solohomes.commnad;

import java.util.Map;

import org.springframework.ui.Model;

import com.ateam.solohomes.C;
import com.ateam.solohomes.user.main.ReviewDAO;

public class ReviewSelectCommand implements Command {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int g_uid = (Integer)map.get("g_uid");
		
		ReviewDAO dao = C.sqlSession.getMapper(ReviewDAO.class);
		model.addAttribute("list", dao.select(g_uid));
	}

}










