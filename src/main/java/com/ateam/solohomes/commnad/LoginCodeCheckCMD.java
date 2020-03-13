package com.ateam.solohomes.commnad;

import java.util.Map;

import org.springframework.ui.Model;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.LoginDAO;
import com.ateam.solohomes.beans.LoginDTO;

import util.SHA256;

public class LoginCodeCheckCMD implements Command {

	@Override
	public void execute(Model model) {
		
		Map<String, Object>map = model.asMap();
		
		String id = (String) map.get("userID");
		
		LoginDAO dao = C.sqlSession.getMapper(LoginDAO.class);
		
		LoginDTO dto = dao.selectById(id);
		
		String code = dto.getEmailhash();
		String email = dto.getEmail();
		
		System.out.println(code);
		System.out.println(id);
		
		boolean isRight = (new SHA256().getSHA256(email).equals(code)) ? true : false;
		
		int result = 0;
		
		if(isRight == true) {
			dao = C.sqlSession.getMapper(LoginDAO.class);
			dao.emailSignUp(id);
			
			model.addAttribute("userUID",dto.getUid());
			model.addAttribute("userID",dto.getId());
			model.addAttribute("userLevel",dto.getLevel());
			
			result = 1;
		} else {
			result = 0;
		}
		
		model.addAttribute("result", result);
		
	}

}
