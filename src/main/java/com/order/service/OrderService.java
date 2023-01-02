package com.order.service;

import java.util.List;

import com.order.model.OrderVO;
import com.product.model.ProductVO;

public interface OrderService {
	int total();

	OrderVO getOrder(Integer pidx);
}
