package com.ateam.solohomes.controller;

import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.search.SearchDAO;
import com.ateam.solohomes.beans.search.SearchDTO;
import com.ateam.solohomes.commnad.CartInsertCommand;
import com.ateam.solohomes.commnad.Command;
import com.ateam.solohomes.commnad.InfoViewCommand;
import com.ateam.solohomes.commnad.ListCommand;
import com.ateam.solohomes.user.main.ProductInfoDTO;

@Controller
public class MainController {

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
	
	@RequestMapping("/user/main.do")
	public String ListMain(Model model) {
		command = new ListCommand();
		command.execute(model);
		return "user/main";
	}

}
