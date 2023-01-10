package com.myplant.model;

import lombok.Data;

@Data
public class PlantImageVO {
	
	private int image_pidx; //식물 이미지 번호
	private String pimage; //업로드이미지 이름
	private java.sql.Date piDate; //업로드 일자

}
