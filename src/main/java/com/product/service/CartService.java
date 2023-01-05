package com.product.service;

import java.util.List;

import com.product.model.CartVO;

public interface CartService {
	
	public int insertCart(CartVO cart);
	
	public int updateCart(CartVO cart);
	
	//카트 번호를 이용해 카트정보 가져오기
	public List<CartVO> getCartListByCidx(int[] cidxs);
	
	public List<CartVO> selectMyCartList(int midx);
	
	public int deleteCart(int cart_idx);

}
