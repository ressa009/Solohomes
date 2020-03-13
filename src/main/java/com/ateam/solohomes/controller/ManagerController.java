package com.ateam.solohomes.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ateam.solohomes.C;
import com.ateam.solohomes.commnad.Command;
import com.ateam.solohomes.commnad.ManagerGoodsUpdateCommand;
import com.ateam.solohomes.commnad.ManagerGoodsUploadCommand;
import com.ateam.solohomes.commnad.ManagerIndexCommand;
import com.ateam.solohomes.commnad.ManagerSelectGoodsCommmand;
import com.ateam.solohomes.commnad.ManagerSelectSeriesCommmand;
import com.ateam.solohomes.commnad.ManagerSeriesUpdateCommand;
import com.ateam.solohomes.commnad.ManagerSeriesUploadCommand;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	
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

	@RequestMapping("/index.do")
	public String managerMain(Model model) {
		command = new ManagerIndexCommand();
		command.execute(model);
		return "manager/index";
	}
	
	@RequestMapping("/member.do")
	public String manageMember() {
		return "manager/member";
	}
	
	@RequestMapping("/goods.do")
	public String manageGoods() {
		return "manager/goods";
	}
	
	@RequestMapping("/goodsWrite.do")
	public String manageGoodsWrite() {
		return "manager/goodsWrite";
	}
	
	@RequestMapping(value = "/goodsWriteOk.do", method = RequestMethod.POST)
	public ModelAndView goodsWriteOk(Model model, MultipartHttpServletRequest request) {
		ModelAndView mv = new ModelAndView("manager/goodsWriteOk");
		model.addAttribute("request", request);
		command = new ManagerGoodsUploadCommand();
		command.execute(model);
		
		model.addAttribute("update", 0);
		
		return mv;
	}
	
	@RequestMapping("/goodsUpdate.do")
	public ModelAndView goodsUpdate(Model model, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("manager/goodsUpdate");
		int g_uid = Integer.parseInt(request.getParameter("g_uid"));
		model.addAttribute("g_uid", g_uid);
		command = new ManagerSelectGoodsCommmand();
		command.execute(model);
		
		return mv;
	}
	
	@RequestMapping(value = "/goodsUpdateOk.do", method = RequestMethod.POST)
	public ModelAndView goodsUpdateOk(Model model, MultipartHttpServletRequest request) {
		ModelAndView mv = new ModelAndView("manager/goodsWriteOk");
		model.addAttribute("request", request);
		int g_uid = Integer.parseInt(request.getParameter("g_uid"));
		model.addAttribute("g_uid", g_uid);
		// 원본 가져오기
		command = new ManagerSelectGoodsCommmand();
		command.execute(model);
		
		command = new ManagerGoodsUpdateCommand();
		command.execute(model);
		
		model.addAttribute("update", 1);
		
		return mv;
	}
	
	@RequestMapping("/seriesWrite.do")
	public String manageSeriesWrite() {
		return "manager/seriesWrite";
	}
	
	@RequestMapping(value = "/seriesWriteOk.do", method = RequestMethod.POST)
	public ModelAndView seriesWriteOk(Model model, MultipartHttpServletRequest request) {
		ModelAndView mv = new ModelAndView("manager/seriesWriteOk");
		model.addAttribute("request", request);
		command = new ManagerSeriesUploadCommand();
		command.execute(model);
		
		model.addAttribute("update", 0);
		
		return mv;
	}
	
	@RequestMapping("/seriesUpdate.do")
	public ModelAndView seriesUpdate(Model model, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("manager/seriesUpdate");
		int sr_uid = Integer.parseInt(request.getParameter("sr_uid"));
		model.addAttribute("sr_uid", sr_uid);
		command = new ManagerSelectSeriesCommmand();
		command.execute(model);
		
		return mv;
	}
	
	@RequestMapping(value = "/seriesUpdateOk.do", method = RequestMethod.POST)
	public ModelAndView seriesUpdateOk(Model model, MultipartHttpServletRequest request) {
		ModelAndView mv = new ModelAndView("manager/seriesWriteOk");
		model.addAttribute("request", request);
		int sr_uid = Integer.parseInt(request.getParameter("sr_uid"));
		model.addAttribute("sr_uid", sr_uid);
		// 원본 가져오기
		command = new ManagerSelectSeriesCommmand();
		command.execute(model);
		
		command = new ManagerSeriesUpdateCommand();
		command.execute(model);
		
		model.addAttribute("update", 1);
		
		return mv;
	}
	
	@RequestMapping("/review.do")
	public String manageReview() {
		return "manager/review";
	}
	
	@RequestMapping("/request.do")
	public String manageRequest() {
		return "manager/request";
	}
}
