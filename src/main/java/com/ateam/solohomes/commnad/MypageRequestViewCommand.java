package com.ateam.solohomes.commnad;

import java.sql.Timestamp;
import java.util.Map;

import org.springframework.ui.Model;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.MypageDAO;
import com.ateam.solohomes.beans.RequestDTO;

public class MypageRequestViewCommand implements Command {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		int rq_uid = (Integer)map.get("rq_uid");

		MypageDAO dao = C.sqlSession.getMapper(MypageDAO.class);
		RequestDTO dto = dao.selectRequestByUid(rq_uid);
		
		
		switch(dto.getRq_type()){
		case 1: 
			dto.setRq_type_str("배송문의");
			break;
		case 2:
			dto.setRq_type_str("상품문의");
			break;
		case 3:
			dto.setRq_type_str("결제문의");
			break;
		case 4:
			dto.setRq_type_str("환불문의");
			break;
		case 5:
			dto.setRq_type_str("기타문의");
			break;
			
		}

		model.addAttribute("dto", dto);

	}

}
