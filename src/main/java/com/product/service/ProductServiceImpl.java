package com.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.product.mapper.ProductMapper;
import com.product.model.CategoryVO;
import com.product.model.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductMapper productMapper;
	

	@Override
	public List<ProductVO> getProdList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductVO> selectByspec(String spec) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductVO> selectByCategory(CategoryVO cvo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProductVO selectByIdx(int idx) {
		// TODO Auto-generated method stub
		return null;
	}

}
