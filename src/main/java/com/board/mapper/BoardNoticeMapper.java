package com.board.mapper;

import java.util.List;
import java.util.Map;

import com.board.model.BoardNoticeVO;
import com.board.model.BoardVO;
import com.board.model.PagingVO;

public interface BoardNoticeMapper {
	int insertBoard(BoardNoticeVO bnvo);

	List<BoardNoticeVO> getNoticeList(PagingVO page);

	List<BoardVO> selectNoticeAll(Map<String, Integer> map);

	List<BoardVO> selectNoticeAllPaging(PagingVO page);

	int getTotalCount(PagingVO page);

	BoardNoticeVO selectBoardByNidx(Integer nidx);

	int updateReadnum(Integer idx);

	int deleteNotice(Integer idx);

	int updateNotice(BoardNoticeVO bnvo);

	int updateImgSrc(BoardNoticeVO bnvo);
}
