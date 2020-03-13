package com.ateam.solohomes.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ateam.solohomes.C;
import com.ateam.solohomes.commnad.CartInsertCommand;
import com.ateam.solohomes.commnad.Command;
import com.ateam.solohomes.commnad.InfoViewCommand;
import com.ateam.solohomes.user.main.ProductInfoDTO;

@Controller
public class ProductInfoController {
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
	
	@RequestMapping("/user/productInfo.do/{g_uid}")
	public String productInfo(Model model, @PathVariable("g_uid")int g_uid, HttpSession s) {	
		int mb_uid = 0;
		if(s.getAttribute("userUID") == null) {
			mb_uid = 0;
		}else{
			mb_uid = (Integer)(s.getAttribute("userUID"));
		}
		
		model.addAttribute("g_uid", g_uid); 
		model.addAttribute("mb_uid", mb_uid);
		new InfoViewCommand().execute(model);
		return "user/productInfo";
	}
	
	@RequestMapping("/user/cartInsert.do/{mb_uid}/{in_uid}/{cr_amount}")
	public String cartInsert(Model model, @PathVariable("mb_uid")int mb_uid,
			@PathVariable("in_uid")int in_uid, @PathVariable("cr_amount")int cr_amount) {
		ProductInfoDTO dto = new ProductInfoDTO();
		dto.setMb_uid(mb_uid);
		dto.setIn_uid(in_uid);
		dto.setCr_amount(cr_amount);
		model.addAttribute("dto", dto);
		new CartInsertCommand().execute(model);
		return "user/cartInsert";
	}
}
