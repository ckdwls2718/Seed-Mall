package com.myplant.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class PlantForm {
	private int plant_idx; //식물번호
	private MultipartFile plantImage; //식물 이미지
	private String plantImageStr; // 식물 이미지 uuid
	private String pcomment; // 식물 코멘트
	private int percent; //성장률
}
