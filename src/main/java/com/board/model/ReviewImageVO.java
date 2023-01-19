package com.board.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewImageVO {
	private int ridx;// 글번호
	private int imageridx; // 이미지
	private String rimage; // 파일이름
	private String rthumbnail; // 썸네일
	private String roriginfilename; // 원본이미지\
}
