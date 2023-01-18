package com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.mapper.QNAMapper;
import com.board.model.PagingVO;
import com.board.model.QNADTO;
import com.board.model.QNA_ReDTO;
import com.product.model.ProductVO;
import com.product.service.ProductService;

@Service
public class QNAServiceImpl implements QNAService {
	
	@Autowired
	QNAMapper qnaMapper;
	
	@Autowired
	ProductService prodService;
	
	@Override
	public int insertQNA(QNADTO qna) {
		return qnaMapper.insertQNA(qna);
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
	public List<QNADTO> getQNAListByMidx(int midx) {
		List<QNADTO> qArr = qnaMapper.getQNAListByMidx(midx);
		for(QNADTO qna : qArr) {
			List<QNA_ReDTO> reArr = qnaMapper.getQNAReListByQidx(qna.getQidx());
			if(reArr != null && reArr.size()>0) {
				qna.setIsCom("Y");
			}
			ProductVO prod = prodService.selectByIdx(qna.getPidx());
			qna.setQna_ReList(reArr);
			qna.setProduct(prod);
		}
		return qArr;
	}
	
	@Override
	public List<QNADTO> getQNAListByPidx(int pidx) {
		List<QNADTO> qArr = qnaMapper.getQNAListByPidx(pidx);
		for(QNADTO qna : qArr) {
			List<QNA_ReDTO> reArr = qnaMapper.getQNAReListByQidx(qna.getQidx());
			if(reArr != null && reArr.size()>0) {
				qna.setIsCom("Y");
			}
			qna.setQna_ReList(reArr);
		}
		return qArr;
	}
	
	@Override
	public List<QNADTO> getQNAList(PagingVO page) {
		List<QNADTO> qArr = qnaMapper.getQNAList(page);
		for(QNADTO qna : qArr) {
			List<QNA_ReDTO> reArr = qnaMapper.getQNAReListByQidx(qna.getQidx());
			
			if(reArr != null && reArr.size()>0) {
				qna.setIsCom("Y");
			}
			ProductVO prod = prodService.selectByIdx(qna.getPidx());
			qna.setQna_ReList(reArr);
			qna.setProduct(prod);
		}
		return qArr;
	}
	
	@Override
	public int getQNACount(PagingVO page) {
		return qnaMapper.getQNACount(page);
	}
	
	@Override
	public int insertQNA_Re(QNA_ReDTO re) {
		return qnaMapper.insertQNA_Re(re);
	}
	
	@Override
	public int deleteQNARe(int re_qidx) {
		return qnaMapper.deleteQNARe(re_qidx);
	}

}
