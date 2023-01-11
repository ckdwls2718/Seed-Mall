package com.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.product.mapper.ProductMapper;
import com.product.model.CategoryVO;
import com.product.model.PagingVO;
import com.product.model.ProductImageVO;
import com.product.model.ProductVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductMapper productMapper;
	
	@Override
	public int getProdTotal(PagingVO page) {
		return productMapper.getProdCount(page);
	}

	@Override
	public List<ProductVO> getProdList(PagingVO page) {
		List<ProductVO> prodArr = productMapper.getProducts(page);
		for (ProductVO prod : prodArr) {
			List<ProductImageVO> prodImageArr = productMapper.getProdImages(prod.getPidx());
			prod.setPimageList(prodImageArr);
		}
		log.info("prodArr" + prodArr);
		return prodArr;
	}
	
	@Override
	public List<ProductVO> getProdListPaging(PagingVO page) {
		List<ProductVO> prodArr = productMapper.getProductsPaging(page);
		for (ProductVO prod : prodArr) {
			List<ProductImageVO> prodImageArr = productMapper.getProdImages(prod.getPidx());
			prod.setPimageList(prodImageArr);
		}
		log.info("prodArr" + prodArr);
		return prodArr;
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
	public ProductVO selectByIdx(int pidx) {
		ProductVO prod = productMapper.selectByPidx(pidx);
		List<ProductImageVO> prodImageArr = productMapper.getProdImages(prod.getPidx());
		prod.setPimageList(prodImageArr);
		return prod;
	}

}
