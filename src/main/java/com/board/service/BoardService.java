package com.board.service;

import java.util.List;

import com.board.model.BoardComVO;
import com.user.model.PagingVO;

public interface BoardService {
	List<BoardComVO> getBoardList(PagingVO paging);

	int getBoardCount(PagingVO paging);
}
