package com.myplant.model;

import java.util.List;

import lombok.Data;

@Data
public class MyPlantVO {
	private int plant_idx; // 식물번호
	private int midx; // 회원번호
	private int oidx; // 주문번호
	private String nickname; // 별명
	private String plantImage; // 식물이미지
	private int percent; // 성장률
	private String pcomment; // 코멘트
	private java.sql.Date pdate; // 작성일
	
	private String email; //구매자의 이메일
	private String mname; // 구매자의 이름
	
	private List<PlantImageVO> plantImageList; // 식물 이미지 리스트
}
