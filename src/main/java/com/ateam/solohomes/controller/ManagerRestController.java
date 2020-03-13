package com.ateam.solohomes.controller;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.GoodsDTO;
import com.ateam.solohomes.beans.manager.AjaxCommentList;
import com.ateam.solohomes.beans.manager.AjaxGoodsList;
import com.ateam.solohomes.beans.manager.AjaxManagerQryResult;
import com.ateam.solohomes.beans.manager.AjaxMemberList;
import com.ateam.solohomes.beans.manager.AjaxRequestList;
import com.ateam.solohomes.beans.manager.AjaxSeriesList;
import com.ateam.solohomes.beans.manager.CommentRenumDTO;
import com.ateam.solohomes.beans.manager.DailySalesDTO;
import com.ateam.solohomes.beans.manager.GoodsSalNumDTO;
import com.ateam.solohomes.beans.manager.ManagerDAO;
import com.ateam.solohomes.beans.manager.MemberRenumDTO;
import com.ateam.solohomes.beans.manager.MonthlySalesDTO;
import com.ateam.solohomes.beans.manager.RequestDTO;
import com.ateam.solohomes.beans.manager.SeriesComponentsDTO;

@RestController
@RequestMapping("/managerAjax")
public class ManagerRestController {
	
	@RequestMapping("/index.ajax/monthlySales")
	public ArrayList<MonthlySalesDTO> monthlySalesList() {
		ArrayList<MonthlySalesDTO> list = null;
		ManagerDAO dao = C.sqlSession.getMapper(ManagerDAO.class);
		
		list = dao.getMonthlySales();
		
		return list;
	}
	
	@RequestMapping("/index.ajax/dailySales/{month}")
	public ArrayList<DailySalesDTO> dailySalesList(@PathVariable("month") String month) {
		ArrayList<DailySalesDTO> list = null;
		
		ManagerDAO dao = C.sqlSession.getMapper(ManagerDAO.class);
		
		list = dao.getDailySalesByMonth(month);
		
		if (list != null && list.size() > 0) {
			// set stack_amount
			int size = list.size();
			list.get(size - 1).setStack_amount(list.get(size - 1).getAmount());
			for (int i = list.size() - 2; i >= 0; i--) {
				DailySalesDTO dto_p = list.get(i + 1);
				DailySalesDTO dto = list.get(i);
				dto.setStack_amount(dto.getAmount() + dto_p.getStack_amount());
			}
		}
		return list;
	}
	
	@RequestMapping("/member.ajax/{type}/{sortType}/{listPages}/{page}")
	public AjaxMemberList userList(@PathVariable("type") String type, @PathVariable("sortType") String sortType, @PathVariable("listPages") int listPages, @PathVariable("page") int page) {
		ArrayList<MemberRenumDTO> list = null;
		AjaxMemberList result = new AjaxMemberList();
		
		ManagerDAO dao = C.sqlSession.getMapper(ManagerDAO.class);
		
		//sort select
		int s_type = Integer.parseInt(sortType);
		System.out.println(s_type);
		String sortColumn = "";
		
		if (type.equals("user")) {
			switch(s_type) {
			case 0: 
				sortColumn = "mb.mb_uid";
				list = dao.selectAllUserByRow((page - 1) * listPages, listPages);
				break;
			case 1:
				sortColumn = "reportedNum";
				list = dao.selectAllUserByRowReportedNum((page - 1) * listPages, listPages);
				break;
			case 2:
				sortColumn = "mb.mb_regdate";
				list = dao.selectAllUserByRowRegdate((page - 1) * listPages, listPages);
				break;
			case 3:
				sortColumn = "mb.mb_id";
				list = dao.selectAllUserByRowId((page - 1) * listPages, listPages);
				break;
			case 4:
				sortColumn = "mb.mb_nn";
				list = dao.selectAllUserByRowNN((page - 1) * listPages, listPages);
				break;
			default: break;
			}
			result.setSortColumn(sortColumn);
		} else if (type.equals("admin")) {
			list = dao.selectAllAdminByRow((page - 1) * listPages, listPages);
		}
		result.setList(list);
		
		if (list != null && list.size() > 0) {
			result.setStatus("SUCCESS");
			result.setCount(list.size());
		} else {
			result.setStatus("FAIL");
		}
		
		return result;
	}
	
	@RequestMapping(value = "/deleteOk.do", method = RequestMethod.POST)
	public AjaxManagerQryResult deleteOk(String[] uids) {
		AjaxManagerQryResult result = new AjaxManagerQryResult();
		
		int cnt = 0;
		if (uids != null && uids.length > 0) {
			ManagerDAO dao = C.sqlSession.getMapper(ManagerDAO.class);
			int[] list = new int[uids.length];
			for (int i = 0; i < list.length; i ++) {
				list[i] = Integer.parseInt(uids[i]);
			}
			
			cnt = dao.deleteMembersByUid(list);
			
			result.setCount(cnt);
			result.setStatus("SUCCESS");
		} else {
			result.setCount(cnt);
			result.setStatus("FAIL");
		}
		
		return result;
	}
	
