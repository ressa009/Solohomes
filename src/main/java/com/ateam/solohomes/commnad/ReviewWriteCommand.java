package com.ateam.solohomes.commnad;

import java.util.Map;

import org.springframework.ui.Model;

import com.ateam.solohomes.C;
import com.ateam.solohomes.user.main.ReviewDAO;
import com.ateam.solohomes.user.main.ReviewDTO;

public class ReviewWriteCommand implements Command {

	@Override
	public void execute(Model model) {
		// Model 안에 있는 값(attribute) 꺼내는 방법
		Map<String, Object> map = model.asMap();
		ReviewDTO dto = (ReviewDTO)map.get("dto");
	
		// MyBatis 사용
		ReviewDAO dao = C.sqlSession.getMapper(ReviewDAO.class);
		model.addAttribute("result", dao.insert(dto));
		
		// auto-generated key 값 확인
		System.out.println("생성된 uid = " + dto.getCo_uid());				
	}
}













