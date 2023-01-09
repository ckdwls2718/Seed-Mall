package com.my.seedmall;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;

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
	public String productList(Model m, @ModelAttribute PagingVO page, HttpServletRequest req,
			@RequestHeader("user-Agent")String userAgent) {
		
		log.info("page = "+page);
		
		
		String myctx=req.getContextPath();
		HttpSession ses=req.getSession();
		
		
		
		int totalCount = productService.getProdTotal(page);
		page.setTotalCount(totalCount);
		page.init(ses);
		
		log.info("totalCount = "+totalCount);
		
		String loc = "prod";
		String pageNavi = page.getPageNavi(myctx, loc);
		
		List<CategoryVO> categoryArr = categoryMapper.getAllDowncategory();
		
		List<ProductVO> prodArr = productService.getProdListPaging(page);
		m.addAttribute("prodArr", prodArr);
		m.addAttribute("paging", page);
		m.addAttribute("downcategory",categoryArr);
		m.addAttribute("pageNavi", pageNavi);
		return "product/prodList";
	}//-------------------------------------
	
	@GetMapping("/prod/{pidx}")
	public String productDetail(Model m, @PathVariable("pidx") int pidx) {
		ProductVO prod = productService.selectByIdx(pidx);
		m.addAttribute("prod", prod);
		return "product/prodDetail";
	}//-------------------------------------
}
