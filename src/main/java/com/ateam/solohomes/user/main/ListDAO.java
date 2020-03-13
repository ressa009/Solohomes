package com.ateam.solohomes.user.main;

import java.util.ArrayList;

public interface ListDAO {
	public ArrayList<ListDTO> selectSeries();
	public ArrayList<ListDTO> selectNew();
	public ArrayList<ListDTO> selectBest();
}
