package com.product.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.product.model.CategoryVO;
import com.product.model.ProductForm;
import com.product.model.ProductImageVO;
import com.product.model.ProductVO;

public interface AdminProductService {
	
	public List<CategoryVO> getUpcategory();
	
	public List<CategoryVO> getDowncategory(String upCg_code);
	
	public int categoryAdd(CategoryVO cvo);
	public int categoryDelete(int cg_code);
	
	public ProductImageVO uploadImage(MultipartFile mf, HttpServletRequest req);
	public int insertImage(ProductImageVO piVo);

	/** [관리자 모드]- 상품 정보 등록하기 */
	public int productInsert(ProductForm prod, HttpServletRequest req);
	public List<ProductVO> productList();
	

}
