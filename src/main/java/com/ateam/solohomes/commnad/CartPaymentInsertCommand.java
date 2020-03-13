package com.ateam.solohomes.commnad;

import java.util.Map;

import org.springframework.ui.Model;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.CartDAO;
import com.ateam.solohomes.beans.PurchaseDTO;

public class CartPaymentInsertCommand implements Command {

	@Override
	public void execute(Model model) {
		int mb_uid = (Integer) model.getAttribute("mb_uid");
		String py_zipcode = (String) model.getAttribute("py_zipcode");
		String py_addr = (String) model.getAttribute("py_addr");
		String py_addr2 = (String) model.getAttribute("py_addr2");
		
		Map<String, Object> map = model.asMap();
		PurchaseDTO dto = (PurchaseDTO)map.get("dto");
		String [] in_uid = (String [])map.get("in_uid");
		String [] py_amount = (String [])map.get("py_amount");
		
		dto.setMb_uid(mb_uid);
		dto.setPy_zipcode(py_zipcode);
		dto.setPy_addr(py_addr);
		dto.setPy_addr2(py_addr2);
		
		int result = 0;
		CartDAO dao = C.sqlSession.getMapper(CartDAO.class);
		for (int i = 0; i < in_uid.length; i++) {
			dto.setIn_uid(Integer.parseInt(in_uid[i]));
			dto.setPy_amount((Integer.parseInt(py_amount[i])));
			result = dao.insertpayment(dto);
			if(result==0) break;
		}
		dao.deletebyuid(mb_uid);
		model.addAttribute("result", result);
	}

}
