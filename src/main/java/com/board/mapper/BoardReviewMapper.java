package com.board.mapper;

import java.util.List;

import com.board.model.BoardReviewVO;

public interface BoardReviewMapper {
	public List<BoardReviewVO> getReview(int pidx);
	
	public int insertReview(BoardReviewVO review);
	
	public int updateReview(BoardReviewVO review);
	
	public int deleteReview(int ridx);
	
	
	
}
