package com.order.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.order.mapper.OrderMapper;
import com.order.model.OrderProductVO;
import com.order.model.OrderVO;
import com.product.model.PagingVO;
import com.product.model.ProductVO;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;

	@Override
	public int createOrderList(OrderVO ovo) {
		return 0;
	}

	@Override
	public int createOrderProductList(int pidx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<OrderVO> getOrderList(int midx) {
		return null;
	}

	@Override
	public List<OrderProductVO> getOrderProductList(int pidx) {
		return null;
	}

	@Override
	public int createOrderMember(OrderVO ovo) {
		return 0;
	}

	@Override
	public int getOrderCount(PagingVO pvo) {
		return 0;
	}

	@Override
	public int updateOrder(OrderVO ovo) {
		return 0;
	}

	@Override
	public int deleteOrder(Integer oidx) {
		return 0;
	}

	@Override
	public int totalPayment() {
		return 0;
	}

}
