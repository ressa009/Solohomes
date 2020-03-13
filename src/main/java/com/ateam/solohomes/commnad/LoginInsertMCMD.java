package com.ateam.solohomes.commnad;

import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import org.omg.CORBA.Request;
import org.springframework.ui.Model;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.LoginDAO;
import com.ateam.solohomes.beans.LoginDTO;

import util.SHA256;

public class LoginInsertMCMD implements Command {

	@Override
	public void execute(Model model) {
		
		Map<String, Object>map = model.asMap();
		LoginDTO mdto = (LoginDTO) map.get("MDTO");
		// String userId= mdto.getId();
		
		String email = mdto.getEmail();
		mdto.setEmailhash(new SHA256().getSHA256(email));
		
		LoginDAO dao = C.sqlSession.getMapper(LoginDAO.class);
		int cnt = dao.insertMember(mdto);
		
		int userUID = -1;
		String userID = "";
		int level = 0;
		
		
		
		if(cnt == 1) {
			
			dao = C.sqlSession.getMapper(LoginDAO.class);
			mdto = dao.selectById(mdto.getId());
			
			userUID = mdto.getUid();
			userID = mdto.getId();
			level = mdto.getLevel();
		
		}
		
		model.addAttribute("result", cnt);
		//model.addAttribute("userId", userId);
		

	}

}
