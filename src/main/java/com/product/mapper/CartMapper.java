package com.product.mapper;

import java.util.List;

import com.product.model.CartVO;

public interface CartMapper {
	public int insertCart(CartVO cart);
	
	//장바구니에 담긴 상품이 똑같은지 비교
	public int existCart(CartVO cart);
	
	//장바구니에 똑같은 상품이 있으면 상품수량만 추가
	public int plusCart(CartVO cart);
	
	//장바구니 상품 수량을 수정
	public int updateCart(CartVO cart);
	
	public List<CartVO> selectMyCartList(int midx);
	
	public int deleteCart(int cart_idx);
}
