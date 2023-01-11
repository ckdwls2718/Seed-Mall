package com.board.model;

import java.sql.Date;

import lombok.Data;

@Data
public class QNA_ReDTO {
	private int re_qidx; // 댓글번호
	private int qidx; // qna글 번호
	private int midx; // 회원번호
	private String re_qcontent; // 댓글내용
	private Date re_qdate; // 댓글 작성일
}
