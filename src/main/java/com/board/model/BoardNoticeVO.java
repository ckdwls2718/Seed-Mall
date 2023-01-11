package com.board.model;

import java.sql.Date;
import java.util.List;

import com.user.model.MemberVO;

import lombok.Data;

@Data
public class BoardNoticeVO {
	
	MemberVO mvo;
	private int nidx;
	private int midx;
	private String ntitle;
	private String ncontent;
	private int nreadnum;
	private int priority;
	private Date ndate;
	private List<String> sources;
}
