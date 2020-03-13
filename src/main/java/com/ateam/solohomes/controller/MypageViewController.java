package com.ateam.solohomes.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ateam.solohomes.C;
import com.ateam.solohomes.commnad.Command;

@Controller
public class MypageViewController {

	private Command command;
	private SqlSession sqlSession;
	private TransactionTemplate transactionTemplate;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		C.sqlSession = sqlSession;
	}
	@Autowired
	public void setTransactionTemplate(TransactionTemplate transactionTemplate) {
		this.transactionTemplate = transactionTemplate;
		C.transactionTemplate = transactionTemplate;
	}
	
	@RequestMapping("/user/purchaselist.do")
	public String purchaselist(Model model) {
		return "user/mypage/purchaselist2";
	}
	
	@RequestMapping("/user/memberCheck.do")
	public String memberCheck(Model model) {
		return "user/mypage/memberCheck";
	}
	
	@RequestMapping("/user/likelist.do")
	public String likelist(Model model) {
		return "user/mypage/likelist";
	}
	
	@RequestMapping("/user/requestlist.do")
	public String requestlist(Model model) {
		return "user/mypage/requestlist";
	}
	
}
