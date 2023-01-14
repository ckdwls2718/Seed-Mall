package com.product.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
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
import com.product.model.PagingVO;
import com.product.model.ProductForm;
import com.product.model.ProductImageVO;
import com.product.model.ProductVO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

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

		if (result == 0)
			return 0;

		// 이미지 업로드
		List<MultipartFile> imageList = prod.getPimage();
		if (imageList != null && !imageList.isEmpty()) {
			for (MultipartFile mf : imageList) {

				// 원본 이미지 저장
				ProductImageVO piVo = uploadImage(mf, req);

				// 저장된 이름들 p i vo setter db에 저장
				piVo.setPidx(image_pidx);
				int result2 = insertImage(piVo);

				if (result2 == 0) {
					log.info(mf.getOriginalFilename() + " DB 저장 실패");

				}

			}
		}
		// 0:1
		return result;

	}

	@Override
	public int insertImage(ProductImageVO piVo) {
		return productMapper.insertPimage(piVo);
	}

	@Override
	public ProductImageVO uploadImage(MultipartFile mf, HttpServletRequest req) {

		ProductImageVO piVo = new ProductImageVO();

		ServletContext app = req.getServletContext();
		String upDir = app.getRealPath("/resources/product_images");
		log.info("upDir===" + upDir);

		File dir = new File(upDir);
		if (!dir.exists()) {
			dir.mkdirs();// 업로드할 디렉토리 생성
		}

		/* 파일 이름 */
		String uploadFileName = mf.getOriginalFilename();
		piVo.setPOriginFilename(uploadFileName);
		

		/* uuid 적용 파일 이름 */
		String uuid = UUID.randomUUID().toString();
		uploadFileName = uuid + "_" + uploadFileName;
		piVo.setPimage(uploadFileName);
		String ThumbnailFileName = "Thumb_"+uploadFileName;
		piVo.setPthumbnail(ThumbnailFileName);

		

		/* 파일 저장 */
		try {
			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(upDir, uploadFileName);
			
			
			if(checkImageType(saveFile)) {
				FileOutputStream thumbnail = 
					new FileOutputStream(new File(upDir,ThumbnailFileName));
				Thumbnailator
				.createThumbnail(mf.getInputStream(), thumbnail, 100, 100);
					
			}
			mf.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return piVo;
	}

	@Override
	public List<ProductVO> productList(PagingVO page) {
		List<ProductVO> prodArr = this.productMapper.getProducts(page);
		for(ProductVO prod : prodArr) {
			List<ProductImageVO> prodImageArr = productMapper.getProdImages(prod.getPidx());
			prod.setPimageList(prodImageArr);
		}
		return prodArr;
	}
	

	
	private boolean checkImageType(File file) {
		try {
			String contentType= Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		}catch (IOException e) {
			e.printStackTrace();
		}
		return false;

	}
	
	@Override
	public ProductVO selectByPidx(int pidx) {
		ProductVO pvo=this.productMapper.selectByPidx(pidx);
		List<ProductImageVO> prodImageArr = productMapper.getProdImages(pidx);
		pvo.setPimageList(prodImageArr);
		return pvo;
	}

	@Override
	public int updateProduct(ProductForm prod, HttpServletRequest req) {
		// prod db에 먼저 저장
		int result = this.productMapper.updateProduct(prod);

		// pk 받아와서 변수에 저장
		int image_pidx = prod.getPidx();

		if (result == 0)
			return 0;

		// 이미지 업로드
		List<MultipartFile> imageList = prod.getPimage();
		if (imageList != null && !imageList.isEmpty()) {
			for (MultipartFile mf : imageList) {

				// 원본 이미지 저장
				ProductImageVO piVo = uploadImage(mf, req);

				// 저장된 이름들 p i vo setter db에 저장
				piVo.setPidx(image_pidx);
				int result2 = insertImage(piVo);

				if (result2 == 0) {
					log.info(mf.getOriginalFilename() + " DB 저장 실패");

				}

			}
		}
		// 0:1
		return result;

	}

	

	@Override
	public int deleteProduct(int pidx) {
		return this.productMapper.deleteProduct(pidx);
	}

	@Override
	public int deleteImage(int pidx, HttpServletRequest req) {
		
		ServletContext app = req.getServletContext();
		String upDir = app.getRealPath("/resources/product_images");
		List<ProductImageVO> pivo=productMapper.getProdImages(pidx);
		
		int x=1;
		for(ProductImageVO pimage : pivo) {
			File img = new File(upDir, pimage.getPimage());
			File thumb = new File(upDir, pimage.getPthumbnail());
			
			if(img.exists() && thumb.exists()) {
				img.delete();
				thumb.delete();
			}
			else {
				x=x-1;
			}
		}
		productMapper.deleteImage(pidx);
		return x;
	}
<<<<<<< HEAD
=======

	@Override
	public int insertUpcg(CategoryVO cvo) {
		return this.productMapper.insertUpcg(cvo);
	}

	@Override
	public int insertDowncg(CategoryVO cvo) {
		return this.productMapper.insertDowncg(cvo);
	}

>>>>>>> develop
}
