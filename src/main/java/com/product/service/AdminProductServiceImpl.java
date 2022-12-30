package com.product.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.product.mapper.CategoryMapper;
import com.product.mapper.ProductMapper;
import com.product.model.CategoryVO;
import com.product.model.ProductForm;
import com.product.model.ProductImageVO;
import com.product.model.ProductVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminProductServiceImpl implements AdminProductService {

	@Inject
	private CategoryMapper categoryMapper;

	@Inject
	private ProductMapper productMapper;

	@Override
	public List<CategoryVO> getUpcategory() {

		return categoryMapper.getUpcategory();
	}

	@Override
	public List<CategoryVO> getDowncategory(String upCg_code) {
		return this.categoryMapper.getDowncategory(upCg_code);
	}

	@Override
	public int categoryAdd(CategoryVO cvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int categoryDelete(int cg_code) {
		return 0;
	}

	@Override
	public int productInsert(ProductForm prod, HttpServletRequest req) {

		// prod db에 먼저 저장
		int result = this.productMapper.productInsert(prod);

		// pk 받아와서 변수에 저장
		int image_pidx = prod.getPidx();
		
		if (result == 0) return 0;
		
		//이미지 업로드
		List<MultipartFile> imageList = prod.getPimage();
		if (imageList != null && !imageList.isEmpty()) {
			for(MultipartFile mf : imageList) {
				
			// 원본 이미지 저장
			ProductImageVO piVo = uploadImage(mf, req);

			// 썸네일 이미지 저장

			// 저장된 이름들 p i vo setter db에 저장
			piVo.setPidx(image_pidx);
			int result2 = insertImage(piVo);
			
			if(result2 == 0) {
				log.info(mf.getOriginalFilename()+" DB 저장 실패");
			}
			
			}
		}
		
		// 0:1
		return 1;
	}
	
	@Override
	public int insertImage(ProductImageVO piVo) {
		return productMapper.insertPimage(piVo);
	}

	@Override
	public ProductImageVO uploadImage(MultipartFile mf, HttpServletRequest req) {
		
		ProductImageVO piVo = new ProductImageVO();
		
		ServletContext app=req.getServletContext();
		String upDir=app.getRealPath("/resources/product_images");
		log.info("upDir==="+upDir);
		 
		File dir=new File(upDir);
		if(!dir.exists()) {
			dir.mkdirs();//업로드할 디렉토리 생성
		}
		
	
		/* 파일 이름 */
		String uploadFileName = mf.getOriginalFilename();			
		piVo.setPOriginFilename(uploadFileName);
		
		/* uuid 적용 파일 이름 */
		String uuid = UUID.randomUUID().toString();
		uploadFileName = uuid + "_" + uploadFileName;
		piVo.setPimage(uploadFileName);
		
			
		/* 파일 위치, 파일 이름을 합친 File 객체 */
		File saveFile = new File(upDir, uploadFileName);
			
		/* 파일 저장 */
		try {
			mf.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return piVo;
	}

	@Override
	public List<ProductVO> productList() {
		return this.productMapper.getProducts(null);
	}
	
	@Override
	public List<ProductImageVO> productImageList() {
		return this.productMapper.getProductImg();

	}

}
