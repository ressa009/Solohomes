package com.ateam.solohomes.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.CartDTO;
import com.ateam.solohomes.beans.PurchaseDTO;
import com.ateam.solohomes.commnad.CartCommand;
import com.ateam.solohomes.commnad.CartDeleteCommand;
import com.ateam.solohomes.commnad.CartPaymentCommand;
import com.ateam.solohomes.commnad.CartPaymentInsertCommand;
import com.ateam.solohomes.commnad.CartViewCommand;
import com.ateam.solohomes.commnad.Command;


@Controller
@RequestMapping("/cart")
public class CartController {
	
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		C.sqlSession = sqlSession;
	}

	private Command command;
	
	@RequestMapping("/before.do")
	public String before(Model model) {
		return "user/cart/before";
	}

	@RequestMapping(value = "/beforecart.do", method = RequestMethod.POST)
	public String beforecart(CartDTO dto, Model model) {
		model.addAttribute("dto", dto);
		command = new CartCommand();
		command.execute(model);
		return "user/cart/beforecart";
	}
	
	@RequestMapping("/cart.do")
	public String cart(int mb_uid, Model model) {
		model.addAttribute("mb_uid", mb_uid);
		command = new CartViewCommand();
		command.execute(model);
		return "user/cart/cart";
	}
	
	@RequestMapping("/cartdelete.do")
	public String cartdelete(Model model, HttpServletRequest request) {
		String [] cr_uid = request.getParameterValues("cr_uid");
		model.addAttribute("cr_uid", cr_uid);
		command = new CartDeleteCommand();
		command.execute(model);
		return "user/cart/cartdelete";
	}
	
	@RequestMapping(value = "/cartconfirm.do", method = RequestMethod.POST)
	public String cartconfirm(Model model, HttpServletRequest request) {
		model.addAttribute("mb_uid", Integer.parseInt(request.getParameter("mb_uid")));
		String [] cr_uid = request.getParameterValues("cr_uid");
		String [] cr_amount = new String [cr_uid.length];
		String [] in_color = new String [cr_uid.length];
		for (int i = 0; i < cr_uid.length; i++) {
			cr_amount[i] = request.getParameter(cr_uid[i]+"cr_amount");
			in_color[i] = request.getParameter(cr_uid[i]+"in_color");
		}
		model.addAttribute("cr_uid", cr_uid);
		model.addAttribute("cr_amount", cr_amount);
		model.addAttribute("in_color", in_color);
		command = new CartPaymentCommand();
		command.execute(model);		
		return "user/cart/cartconfirm";
	}
	
	@RequestMapping(value = "/cartconfirmOk.do", method = RequestMethod.POST)
	public String cartconfirmOk(PurchaseDTO dto, Model model, HttpServletRequest request) {
		model.addAttribute("dto", dto);
		model.addAttribute("mb_uid", Integer.parseInt(request.getParameter("mb_uid")));
		model.addAttribute("py_zipcode", request.getParameter("zipcode"));
		model.addAttribute("py_addr", request.getParameter("addr"));
		model.addAttribute("py_addr2", request.getParameter("addr2"));
		String [] in_uid = request.getParameterValues("in_uid");
		String [] cr_amount = request.getParameterValues("cr_amount");
		model.addAttribute("in_uid", in_uid);
		model.addAttribute("py_amount", cr_amount);
		command = new CartPaymentInsertCommand();
		command.execute(model);
		return "user/cart/cartconfirmOk";
	}
}
