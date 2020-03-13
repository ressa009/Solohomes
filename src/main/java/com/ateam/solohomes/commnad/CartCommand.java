package com.ateam.solohomes.commnad;

import java.util.Map;

import org.springframework.ui.Model;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.CartDAO;
import com.ateam.solohomes.beans.CartDTO;

public class CartCommand implements Command {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		CartDTO dto = (CartDTO)map.get("dto");
		CartDAO dao = C.sqlSession.getMapper(CartDAO.class);
		model.addAttribute("result", dao.insert(dto));

	}

}
