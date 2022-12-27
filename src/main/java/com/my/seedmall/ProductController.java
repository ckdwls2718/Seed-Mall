package com.my.seedmall;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class ProductController {
	
	@GetMapping("/prodList")
	public String productList() {
		
		return "product/prodList";
	}//-------------------------------------
	
	@GetMapping("/prodDetail")
	public String productDetail() {
		
		return "product/prodDetail";
	}//-------------------------------------
}
