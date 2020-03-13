package com.ateam.solohomes.commnad;

import java.util.Map;

import org.springframework.ui.Model;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.MemberDTO;
import com.ateam.solohomes.beans.MypageDAO;

public class MypageMemberUpdateCommand implements Command {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		
		MemberDTO dto = (MemberDTO)map.get("dto");
		
		MypageDAO dao = C.sqlSession.getMapper(MypageDAO.class);
		
		int result = dao.updateMemberInfo(dto);
		
		System.out.println("update Query result: " + dto);
		System.out.println("update Query result: " + result);
		
		model.addAttribute("mb_uid", dto.getMb_uid());
		model.addAttribute("result", result);

	}

}
