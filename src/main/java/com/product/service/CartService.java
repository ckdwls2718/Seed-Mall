package com.product.service;

import java.util.List;

import com.product.model.CartVO;

public interface CartService {
	
	public int insertCart(CartVO cart);
	
	public int updateCart(CartVO cart);
	
	public List<CartVO> selectMyCartList(int midx);
	
	public int deleteCart(int cart_idx);

}
