package com.ateam.solohomes.beans;

import java.util.ArrayList;

public interface CartDAO {
	public int insert(final CartDTO dto);
	public int delete(int cr_uid);
	public int deletebyuid(int mb_uid);
	public ArrayList<CartDTO> select(int mb_uid);
	public GoodsDTO selectgoods(int g_uid);
	public ArrayList<GoodsInfoDTO> selectgoodsinfo(int in_uid);
	public CartDTO selectbyuid(int cr_uid);
	public MemberDTO selectmemberbyuid(int mb_uid);
	public int insertpayment(final PurchaseDTO dto);
	
}
