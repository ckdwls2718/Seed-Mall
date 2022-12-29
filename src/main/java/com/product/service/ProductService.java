package com.product.service;

import java.util.List;

import com.product.model.CategoryVO;
import com.product.model.ProductVO;

public interface ProductService {
	
	List<ProductVO> getProdList();
	
	List<ProductVO> selectByspec(String spec);
	
	List<ProductVO> selectByCategory(CategoryVO cvo);
	
	ProductVO selectByIdx(int idx);
}
