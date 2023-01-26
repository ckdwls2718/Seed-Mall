package com.board.model;

import lombok.Data;

@Data
public class BoardComReVO {
	private int re_cidx; //댓글번호
	private int cidx; //커뮤니티 번호
	private int midx; //회원번호
	private String re_ccontent; //댓글내용
	private java.sql.Date re_cdate; //작성일
	
	private String email; //작성자 이메일
}
