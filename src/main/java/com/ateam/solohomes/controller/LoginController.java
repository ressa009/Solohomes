package com.ateam.solohomes.controller;

import java.io.UnsupportedEncodingException;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.LoginDTO;
import com.ateam.solohomes.commnad.Command;
import com.ateam.solohomes.commnad.LoginCMD;
import com.ateam.solohomes.commnad.LoginCodeCheckCMD;
import com.ateam.solohomes.commnad.LoginIdPwSendCMD;
import com.ateam.solohomes.commnad.LoginInsertMCMD;
import com.ateam.solohomes.commnad.LoginSignSendCMD;



@Controller
@RequestMapping(value="/member")
public class LoginController {

	private Command cmd;
	private SqlSession sqlSession;
	private JavaMailSender mailSender;
	
	@Autowired
	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
		C.mailSender = mailSender;
		
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		C.sqlSession = sqlSession;
	}
	
	@RequestMapping(value="/login.do")
	public String login(Model model) {
		return "member/login";
	}
	
	@RequestMapping(value="/loginOk.do", method=RequestMethod.POST)
	public String loginOk(String id, String pw, Model model, HttpServletRequest request, HttpSession session) {
		
		model.addAttribute("id", id);
		model.addAttribute("pw", pw);
		cmd = new LoginCMD();
		cmd.execute(model);
		
		session = request.getSession();
		
		if((Integer)model.getAttribute("result") == 1) {
			session.setAttribute("userUID", model.getAttribute("userUID"));
			session.setAttribute("userID", model.getAttribute("userID"));
			session.setAttribute("userLevel", model.getAttribute("userLevel"));
		}
		
		return "member/loginOk";
	}
	
	@RequestMapping(value="/findId.do")
	public String findId() {
		return "member/findId";
	}
	
	
	@RequestMapping(value="/terms.do")
	public String terms() {
		return "member/terms";
	}
	
	@RequestMapping(value="/insertInfo.do")
	public String insertInfo() {
		return "member/insertInfo";
	}
	
	@RequestMapping(value = "/idpwSend.do")
	public String emailSend(String nn , String email, Model model) {

		model.addAttribute("nn", nn);
		model.addAttribute("email", email);
		cmd = new LoginIdPwSendCMD();
		cmd.execute(model);
		
		return "member/idpwSend";
	}
	
	@RequestMapping(value = "/insertInfoOk.do", method=RequestMethod.POST)
	public String insertInfoOk(LoginDTO mdto, Model model) {
		
		model.addAttribute("MDTO", mdto);
		cmd = new LoginInsertMCMD();
		cmd.execute(model);
		
		return "member/insertInfoOk";
	}
	
	@RequestMapping(value ="/signSend.do")
	public String signSend(Model model, HttpSession session) {
		
		model.addAttribute("userID", session.getAttribute("userID"));
		cmd = new LoginSignSendCMD();
		cmd.execute(model);
		
		return "member/signSend";
	}
	
	@RequestMapping(value="/emailCheckAction.do")
	public String emailCheckAction(Model model, HttpSession session){
		
		model.addAttribute("userID", session.getAttribute("userID"));
		
		cmd = new LoginCodeCheckCMD();
		cmd.execute(model);
		
		if((Integer)model.getAttribute("result") == 1) {
			session.setAttribute("userUID", model.getAttribute("userUID"));
			session.setAttribute("userID", model.getAttribute("userID"));
			session.setAttribute("userLevel", model.getAttribute("userLevel"));
		}
		
		return "member/emailCheckAction";
	}
	
	@RequestMapping(value="/logOut.do")
	public String logout() {
		return "member/logOut";
	}
	@RequestMapping(value="/loginCheck.do")
	public String loginCheck() {
		return "member/loginCheck";
	}
	
}
