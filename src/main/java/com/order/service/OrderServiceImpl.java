package com.order.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.order.mapper.OrderMapper;
import com.order.model.OrderVO;
import com.product.model.ProductVO;

@Service("OrderService")
public class OrderServiceImpl implements OrderService {
	
	@Inject
	private OrderMapper orderMapper;

	@Override
	public OrderVO getOrder(Integer pidx) {
		return orderMapper.getOrder(pidx);
	}

	@Override
	public int total() {
		return 0;
	}

}
