package com.ateam.solohomes.commnad;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

import org.springframework.ui.Model;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.CartDAO;
import com.ateam.solohomes.beans.CartDTO;
import com.ateam.solohomes.beans.GoodsDTO;
import com.ateam.solohomes.beans.GoodsInfoDTO;
import com.ateam.solohomes.beans.MemberDTO;

public class CartPaymentCommand implements Command {

	@Override
	public void execute(Model model) {
		int mb_uid = (Integer) model.getAttribute("mb_uid");
		Map<String, Object> map = model.asMap();
		String [] cr_uid = (String [])map.get("cr_uid");
		String [] cr_amount = (String [])map.get("cr_amount");
		String [] in_color = (String [])map.get("in_color");
		ArrayList<CartDTO> array = new ArrayList<CartDTO>();
		ArrayList<GoodsDTO> garray = new ArrayList<GoodsDTO>();
		ArrayList<ArrayList<GoodsInfoDTO>> giarray = new ArrayList<ArrayList<GoodsInfoDTO>>();
		CartDAO dao = C.sqlSession.getMapper(CartDAO.class);
		for (int i = 0; i < cr_uid.length; i++) {
			array.add(dao.selectbyuid(Integer.parseInt(cr_uid[i])));
			garray.add(dao.selectgoods(array.get(i).getIn_uid()/10));
			giarray.add(dao.selectgoodsinfo(array.get(i).getIn_uid()/10));
		}
		Iterator<CartDTO> it = array.iterator();
		int cnt = 0;
		while(it.hasNext()){
			array.get(cnt).setCr_amount(Integer.parseInt(cr_amount[cnt]));
			for (int i = 0; i < giarray.get(cnt).size(); i++) {
				if(in_color[cnt].equals(giarray.get(cnt).get(i).getIn_img())) {
					array.get(cnt).setIn_uid((Integer.parseInt(cr_amount[cnt])));
					break;
				}				
			}
			cnt++;
			if(cnt == array.size()) break;
		}
		MemberDTO member = dao.selectmemberbyuid(mb_uid);
		model.addAttribute("member", member);
		model.addAttribute("list", array);
		model.addAttribute("glist", garray);
		model.addAttribute("gilist", giarray);
		
	}

}
