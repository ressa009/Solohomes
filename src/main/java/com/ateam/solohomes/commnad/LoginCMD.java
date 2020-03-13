package com.ateam.solohomes.commnad;

import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import org.springframework.ui.Model;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.LoginDAO;
import com.ateam.solohomes.beans.LoginDTO;



public class LoginCMD implements Command {

	@Override
	public void execute(Model model) {
		
		Map<String, Object>map = model.asMap();
		String id = (String) map.get("id");
		String pw = (String) map.get("pw");
		
		LoginDAO dao = C.sqlSession.getMapper(LoginDAO.class);
		int result = 0;
		
		try {
				LoginDTO mdto = dao.selectById(id);
				int cnt = mdto.getEmailsign();
				String pwpw = mdto.getPw();
				
				if(pwpw.equals(pw) && cnt > 0) {
					result = 1;		// 로그인 성공
					model.addAttribute("userUID", mdto.getUid());
					model.addAttribute("userID", mdto.getId());
					model.addAttribute("userLevel", mdto.getLevel());
					
				}else if(pwpw.equals(pw) && cnt == 0) {
					result = 2;		// 이메일 인증 안했음
				}else if(!pwpw.equals(pw)) {
					result = 3;		// 비밀번호가 틀렸다
				}
				
		} catch (Exception e) {
			result = 5;		// 아이디가 없다.
			model.addAttribute("result", result);
		}
		
		model.addAttribute("result", result);	// 최종 판정 값.
	}

}
