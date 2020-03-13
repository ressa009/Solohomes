package com.ateam.solohomes.commnad;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.Model;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.LoginDAO;
import com.ateam.solohomes.beans.LoginDTO;


public class LoginIdPwSendCMD implements Command {

	@Override
	public void execute(Model model) {
		
		String email = (String) model.getAttribute("email");
		String nn = (String) model.getAttribute("nn");
		
		LoginDAO dao = C.sqlSession.getMapper(LoginDAO.class);
		
		int result = 0;
		try {
			
		LoginDTO dto = dao.findIdPw(nn, email);
		String setfrom = "AteamProject2020@gmail.com";
		String tomail = dto.getEmail(); //(String) model.getAttribute("email"); // 받는 사람 이메일
		String title = "안녕하세요. Holo Homes ID/PW 회신 입니다!"; // 제목
		String content = "고객님의 ID: " + dto.getId() + "\nPW: " + dto.getPw() + " 입니다"; // 내용
		System.out.println(dto.getId());
		System.out.println(dto.getPw());
		
			MimeMessage message = C.mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			C.mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
			result = 1;	// 실패
			
		}

		model.addAttribute("result", result);
	}

}