	@RequestMapping("/request.ajax/{sortType}/{listPages}/{page}")
	public AjaxRequestList requestList(@PathVariable("sortType") String sortType, @PathVariable("listPages") int listPages, @PathVariable("page") int page) {
		AjaxRequestList result = new AjaxRequestList();
		ArrayList<RequestDTO> list = null;
		int s_type = Integer.parseInt(sortType);
		String sortColumn = "";
		
		ManagerDAO dao = C.sqlSession.getMapper(ManagerDAO.class);
		
		switch(s_type) {
		case 0: 
			sortColumn = "regdate DESC";
			list = dao.selectAllRequestByRow((page - 1) * listPages, listPages);
			break;
		case 1: 
			sortColumn = "no response";
			list = dao.selectAllRequestNoResponseByRow((page - 1) * listPages, listPages);
			break;
		default: break;
		}
		result.setList(list);
		result.setSortColumn(sortColumn);
		
		if (list != null && list.size() > 0) {
			result.setStatus("SUCCESS");
			result.setCount(list.size());
		} else {
			result.setStatus("FAIL");
		}
		
		return result;
	}
	
	@RequestMapping("request.ajax/{uid}")
	public AjaxRequestList selectRequest(@PathVariable("uid") String uid) {
		AjaxRequestList result = new AjaxRequestList();
		ArrayList<RequestDTO> list = null;
		
		
		ManagerDAO dao = C.sqlSession.getMapper(ManagerDAO.class);
		
		int intUid = Integer.parseInt(uid);
		list = dao.selectRequestByUid(intUid);
		
		result.setList(list);
		
		if (list != null && list.size() == 1) {
			result.setStatus("SUCCESS");
			result.setCount(list.size());
		} else {
			result.setStatus("FAIL");
		}
		
		return result;
	}
	
	@RequestMapping(value = "/responseWriteOk.do", method = RequestMethod.POST)
	public AjaxManagerQryResult writeResponse(int uid, String response) {
		AjaxManagerQryResult result = new AjaxManagerQryResult();
		
		ManagerDAO dao = C.sqlSession.getMapper(ManagerDAO.class);
		
		int cnt = 0;
		cnt = dao.updateRequestByUid(uid, response);
		result.setCount(cnt);
		if (cnt != 1) {
			result.setStatus("SUCCESS");
		} else {
			result.setStatus("FAIL");
		}
		
		return result;
	}
	
	@RequestMapping(value = "/request/deleteOk.do", method = RequestMethod.POST)
	public AjaxManagerQryResult requestDeleteOk(String[] uids) {
		AjaxManagerQryResult result = new AjaxManagerQryResult();
		
		int cnt = 0;
		if (uids != null && uids.length > 0) {
			ManagerDAO dao = C.sqlSession.getMapper(ManagerDAO.class);
			int[] list = new int[uids.length];
			for (int i = 0; i < list.length; i ++) {
				list[i] = Integer.parseInt(uids[i]);
			}
			
			cnt = dao.deleteRequestsByUids(list);
			
			result.setCount(cnt);
			result.setStatus("SUCCESS");
		} else {
			result.setCount(cnt);
			result.setStatus("FAIL");
		}
		
		return result;
	}
	
	@RequestMapping("/comment.ajax/{sortType}/{listPages}/{page}")
	public AjaxCommentList commentList(@PathVariable("sortType") String sortType, @PathVariable("listPages") int listPages, @PathVariable("page") int page) {
		AjaxCommentList result = new AjaxCommentList();
		ArrayList<CommentRenumDTO> list = null;
		int s_type = Integer.parseInt(sortType);
		String sortColumn = "";
		
		ManagerDAO dao = C.sqlSession.getMapper(ManagerDAO.class);
		switch(s_type) {
		case 0:
			sortColumn = "co.co_regdate";
			list = dao.selectAllCommentByRow((page - 1) * listPages, listPages);
			break;
		case 1:
			sortColumn = "reportedNum";
			list = dao.selectAllCommenType1((page - 1) * listPages, listPages);
			break;
		default: break;
		}
		result.setList(list);
		result.setSortColumn(sortColumn);
		
		if (list != null && list.size() > 0) {
			result.setStatus("SUCCESS");
			result.setCount(list.size());
		} else {
			result.setStatus("FAIL");
		}
		
		return result;
	}
	
	@RequestMapping("/comment.ajax/{uid}")
	public AjaxCommentList selectComment(@PathVariable("uid") String uid) {
		AjaxCommentList result = new AjaxCommentList();
		ArrayList<CommentRenumDTO> list = null;
		
		ManagerDAO dao = C.sqlSession.getMapper(ManagerDAO.class);
		
		list = dao.selectCommentByUid(Integer.parseInt(uid));
		
		result.setList(list);
		
		if (list != null && list.size() == 1) {
			result.setStatus("SUCCESS");
			result.setCount(list.size());
		} else {
			result.setStatus("FAIL");
		}
		
		return result;
	}
	
