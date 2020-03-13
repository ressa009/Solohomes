package com.ateam.solohomes.commnad;

import java.util.Map;

import org.springframework.ui.Model;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.manager.ManagerDAO;
import com.ateam.solohomes.beans.manager.SeriesComponentsDTO;

public class ManagerSelectSeriesCommmand implements Command {

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		int uid = (Integer)map.get("sr_uid");
		
		ManagerDAO dao = C.sqlSession.getMapper(ManagerDAO.class);
		
		SeriesComponentsDTO dto = null;
		
		dto = dao.selectSeriesByUid(uid);
		
		if (dto != null) {
			model.addAttribute("series", dto);
		}
	}

}
