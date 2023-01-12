package com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.mapper.BoardReviewMapper;
import com.board.model.BoardReviewVO;
@Service
public class BoardReviewServiceImpl implements BoardReviewService {
	@Autowired
	BoardReviewMapper boardReviewMapper;

	@Override
	public List<BoardReviewVO> getReview(int pidx) {
		
		return boardReviewMapper.getReview(pidx);
	}

	@Override
	public int insertReview(BoardReviewVO review) {
		
		return boardReviewMapper.insertReview(review);
	}

	@Override
	public int updateReview(BoardReviewVO review) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReview(int ridx) {
		// TODO Auto-generated method stub
		return 0;
	}

	

}
