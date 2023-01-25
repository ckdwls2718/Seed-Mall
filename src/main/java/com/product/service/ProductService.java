package com.product.service;

import java.util.List;

import com.product.model.CategoryVO;
import com.product.model.PagingVO;
import com.product.model.ProductVO;

public interface ProductService {
	
	int getProdTotal(PagingVO page);
	
	List<ProductVO> getProdList(PagingVO page);
	
	List<ProductVO> getProdListPaging(PagingVO page);
	
	List<ProductVO> selectByspec(String spec);
	
	List<ProductVO> selectByCategory(CategoryVO cvo);
	
	ProductVO selectByIdx(int pidx);
	
	List<ProductVO> getProdListTop(int n);
	
	//주문 상품 번호를 이용해서 상품 가져오기
	ProductVO selectByOidx(int oidx);
}
