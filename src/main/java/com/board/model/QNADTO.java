package com.board.model;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class QNADTO {
	private int qidx; //글번호
	private int pidx; //상품번호
	private int midx; //회원번호
	private String qtitle; //제목
	private String qcontent; //내용
	private String secret="N"; //비밀글 여부
	private Date qdate; //작성일
	
	private String email; //작성자 이메일
	private List<QNA_ReDTO> qna_ReList; //QNA 댓글 리스트
}
