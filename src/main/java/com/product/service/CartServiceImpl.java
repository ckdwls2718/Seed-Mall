package com.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.product.mapper.CartMapper;
import com.product.model.CartVO;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	CartMapper cartMapper;

	@Override
	public int insertCart(CartVO cart) {
		return cartMapper.insertCart(cart);
	}

	@Override
	public int updateCart(CartVO cart) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CartVO> selectMyCartList(int midx) {
		return cartMapper.selectMyCartList(midx);
	}

	@Override
	public int deleteCart(int cart_idx) {
		// TODO Auto-generated method stub
		return 0;
	}

}
