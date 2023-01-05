package com.product.model;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;


@Data
public class ProductVO {
	//property
	private String upCg_code;//상위 카테고리 코드
	private String upCg_name;//상위 카테고리명
	
	private String downCg_code;//하위 카테고리 코드
	private String downCg_name;//하위 카테고리명
	
	private int pidx;
	private String pname;
	
	
	private int price;
	private int psaleprice;
	private int pqty;
	private int ppoint;
	
	private String pspec;
	private String sun;
	private String temp;
	private String soil;
	private String pcontent;
	
	private java.sql.Date pdate;
	private int preadnum;
	private int plikenum;
	
	//상품 이미지 리스트
	List<ProductImageVO> pimageList = new ArrayList<>();
	
	private int totalPrice; /*총판매가 = 상품판매가 x수량*/
	private int totalPoint; /*총포인트 = 포인트 x수량*/
	
	private String oidx; //상품 주문시 사용할 주문번호
	
	public void setPqty(int pqty) {
		this.pqty = pqty;
		//////////////////////////////////////////////
		this.totalPrice = this.psaleprice*this.pqty;
		this.totalPoint = this.ppoint*this.pqty;
		//////////////////////////////////////////////
	}//------------------------
	
	/**할인율을 반환하는 메서드*/
	public int getPercent() {
		//   (정가-판매가)*100/정가
		int percent=(price-psaleprice)*100/price;
		return percent;
	}

}/////////////////////////////
