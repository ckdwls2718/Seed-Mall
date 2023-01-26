package com.board.mapper;

import java.util.List;

import com.board.model.PagingVO;
import com.board.model.QNADTO;
import com.board.model.QNA_ReDTO;

public interface QNAMapper {
	
	// 해당 상품에 대한 QNA 작성
	public int insertQNA(QNADTO qna);

	// 상품번호를 이용한 QNA리스트 가져오기
	public List<QNADTO> getQNAListByPidx(int pidx);
	
	// QNA 수정
	public int updateQNA(QNADTO qna);
	
	// QNA 삭제
	public int deleteQNA(int qidx);
	
	// QNA 답변 가져오기
	public List<QNA_ReDTO> getQNAReListByQidx(int qidx);
		
	// QNA 답변 삭제
	public int deleteQNARe(int re_qidx);
	
	// 내가 작성한 QNA 보기
	public List<QNADTO> getQNAListByMidx(int midx);
	
	// 관리자 - 모든 qna리스트 가져오기
	public List<QNADTO> getQNAList(PagingVO page);
	
	public int getQNACount(PagingVO page);
	
	public int insertQNA_Re(QNA_ReDTO re);
	
}