	@RequestMapping(value = "/comment/deleteOk.do", method = RequestMethod.POST)
	public AjaxManagerQryResult commentDeleteOk(String[] uids) {
		AjaxManagerQryResult result = new AjaxManagerQryResult();
		
		int cnt = 0;
		if (uids != null && uids.length > 0) {
			ManagerDAO dao = C.sqlSession.getMapper(ManagerDAO.class);
			int[] list = new int[uids.length];
			for (int i = 0; i < list.length; i ++) {
				list[i] = Integer.parseInt(uids[i]);
			}
			
			cnt = dao.deleteCommentsByUids(list);
			
			result.setCount(cnt);
			result.setStatus("SUCCESS");
		} else {
			result.setCount(cnt);
			result.setStatus("FAIL");
		}
		
		return result;
	}
	
	@RequestMapping("/goods.ajax/{type}/{stype}/{listPages}/{page}")
	public AjaxGoodsList selectGoods(@PathVariable("type") int type, @PathVariable("stype") int stype, @PathVariable("listPages") int listPages, @PathVariable("page") int page) {
		AjaxGoodsList result = new AjaxGoodsList();
		ArrayList<GoodsSalNumDTO> list = null;
		
		ManagerDAO dao = C.sqlSession.getMapper(ManagerDAO.class);
		String sord = "";
		int colNum = 1; // 실제 쿼리에 보낼 컬럼 인덱스
		
		switch(stype) {
			case 1: // g_likecnt DESC
				sord = "DESC";
				colNum = 7;
				break;
			case 2: // g_uid DESC
				sord = "DESC";
				colNum = 1;
				break;
			case 3: // 판매횟수 DESC
				sord = "DESC";
				colNum = 8;
				break;
			default:
				sord = "ASC";
				break;
		}
		
		list = dao.selectSortedGoodsByType(type, colNum, sord, (page - 1) * listPages, listPages);
		result.setList(list);
		if (list != null && list.size() > 0) {
			result.setStatus("SUCCESS");
			result.setCount(list.size());
		} else {
			result.setStatus("FAIL");
		}
		
		return result;
	}
	
	@RequestMapping("/goods.ajax/{uid}")
	public GoodsDTO selectGoodsByUid(@PathVariable("uid") int uid) {
		GoodsDTO dto = new GoodsDTO();
		ManagerDAO dao = C.sqlSession.getMapper(ManagerDAO.class);
		dto = dao.selectGoodsByUid(uid);
		return dto;
	}
	
	@RequestMapping(value = "/goods/deleteOk.do", method = RequestMethod.POST)
	public AjaxManagerQryResult goodsDeleteOk(String[] uids) {
		AjaxManagerQryResult result = new AjaxManagerQryResult();
		
		int cnt = 0;
		if (uids != null && uids.length > 0) {
			ManagerDAO dao = C.sqlSession.getMapper(ManagerDAO.class);
			int[] list = new int[uids.length];
			for (int i = 0; i < list.length; i ++) {
				list[i] = Integer.parseInt(uids[i]);
			}
			
			cnt = dao.deleteGoodsByUids(list);
			
			result.setCount(cnt);
			result.setStatus("SUCCESS");
		} else {
			result.setCount(cnt);
			result.setStatus("FAIL");
		}
		
		return result;
	}
	
	@RequestMapping("/goods.ajax/series")
	public AjaxSeriesList selectSeriesList() {
		AjaxSeriesList result = new AjaxSeriesList();
		ArrayList<SeriesComponentsDTO> list = null;
		
		ManagerDAO dao = C.sqlSession.getMapper(ManagerDAO.class);
		list = dao.selectSerieses();
		result.setList(list);
		
		if (list != null && list.size() > 0) {
			result.setStatus("SUCCESS");
			result.setCount(list.size());
		} else {
			result.setStatus("FAIL");
		}
		
		return result;
	}
	
	@RequestMapping(value = "/series/deleteOk.do", method = RequestMethod.POST)
	public AjaxManagerQryResult seriesDeleteOk(String[] uids) {
		AjaxManagerQryResult result = new AjaxManagerQryResult();
		
		int cnt = 0;
		if (uids != null && uids.length > 0) {
			ManagerDAO dao = C.sqlSession.getMapper(ManagerDAO.class);
			int[] list = new int[uids.length];
			for (int i = 0; i < list.length; i ++) {
				list[i] = Integer.parseInt(uids[i]);
			}
			
			cnt = dao.deleteSeriesByUids(list);
			
			result.setCount(cnt);
			result.setStatus("SUCCESS");
		} else {
			result.setCount(cnt);
			result.setStatus("FAIL");
		}
		
		return result;
	}
}
