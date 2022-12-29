package com.product.service;

import java.util.List;
import java.util.Map;

import com.product.model.*;

public interface ShopService {
	
	/*Pspec 별로 상품 정보 가져오기*/
	public List<ProductVO> selectByPspec(String pspec);
	/*카테고리별 상품정보 가져오기*/
	public List<ProductVO> selectByCategory(int cg_num);
	/**상품번호로 특정 상품 정보 가져오기*/
	public ProductVO selectByPidx(int pidx);
	
	
}
