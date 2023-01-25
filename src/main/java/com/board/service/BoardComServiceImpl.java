package com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.mapper.BoardComMapper;
import com.board.model.BoardComReVO;
import com.board.model.BoardComVO;
import com.user.model.PagingVO;

@Service
public class BoardComServiceImpl implements BoardComService {

	@Autowired
	BoardComMapper boardComMapper;
 
	@Override
	public List<BoardComVO> getBoardList(PagingVO paging) {
		// TODO Auto-generated method stub
		return boardComMapper.getBoardList(paging);
	}

	@Override
	public int getBoardCount(PagingVO paging) {
		// TODO Auto-generated method stub
		return boardComMapper.getBoardCount(paging);
	}

	@Override
	public int insertBoard(BoardComVO board) {
		// TODO Auto-generated method stub
		return this.boardComMapper.insertBoard(board);
	}

	@Override
	public BoardComVO getBoardCom(BoardComVO board) {
		BoardComVO boardCom = boardComMapper.getBoardCom(board);
		return boardCom;
	}

	@Override
	public int deleteboard(int cidx) {

		return this.boardComMapper.deleteboard(cidx);
	}

	@Override
	public int updateBoard(BoardComVO vo) {

		return this.boardComMapper.updateBoard(vo);
	}

	@Override
	public int updateReadnum(Integer cidx) {
	// TODO Auto-generated method stub
		return this.boardComMapper.updateReadnum(cidx);
	}

	@Override
	public BoardComVO selectBoardByIdx(Integer cidx) {
		BoardComVO boardCom = boardComMapper.selectBoardByIdx(cidx);
		List<BoardComReVO> comReArr = boardComMapper.getBoardComReListByCidx(boardCom.getCidx());
		boardCom.setComReArr(comReArr);
		return boardCom;
	}

	@Override
	public List<BoardComVO> selectComByMidx(int midx) {
		return boardComMapper.selectComByMidx(midx);
	}

	@Override
	public List<BoardComVO> getBoardComListTop(int top) {
		return boardComMapper.getBoardComListTop(top);
	}
	@Override
	public int BoardComLike(int cidx) {
		return boardComMapper.BoardComLike(cidx);
	}
	
	@Override
	public List<BoardComReVO> getBoardComReListByCidx(int cidx) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int insertBoardComRe(BoardComReVO comRe) {
		return boardComMapper.insertBoardComRe(comRe);
	}
	
	@Override
	public int deleteBoardComRe(int re_cidx) {
		return boardComMapper.deleteBoardComRe(re_cidx);
	}

}
