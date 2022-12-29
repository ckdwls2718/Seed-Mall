package com.my.seedmall;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.product.model.PagingVO;
import com.product.model.ProductVO;
import com.product.service.ProductService;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@GetMapping("/prod")
	public String productList(Model m, @ModelAttribute PagingVO page) {
		
		log.info("page = "+page);
		
		List<ProductVO> prodArr = productService.getProdList();
		m.addAttribute("prodArr", prodArr);
		m.addAttribute("paging", page);
		return "product/prodList";
	}//-------------------------------------
	
	@GetMapping("/prod/{pidx}")
	public String productDetail(Model m, @PathVariable("pidx") int pidx) {
		ProductVO prod = productService.selectByIdx(pidx);
		m.addAttribute("prod", prod);
		return "product/prodDetail";
	}//-------------------------------------
}
