package com.ateam.solohomes.controller;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ateam.solohomes.C;
import com.ateam.solohomes.commnad.CategoryCMD;
import com.ateam.solohomes.commnad.Command;

@Controller
@RequestMapping(value="/category")
public class CategoryController {
	

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
	
	@RequestMapping(value="/category.do")
	public String category (int g_type, Model model) {
		
		model.addAttribute("g_type", g_type);
		command = new CategoryCMD();
		command.execute(model);
		
		return "category/category";
	}

}
