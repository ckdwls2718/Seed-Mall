package com.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.product.mapper.ProductMapper;
import com.product.model.ProductVO;

@Service
public class ShopServiceImpl implements ShopService {
	
	@Autowired
	private ProductMapper productMapper;
	

	@Override
	public List<ProductVO> selectByPspec(String pspec) {
		return this.productMapper.selectByPspec(pspec);
	}

	@Override
	public List<ProductVO> selectByCategory(int cg_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProductVO selectByPidx(int pidx) {		
		return this.productMapper.selectByPidx(pidx);
	}

	

}
