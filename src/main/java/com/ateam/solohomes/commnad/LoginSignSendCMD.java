package com.ateam.solohomes.commnad;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.Model;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.LoginDAO;
import com.ateam.solohomes.beans.LoginDTO;

import util.SHA256;

public class LoginSignSendCMD implements Command {

	@Override
	public void execute(Model model) {
		
		String id = null;
		int result = 0;
		
		
		if(model.getAttribute("userID") != null){
			id = (String) model.getAttribute("userID");
		}
		
		if(id == null) {	// 세션없이 넘어온 상황
			result = -1;	// 로그인으로 보내버리기
			return;
		}
		
		LoginDAO dao = C.sqlSession.getMapper(LoginDAO.class);
		
		int emailsign = dao.signCheck(id);
		
		if(emailsign == 1) {	// 이미인증이 된 회원
			result = -2;	// 메인으로 보내버리기
			return;
		}
		
		dao = C.sqlSession.getMapper(LoginDAO.class);
		LoginDTO dto = dao.selectById(id);
		String tomail =dto.getEmail();
		
		try {
			
			String host = "http://localhost:8091/solohomes/member/";
			String setfrom = "AteamProject2020@gmail.com";
			
			String title = "안녕하세요. Holo Homes 본인 확인을 위한 인증메일 입니다."; // 제목
			String content = "다음 링크에 접속하여 이메일 인증을 진행하세요" +
				"<a href='" + host + "emailCheckAction.do?code=" + new SHA256().getSHA256(tomail) + "'>이메일 인증하기</a>";
			
			
				MimeMessage message = C.mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message,
						true, "UTF-8");

				messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo(tomail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content, true); // 메일 내용
				

				C.mailSender.send(message);
			} catch (Exception e) {
				System.out.println(e);
				dao = C.sqlSession.getMapper(LoginDAO.class);
				dao.deleteById(id);
				result = 1;	// 실패
				
			}

		model.addAttribute("result", result);	// 0 = 성공 , -1 = 로그인으로 , -2 = 이미 인증된놈 메인으로, 1 = 인증이 보내기 실패
		//model.addAttribute("code", new SHA256().getSHA256(tomail));
		

	}

}
