package com.ateam.solohomes.beans;

import java.util.ArrayList;

public interface SeriesDAO {
	public ArrayList<SeriesDTO> seriesselect(int sr_uid);
	public ArrayList<SeriesDTO> seriesnum();
}
