package com.order.service;

import java.util.List;

import com.order.model.OrderProductVO;
import com.order.model.OrderVO;
import com.product.model.PagingVO;
import com.product.model.ProductVO;

public interface OrderService {
	// 주문 명세서 생성하기(+수령자)
	int createOrderList(OrderVO ovo);
	
	// 주문VO 생성하기 - 상품 정보 생성하기
	int createOrderProductList(int pidx);
	
	// 주문 명세서 가져오기
	List<OrderVO> getOrderList(int midx);
	
	// 상품정보 가져오기
	List<OrderProductVO> getOrderProductList(int pidx);

	int getOrderCount(PagingVO pvo);
	
	// 주문정보 수정
	int updateOrder(OrderVO ovo);
	
	// 주문정보 삭제
	int deleteOrder(Integer oidx);

	// 총 결제액
	int totalPayment();
}
