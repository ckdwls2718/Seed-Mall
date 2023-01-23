package com.order.model;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

// 주문개요VO : 주문했을 때 담기는 정보(배송지 정보 등)
@Data
public class OrderVO {
	// 여러 건 주문
	// private List<OrderProductVO> products;
	
	// 주문명세서(order_desc)
	private int desc_oidx; // 주문개요번호
	private String merchant_uid; // 주문번호
	private int midx; // 회원번호

	private int desc_oTotalPrice; // 전체가격
	private String deliveryState; // 배송상태
	private String statusStr; //배송상태 한글
	private int payment; // 지불형태
	private String payStr; // 지불방식
	private int gradePoint; // 등급포인트
	private int gradeDiscount; // 등급할인
	private String ocomment; // 배송 요청사항
	private java.sql.Date desc_odate; // 주문날짜
	
	// 수령자(ordermember)
	private int omidx; // 수령자번호
	private int pidx; // 상품번호
	private String omname; // 받는분
	private String omhp1, omhp2, omhp3; // 연락처
	private String ompost; // 우편번호
	private String omaddr1, omaddr2; // 주소
	private java.sql.Date omdate; // 주문날짜
	
	List<OrderProductVO> prodList = new ArrayList<>(); //주문에 대한 상품 정보
}
