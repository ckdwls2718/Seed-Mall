package com.board.mapper;

import java.util.List;

import com.board.model.FAQVO;

public interface FAQMapper {

	List<FAQVO> getFAQList();
	List<FAQVO> getFAQListByFnum(String fnum);
	
}
