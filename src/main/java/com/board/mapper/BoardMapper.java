package com.board.mapper;

import java.util.List;

import com.board.model.BoardComVO;
import com.user.model.PagingVO;

public interface BoardMapper {
	List<BoardComVO> getBoardList(PagingVO paging);

	int getBoardCount(PagingVO paging);
	
	
}
