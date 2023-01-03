package com.order.model;

import lombok.Data;

// 주문개요VO : 상세페이지에서 주문했을 때 담기는 정보(배송지 정보 등)
@Data
public class OrderVO {
	private int desc_oidx; // 주문개요번호
	private int midx; // 회원번호

	private int totalPrice; // 전체가격
	private String delivaryState; // 배송상태
	private int payment; // 지불형태
	private int gradePoint; // 등급포인트
	private int gradeDiscount; // 등급할인
	private String ocomment; // 배송 요청사항
	private java.sql.Date desc_odate; // 주문날짜

	// 수령자
	private int order_idx; // 주문번호
	private String oname; // 받는분
	private String ohp1, ohp2, ohp3; // 연락처
	private String opost; // 우편번호
	private String oaddr1, oaddr2; // 주소
	private java.sql.Date odate; // 주문날짜
}
