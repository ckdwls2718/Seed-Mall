package com.board.mapper;

import java.util.List;

import com.board.model.BoardReviewVO;
import com.board.model.ReviewImageVO;
import com.product.model.ProductImageVO;
import com.user.model.PagingVO;

public interface BoardReviewMapper {
	public List<BoardReviewVO> getReview(int pidx);
	
	public int insertReview(BoardReviewVO review);
	
	int getReviewCount(PagingVO paging);
	
	BoardReviewVO getReviewVO(BoardReviewVO review);
	
	int updateReview(BoardReviewVO review);
	
	int deleteReview(int ridx);
	
	int updateReadnum(Integer ridx);
	
	BoardReviewVO selectBoardByIdx(Integer ridx);
	
	int like_check(BoardReviewVO review);
	
	int like_check_cancel(BoardReviewVO review);
	
	List<ReviewImageVO> getReviewImages(Integer ridx);
	
	int insertRimage(ReviewImageVO riVo);
	
	
}
