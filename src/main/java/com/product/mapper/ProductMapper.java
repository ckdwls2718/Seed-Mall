package com.product.mapper;

import java.util.List;

import com.product.model.CategoryVO;
import com.product.model.PagingVO;
import com.product.model.ProductForm;
import com.product.model.ProductImageVO;
import com.product.model.ProductVO;

public interface ProductMapper {

	int productInsert(ProductForm vo);

	List<ProductVO> getProducts(PagingVO page);

	List<ProductImageVO> getProdImages(int pidx);

	List<ProductVO> selectByPspec(String pspec);

	List<ProductVO> selectByCategory(CategoryVO cvo);

	ProductVO selectByPidx(int pidx);

	int insertPimage(ProductImageVO piVo);

	int deleteProduct(int pidx);

	int deleteImage(int pidx);

	int updateProduct(ProductForm prod);
}
