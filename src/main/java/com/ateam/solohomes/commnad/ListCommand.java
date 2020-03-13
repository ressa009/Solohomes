package com.ateam.solohomes.commnad;

import org.springframework.ui.Model;

import com.ateam.solohomes.C;
import com.ateam.solohomes.user.main.ListDAO;

public class ListCommand implements Command {

	@Override
	public void execute(Model model) {
		// MyBatis 사용
		ListDAO dao = C.sqlSession.getMapper(ListDAO.class);
		model.addAttribute("seriese", dao.selectSeries());
		model.addAttribute("newProduct", dao.selectNew());
		model.addAttribute("best", dao.selectBest());
	}

}
