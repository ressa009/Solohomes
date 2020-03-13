package com.ateam.solohomes.controller;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.MemberDTO;
import com.ateam.solohomes.beans.RequestDTO;
import com.ateam.solohomes.commnad.MypageMemberCheckCommand;
import com.ateam.solohomes.commnad.MypageMemberInfoCommand;
import com.ateam.solohomes.commnad.MypageMemberUpdateCommand;
import com.ateam.solohomes.commnad.MypageRequestWriteCommand;
import com.ateam.solohomes.commnad.MypageRequestViewCommand;

@Controller
@RequestMapping("/user/mypage")
public class MypageController {
	
	
	// MyBatis
	private SqlSession sqlSession;
	
		
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		C.sqlSession = sqlSession;
	}
	
	
	@RequestMapping("/memberCheck.do/{mb_uid}")
	public String memberCheck(@PathVariable("mb_uid") int mb_uid, Model model){
		model.addAttribute("mb_uid", mb_uid);
		return "user/mypage/memberCheck";
	}
	
	
	@RequestMapping(value = "/memberCheckOk.do", method = RequestMethod.POST)
	public String memberCheckOk(MemberDTO dto, Model model){
		
		model.addAttribute("dto", dto);
		new MypageMemberCheckCommand().execute(model);
		
		return "user/mypage/memberCheckOk";
	}
    
	
	@RequestMapping("/memberUpdate.do/{mb_uid}")
	public String memberUpdate(@PathVariable("mb_uid") int mb_uid, Model model){
		model.addAttribute("mb_uid", mb_uid);   
		new MypageMemberInfoCommand().execute(model);
		
		return "user/mypage/memberUpdate";
	}
	
	
	@RequestMapping(value = "/memberUpdateOk.do", method = RequestMethod.POST)
	public String memberUpdateOk(MemberDTO dto, Model model){
		model.addAttribute("dto", dto);
		new MypageMemberUpdateCommand().execute(model);
		
		return "user/mypage/memberUpdateOk";
	}
	

	
	@RequestMapping("/likeList.ajax/{mb_uid}")
	public String likeList(@PathVariable("mb_uid") int mb_uid){
	
		System.out.println("mb_uid: "+ mb_uid);

		return "user/mypage/likelist";
	}
	
	@RequestMapping("/requestWrite.do/{mb_uid}")
	public String requestWrite(@PathVariable("mb_uid") int mb_uid, Model model){
		model.addAttribute("mb_uid", mb_uid);
		return "user/mypage/requestWrite";
	}
	
	@RequestMapping(value ="/requestWriteOk.do", method = RequestMethod.POST)
	public String requestWriteOk(RequestDTO dto, Model model){
		
		model.addAttribute("dto", dto);
		System.out.println("컨트롤러 도착:" + dto.getMb_uid());
		new MypageRequestWriteCommand().execute(model);
		
		return "user/mypage/requestWriteOk";
	}
	
	
	@RequestMapping(value ="/requestView.do/{rq_uid}")
	public String requestView(@PathVariable("rq_uid") int rq_uid, Model model){
		
		model.addAttribute("rq_uid", rq_uid);
		
		new MypageRequestViewCommand().execute(model);
		
		return "user/mypage/requestView";
	}
	

}
