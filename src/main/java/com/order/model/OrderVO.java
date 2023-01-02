package com.order.model;

import java.util.List;

import com.product.model.ProductVO;

import lombok.Data;

// 주문VO : 상품정보가 담기는 곳
@Data
public class OrderVO {
	List<ProductVO> prodList; // 상품정보
	
	private int order_idx; // 주문번호
	private int desc_oidx; // 주문개요번호
	private int oqty; // 상품개수
	private int osaleprice; // 가격
	private int oPoint; // 포인트
	private java.sql.Date odate; // 주문날짜
}
