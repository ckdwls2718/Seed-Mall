package com.my.seedmall;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.product.model.ProductVO;
import com.product.service.ProductService;


@Controller
public class HomeController {

	@Autowired
	ProductService prodService;
	
	@GetMapping("/")
	public String home(Model m) {
		
		// top 5
		List<ProductVO> prodArr = prodService.getProdListTop(5);
		
		// 커뮤니티 좋아요 많은 글
		
		m.addAttribute("prodArr", prodArr);
		return "index";
	}

	
}
