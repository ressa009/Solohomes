package com.ateam.solohomes.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.search.SearchDAO;
import com.ateam.solohomes.beans.search.SearchDTO;


@RestController
@RequestMapping("/searchAJAX")
public class SearchAjaxController {
	
	@RequestMapping(value = "/searchOk.ajax", produces = "application/text; charset=utf8")
	public @ResponseBody String searchOk(Model model, HttpServletRequest request) {
		String userKeyword = request.getParameter("userKeyword");
		
		SearchDAO dao = C.sqlSession.getMapper(SearchDAO.class);
		ArrayList<SearchDTO> keywordlist = dao.select();
		if(userKeyword == null || userKeyword.equals("")){
			return null;
		}		
		String [] keywords = new String [keywordlist.size() + 15];
		keywords[0] = "침대,1";
		keywords[1] = "화장대,2";
		keywords[2] = "서랍장,3";
		keywords[3] = "소파,4";
		keywords[4] = "거실장,5";
		keywords[5] = "옷장,6";
		keywords[6] = "테이블,7";
		keywords[7] = "의자,8";
		keywords[8] = "책상,9";
		keywords[9] = "책장,10";
		keywords[10] = "비비,11";
		keywords[11] = "어바니,12";
		keywords[12] = "이타카네오,13";
		keywords[13] = "글렌,14";
		keywords[14] = "미엘갤러리,15";
		
		Iterator<SearchDTO> iter = keywordlist.iterator();
		int cnt = 0;
		while(iter.hasNext()){
			keywords[15 + cnt] = keywordlist.get(cnt).getG_name() + ","
					+ keywordlist.get(cnt).getG_uid();
			cnt++;
			if(cnt == keywordlist.size()) break;
		}

		List<String> lists = new ArrayList<String>();
		for(int i = 0; i < keywords.length; i++){
			if(keywords[i].startsWith(userKeyword)){
				lists.add(keywords[i]);
			}
		}
		String result = "";
		result += lists.size();
		result += "|";
		Iterator<String> it = lists.iterator();
		while(it.hasNext()){
			String value = (String) it.next();
			result += value;
			if(lists.size()-1 > 0){
				result += ",";
			}
		}
		return result;
	}
	
}














