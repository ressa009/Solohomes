package com.ateam.solohomes.commnad;

import java.util.Map;

import org.springframework.ui.Model;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.MypageDAO;
import com.ateam.solohomes.beans.RequestDTO;

public class MypageRequestWriteCommand implements Command{

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		RequestDTO dto = (RequestDTO)map.get("dto");

		System.out.println("mb_uid: " + dto.getMb_uid());
		System.out.println("rq_type: " + dto.getRq_type());
		System.out.println("rq_subject: " + dto.getRq_subject());

		MypageDAO dao = C.sqlSession.getMapper(MypageDAO.class);
		model.addAttribute("result", dao.insertRequest(dto));
		
	}
	
}
