package com.board.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.board.mapper.BoardReviewMapper;
import com.board.model.BoardReviewVO;

public class BoardReviewServiceImpl implements BoardReviewService {
	@Autowired
	BoardReviewMapper boardReviewMapper;
	@Override
	public void reviewWrite(BoardReviewVO review) {
		boardReviewMapper.reviewWrite(review);
		
	}

}
