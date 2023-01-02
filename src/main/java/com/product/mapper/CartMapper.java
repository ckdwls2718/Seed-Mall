package com.product.mapper;

import java.util.List;

import com.product.model.CartVO;

public interface CartMapper {
	public int insertCart(CartVO cart);
	
	public int updateCart(CartVO cart);
	
	public List<CartVO> selectMyCartList(int midx);
	
	public int deleteCart(int cart_idx);
}
