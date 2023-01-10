package com.board.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardComVO {
	private int cidx; // 글번호
	private int midx;//회원번호
	private String email;
	private String ctitle; // 제목 
	private String ccontent; // 내용
	private int creadnum; // 조회수
	private int clikenum; // 좋아요수
	private java.sql.Date cdate; // 작성일
	
}
