package com.board.service;

import java.util.List;

import com.board.model.QNADTO;

public interface QNAService {
	
	// 해당 상품에 대한 QNA 작성
	public int insertQNA(QNADTO qna);
	
	// 상품번호를 이용한 QNA리스트 가져오기
	public List<QNADTO> getQNAList(int pidx);
	
	// QNA 수정
	public int updateQNA(QNADTO qna);
	
	// QNA 삭제
	public int deleteQNA(QNADTO qna);
	
	// 내가 작성한 QNA 보기
	public List<QNADTO> getMyQNAList(int midx);
}
