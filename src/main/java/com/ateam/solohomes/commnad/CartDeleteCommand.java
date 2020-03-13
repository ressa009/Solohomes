package com.ateam.solohomes.commnad;

import org.springframework.ui.Model;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.CartDAO;

public class CartDeleteCommand implements Command {

	@Override
	public void execute(Model model) {
		String [] cr_uid = (String [] )model.getAttribute("cr_uid");
		CartDAO dao = C.sqlSession.getMapper(CartDAO.class);
		int result = 0;
		for (int i = 0; i < cr_uid.length; i++) {
			result = dao.delete(Integer.parseInt(cr_uid[i]));
			if(result == 0) break;
		}
		model.addAttribute("result", result);
	}

}
