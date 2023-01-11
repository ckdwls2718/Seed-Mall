package com.board.service;

import java.util.List;

import com.board.model.FAQVO;

public interface FAQService {
	
	List<FAQVO> getFAQList();
	List<FAQVO> getFAQListByFnum(String fnum);

}
