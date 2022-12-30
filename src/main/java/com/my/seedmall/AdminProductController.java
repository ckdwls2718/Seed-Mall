package com.my.seedmall;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.product.model.CategoryVO;
import com.product.model.ProductForm;
import com.product.model.ProductVO;
import com.product.service.AdminProductService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
public class AdminProductController {
	
	@Inject
	private AdminProductService adminProductService;
	
	@GetMapping("/prodForm")
	public String productForm(Model m) {
		List<CategoryVO> upCgList=adminProductService.getUpcategory();
		log.info("upCgList=="+upCgList);
		m.addAttribute("upCgList", upCgList);
		
		return "/admin/prodForm";
	}
	//ajax요청에 대해 json으로 응답데이터를 보낸다
	@ResponseBody
	@GetMapping(value="/getDownCategory", produces = "application/json")
	public List<CategoryVO> getDownCategory(@RequestParam("upCg_code") String upCg_code){
		log.info("upCg_code==="+upCg_code);
		List<CategoryVO> downCgList=adminProductService.getDowncategory(upCg_code);
		return downCgList;
	}
	
	@ResponseBody
	@PostMapping("/imageUpload")
	public void uploadImage(MultipartFile[] pimage, HttpServletRequest req) {

		log.info("imageUploadPOST..........");
		String uploadFolder = "resources/product_images";
		
		ServletContext app=req.getServletContext();
		String upDir=app.getRealPath("/resources/product_images");
		log.info("upDir==="+upDir);
		
		File dir=new File(upDir);
		if(!dir.exists()) {
			dir.mkdirs();//업로드할 디렉토리 생성
		}
		
		for(MultipartFile image : pimage) {
			/* 파일 이름 */
			String uploadFileName = image.getOriginalFilename();			
			
			
			/* uuid 적용 파일 이름 */
			String uuid = UUID.randomUUID().toString();
			
			uploadFileName = uuid + "_" + uploadFileName;
			
			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(upDir, uploadFileName);
			
			/* 파일 저장 */
			try {
				image.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
	}
	
	@PostMapping("/prodInsert")
	public String productRegister(Model m, @ModelAttribute ProductForm prod, HttpServletRequest req
			) {
		
		log.info("product= "+prod);
		
		int result = adminProductService.productInsert(prod,req);
		
		return "/admin/prodInsert";
	}//------------------------------------------
	
	@GetMapping("/prodList")
	public String productList(Model m) {
		
		List<ProductVO> prodArr=adminProductService.productList();
		m.addAttribute("prodArr",prodArr);
		
		return "admin/prodList";
	}
	

}


















