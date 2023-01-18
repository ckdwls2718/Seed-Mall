package com.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.order.mapper.OrderMapper;
import com.order.model.OrderProductVO;
import com.order.model.OrderVO;
import com.user.model.PagingVO;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;

	@Override
	public int createOrderList(OrderVO ovo) {
		return orderMapper.createOrderList(ovo);
	}

	@Override
	public int createOrderProductList(OrderProductVO opvo) {
		return orderMapper.createOrderProductList(opvo);
	}

	@Override
	public List<OrderVO> getOrderList(int midx) {
		return orderMapper.getOrderList(midx);
	}
	
	@Override
	public List<OrderVO> getOrderList_paging(PagingVO page) {
		return orderMapper.getOrderList_paging(page);
	}
	
	
	@Override
	public List<OrderVO> getOrderMemberList_paging(PagingVO page) {
		return orderMapper.getOrderMemberList_paging(page);
	}
	
	@Override
	public List<OrderProductVO> getOrderProductrList_paging(PagingVO page) {
		return orderMapper.getOrderProductrList_paging(page);
	}
	
	@Override
	public int orderConfirmed(int oidx) {
		return orderMapper.orderConfirmed(oidx);
	}
	

	@Override
	public List<OrderProductVO> getOrderProductList(int desc_oidx) {
		return orderMapper.getOrderProductList(desc_oidx);
	}

	@Override
	public int getOrderCount(PagingVO pvo) {
		return orderMapper.getOrderCount(pvo);
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

	@Override
	public OrderProductVO getOrderProduct(int pidx) {
		return orderMapper.getOrderProduct(pidx);
	}

	@Override
	public OrderVO getOrderDesc(int desc_oidx) {
		return orderMapper.getOrderDesc(desc_oidx);
	}

	@Override
	public OrderVO getOrderMember(int desc_oidx) {
		return orderMapper.getOrderMember(desc_oidx);
	}

	@Override
	public int updateDeliveryStatus(OrderVO ovo) {
		return orderMapper.updateDeliveryStatus(ovo);
	}

	@Override
	public List<OrderVO> getRefundList_paging(PagingVO page) {
		return orderMapper.getRefundList_paging(page);
	}

}
