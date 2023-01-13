package com.board.mapper;

import java.util.List;

import com.board.model.BoardReviewVO;

public interface BoardReviewMapper {
	public List<BoardReviewVO> getReview(int pidx);
	
	public int insertReview(BoardReviewVO review);
	
	BoardReviewVO getReviewVO(BoardReviewVO review);
	
	int updateReview(BoardReviewVO review);
	
	int deleteReview(int ridx);
	
	int updateReadnum(Integer ridx);
	
	BoardReviewVO selectBoardByIdx(Integer ridx);
	
	
	
	
}
