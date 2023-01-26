package com.board.mapper;

import java.util.List;

import com.board.model.BoardComReVO;
import com.board.model.BoardComVO;
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
	
	//내가 작성한 커뮤니티 글 가져오기
	List<BoardComVO> selectComByMidx(int midx);
	
	//커뮤니티 좋아요 top가져오기
	List<BoardComVO> getBoardComListTop(int top);
	
	//커뮤니티 좋아요
	int BoardComLike(int cidx);
	
	int Clike_check(BoardComVO board);
	
	int Clike_check_cancel(BoardComVO board);
	
	//댓글 리스트 가져오기
	List<BoardComReVO> getBoardComReListByCidx(int cidx);
	
	//댓글 등록
	int insertBoardComRe(BoardComReVO comRe);
		
	//댓글 삭제
	int deleteBoardComRe(int re_cidx);
}
