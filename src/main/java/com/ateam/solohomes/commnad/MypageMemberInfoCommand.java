package com.ateam.solohomes.commnad;

import java.util.Map;

import org.springframework.ui.Model;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.MemberDTO;
import com.ateam.solohomes.beans.MypageDAO;

public class MypageMemberInfoCommand implements Command {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int mb_uid = (Integer)map.get("mb_uid");
		
		MypageDAO dao = C.sqlSession.getMapper(MypageDAO.class);
		
		MemberDTO dto = dao.selectMemberInfo(mb_uid);
		model.addAttribute("dto", dto);

	}

}
