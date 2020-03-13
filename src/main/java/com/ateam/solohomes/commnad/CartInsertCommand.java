package com.ateam.solohomes.commnad;

import java.util.Map;

import org.springframework.ui.Model;

import com.ateam.solohomes.C;
import com.ateam.solohomes.user.main.ProductInfoDAO;
import com.ateam.solohomes.user.main.ProductInfoDTO;

public class CartInsertCommand implements Command {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		ProductInfoDTO dto = (ProductInfoDTO) map.get("dto");
		// MyBatis 사용
		ProductInfoDAO dao = C.sqlSession.getMapper(ProductInfoDAO.class);
		model.addAttribute("cart", dao.cartInsert(dto));
	}

}