package com.my.seedmall;

import java.io.File;
import java.io.IOException;
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
import com.product.model.ProductImageVO;
import com.product.model.ProductVO;
import com.product.service.AdminProductService;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Positions;
import net.coobird.thumbnailator.name.Rename;

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
	
	
	
	@PostMapping("/prodInsert")
	public String productRegister(Model m, @ModelAttribute ProductForm prod, HttpServletRequest req
			) {
		
		log.info("product= "+prod);
		
		int result = adminProductService.productInsert(prod,req);
		String str=(result>0)?"상품등록 성공":"등록 실패";
		String loc=(result>0)?"prodList":"javascript:history.back()";
		
		m.addAttribute("message",str);
		m.addAttribute("loc",loc);
		return "msg";
	}//------------------------------------------
	
	@GetMapping("/prodList")
	public String productList(Model m) {
		
		List<ProductVO> prodArr=adminProductService.productList();
		List<ProductImageVO> prodImageArr=adminProductService.productImageList();
		
		m.addAttribute("prodArr",prodArr);
		m.addAttribute("prodImageArr",prodImageArr);
	
		
		return "admin/prodList";
	}
	

}


















