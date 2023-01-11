package com.board.mapper;

import java.util.List;

import com.board.model.BoardComVO;
import com.board.model.BoardVO;
import com.user.model.PagingVO;

public interface BoardComMapper {
	List<BoardComVO> getBoardList(PagingVO paging);
		
	int getBoardCount(PagingVO paging);
	
	int insertBoard(BoardComVO board);
	
	BoardComVO getBoardCom(BoardComVO board);
	
	int deleteboard(int cidx);
	
	int updateBoard(BoardComVO vo);
	
	int updateReadnum(Integer cidx);
	
	BoardComVO selectBoardByIdx(Integer cidx);
}
