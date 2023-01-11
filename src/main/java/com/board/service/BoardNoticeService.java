package com.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.board.model.BoardNoticeVO;
import com.board.model.BoardVO;
import com.board.model.PagingVO;

public interface BoardNoticeService {
	int insertBoard(BoardNoticeVO bnvo);
	
	// 게시목록 가져오기
	List<BoardVO> selectNoticeAll(Map<String,Integer> map);
	List<BoardVO> selectNoticeAllPaging(PagingVO page);
	   
	// 검색목록 가져오기
	List<BoardVO> findBoard(PagingVO page);
	   
	int getTotalCount();//총 게시글 수 가져오기
	int getTotalCount(PagingVO page);//검색한 총 게시글 수 가져오기

	// 글제목에 해당하는 글 가져오기
	BoardNoticeVO selectBoardByNidx(Integer nidx);   
	// 조회수 증가하기
	int updateReadnum(Integer nidx);
	//삭제 및 수정
	int deleteNotice(Integer nidx,HttpServletRequest req);
	int updateNotice(BoardNoticeVO bnvo);

	int copyImage(BoardNoticeVO bnvo, HttpServletRequest req);
	
	public int deleteImgSources(int nidx,HttpServletRequest req);


	
}
