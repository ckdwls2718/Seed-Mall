package com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.mapper.QNAMapper;
import com.board.model.QNADTO;

@Service
public class QNAServiceImpl implements QNAService {
	
	@Autowired
	QNAMapper qnaMapper;
	
	@Override
	public int insertQNA(QNADTO qna) {
		return qnaMapper.insertQNA(qna);
	}

	@Override
	public List<QNADTO> getQNAList(int pidx) {
		return qnaMapper.getQNAList(pidx);
	}

	@Override
	public int updateQNA(QNADTO qna) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteQNA(int qidx) {
		return qnaMapper.deleteQNA(qidx);
	}

	@Override
	public List<QNADTO> getMyQNAList(int midx) {
		// TODO Auto-generated method stub
		return null;
	}

}
