package com.ateam.solohomes.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.LoginDAO;


@RestController
@RequestMapping(value="/Lajax")
public class LoginRestController {

	@RequestMapping(value="/idCheck.do", method = RequestMethod.GET)
	public int idCheck(@RequestParam("id") String id) {
		
		LoginDAO dao = C.sqlSession.getMapper(LoginDAO.class);
		
		return dao.checkId(id);
	}
	
	@RequestMapping(value="/nickCheck.do", method = RequestMethod.GET)
	public int nickCheck(@RequestParam("nn") String nn) {
		
		LoginDAO dao = C.sqlSession.getMapper(LoginDAO.class);
		
		return dao.checkNN(nn);
	}
	
	@RequestMapping(value="/pwCheck.do", method = RequestMethod.GET)
	public void pwCheck(String pw1, String pw2) {
		
	}
	
	
	
}
