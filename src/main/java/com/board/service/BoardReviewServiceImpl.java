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
		
		return boardReviewMapper.updateReview(review);
	}

	@Override
	public int deleteReview(int ridx) {
		
		return boardReviewMapper.deleteReview(ridx);
	}

	@Override
	public int updateReadnum(Integer ridx) {
		
		return boardReviewMapper.updateReadnum(ridx);
	}

	@Override
	public BoardReviewVO selectBoardByIdx(Integer ridx) {
		
		return boardReviewMapper.selectBoardByIdx(ridx);
	}

	@Override
	public BoardReviewVO getReviewVO(BoardReviewVO review) {
		
		return boardReviewMapper.getReviewVO(review);
	}

	

}
