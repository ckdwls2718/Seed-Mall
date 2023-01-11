package com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.mapper.FAQMapper;
import com.board.model.FAQVO;


@Service
public class FAQServiceImpl implements FAQService {
	
	@Autowired
	FAQMapper faqMapper;
	
	
	@Override
	public List<FAQVO> getFAQList(){
		return faqMapper.getFAQList();
	}


	@Override
	public List<FAQVO> getFAQListByFnum(String fnum) {
		
		return faqMapper.getFAQListByFnum(fnum);
	}
}
