package com.board.model;

import lombok.Data;

@Data
public class FAQVO {
	
	private int fidx;
	private String ftitle;
	private String fanswer;
	private String fcategory;
	private int fnum; //카테고리 분류 넘버
}
