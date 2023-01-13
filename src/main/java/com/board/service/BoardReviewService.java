package com.board.service;

import java.util.List;

import com.board.model.BoardReviewVO;

public interface BoardReviewService {
public List<BoardReviewVO> getReview(int pidx);
	
	public int insertReview(BoardReviewVO review);
	
	BoardReviewVO getReviewVO(BoardReviewVO review);
	
	public int updateReview(BoardReviewVO review);
	
	public int deleteReview(int ridx);
	
	int updateReadnum(Integer ridx);
	
	BoardReviewVO selectBoardByIdx(Integer ridx);
}
