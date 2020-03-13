package com.ateam.solohomes.commnad;


import java.util.ArrayList;
import java.util.Iterator;

import org.springframework.ui.Model;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.CartDAO;
import com.ateam.solohomes.beans.CartDTO;
import com.ateam.solohomes.beans.GoodsDTO;
import com.ateam.solohomes.beans.GoodsInfoDTO;

public class CartViewCommand implements Command {

	@Override
	public void execute(Model model) {
		int mb_uid = (Integer) model.getAttribute("mb_uid");
		CartDAO dao = C.sqlSession.getMapper(CartDAO.class);
		ArrayList<CartDTO> array = dao.select(mb_uid);
		model.addAttribute("list", array);
		
		Iterator<CartDTO> it = array.iterator();
		int cnt = 0;
		ArrayList<ArrayList<GoodsInfoDTO>> giarray = new ArrayList<ArrayList<GoodsInfoDTO>>();
		ArrayList<GoodsDTO> garray = new ArrayList<GoodsDTO>();
		int [] in_uid = new int [array.size()];
		while(it.hasNext()){
			in_uid[cnt] = array.get(cnt).getIn_uid();
			giarray.add(dao.selectgoodsinfo(in_uid[cnt]/10));
			garray.add(dao.selectgoods(in_uid[cnt]/10));
			cnt++;
			if(cnt == array.size()) break;
		}
		model.addAttribute("glist", garray);
		model.addAttribute("gilist", giarray);
		
		String [] colorselect = new String [array.size()];
		Iterator<ArrayList<GoodsInfoDTO>> iter = giarray.iterator();
		cnt = 0;
		int count = 0;
		while(iter.hasNext()){
			if(giarray.get(count).get(cnt).getIn_uid() == in_uid[count]) {
				colorselect[count] = giarray.get(count).get(cnt).getIn_color();
				count++;
				cnt = 0;
			}else {
				cnt++;
			}
			if(count == array.size()) break;
		}
		model.addAttribute("colorselect", colorselect);
	}

}
