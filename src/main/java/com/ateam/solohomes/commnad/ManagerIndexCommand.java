package com.ateam.solohomes.commnad;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.ateam.solohomes.C;
import com.ateam.solohomes.beans.manager.ManagerDAO;
import com.ateam.solohomes.beans.manager.MonthlySalesDTO;

public class ManagerIndexCommand implements Command {

	@Override
	public void execute(Model model) {
		ManagerDAO dao = C.sqlSession.getMapper(ManagerDAO.class);
		
		// get count of today's sign up members
		Integer countOfMembers = dao.countTodaySignUp();
		Integer countOfSales = dao.countTodaySales();
		Integer sumOfSales = dao.sumTodaySales();
		ArrayList<MonthlySalesDTO> list = dao.getMonthlySales();
		
		double d = sumOfSales / 10000.0;
		//System.out.println(countOfMembers);
		//System.out.println(countOfSales);
		//System.out.println(sumOfSales);
		System.out.println(list.toString());
		
		model.addAttribute("countOfMembers", countOfMembers);
		model.addAttribute("countOfSales", countOfSales);
		model.addAttribute("sumOfSales", d);
		model.addAttribute("mothlySalesList", list);
	}

}
