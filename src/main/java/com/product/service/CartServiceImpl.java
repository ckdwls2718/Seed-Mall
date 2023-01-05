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
		int n = cartMapper.existCart(cart);
		if(n>0) {
			return cartMapper.plusCart(cart);
		} else {
			return cartMapper.insertCart(cart);
		}
	}

	@Override
	public int updateCart(CartVO cart) {
		return cartMapper.updateCart(cart);
	}

	@Override
	public List<CartVO> selectMyCartList(int midx) {
		return cartMapper.selectMyCartList(midx);
	}

	@Override
	public int deleteCart(int cart_idx) {
		return cartMapper.deleteCart(cart_idx);
	}

}
