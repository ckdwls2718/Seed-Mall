package com.my.seedmall;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.product.mapper.CategoryMapper;
import com.product.model.CategoryVO;
import com.product.model.PagingVO;
import com.product.model.ProductVO;
import com.product.service.ProductService;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CategoryMapper categoryMapper;
	
	@GetMapping("/prod")
	public String productList(Model m, @ModelAttribute PagingVO page) {
		
		log.info("page = "+page);
		List<CategoryVO> categoryArr = categoryMapper.getAllDowncategory();
		
		//log.info("category = "+categoryArr);
		//log.info("categorySize = "+categoryArr.size());
		
		List<ProductVO> prodArr = productService.getProdList(page);
		m.addAttribute("prodArr", prodArr);
		m.addAttribute("paging", page);
		m.addAttribute("downcategory",categoryArr);
		return "product/prodList";
	}//-------------------------------------
	
	@GetMapping("/prod/{pidx}")
	public String productDetail(Model m, @PathVariable("pidx") int pidx) {
		ProductVO prod = productService.selectByIdx(pidx);
		m.addAttribute("prod", prod);
		return "product/prodDetail";
	}//-------------------------------------
}
