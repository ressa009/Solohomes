package com.ateam.solohomes.beans;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;



@MapperScan
public interface MypageDAO {


	public MemberDTO selectMemberInfo(@Param("mb_uid") int mb_uid);
	
	public int updateMemberInfo(@Param("dto") MemberDTO dto);
	
	public ArrayList<PurchaseDTO> selectPurchaseListByUid(@Param("mb_uid") int mb_uid, @Param("fromRow") int fromRow, @Param("writePages")int writePages);
	public int selectPurchaseCnt(@Param("mb_uid") int mb_uid);
	
	public PurchaseDTO selectPurchaseByUid(@Param("py_uid") int py_uid);
	
	public ArrayList<PurchaseDTO> searchDate(@Param("mb_uid") int mb_uid, 
											 @Param("searchStartDate") String searchStartDate, 
											 @Param("searchEndDate") String searchEndDate, 
											 @Param("fromRow") int fromRow,
											 @Param("writePages") int writePages);
	
	public ArrayList<PurchaseDTO> searchKeyword(@Param("mb_uid") int mb_uid, 
												@Param("keyword") String keyword,
												@Param("fromRow") int fromRow,
												@Param("writePages") int writePages);
	
	public int purchaseConfirm(@Param("mb_uid") int mb_uid,	@Param("py_uid") int py_uid);
	
	public ArrayList<GoodsDTO> selectMemberLikeListByUid(@Param("mb_uid") int mb_uid, @Param("fromRow") int fromRow, @Param("writePages") int writePages);

	public ArrayList<RequestDTO> selectMemberRequest(@Param("mb_uid") int mb_uid, @Param("fromRow") int fromRow, @Param("writePages") int writePages);

	public int insertRequest(@Param("dto") RequestDTO dto);
	
	public RequestDTO selectRequestByUid(@Param("rq_uid") int rq_uid);
	
	public int deleteLikeByUid(@Param("gl_uid") int gl_uid);
	
	public int insertReview(@Param("dto") ReviewDTO dto, @Param("mb_uid") int mb_uid, @Param("py_uid") int py_uid, @Param("g_uid") int g_uid);
	
	public ReviewDTO selectReviewByUid(@Param("co_uid") int co_uid);

	public int updateReview(@Param("dto") ReviewDTO dto);
}
