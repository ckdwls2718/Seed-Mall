package com.my.seedmall;

import java.io.File;
import java.io.IOException;
import java.util.List;

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
import com.product.model.ProductVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
public class AdminProductController {
	

	@GetMapping("/prodForm")
	public String productForm(Model m, HttpServletRequest req) {
		String myctx = req.getContextPath();
		m.addAttribute("myctx", myctx);
		System.out.println(myctx);
		return "/admin/prodForm";
	}
	@GetMapping("/prodList")
	public String productList() {

		return "/admin/prodList";
	}

	@PostMapping("/prodInsert")
	public String productRegister() {		
		
		return "admin/prodInsert";
	}//------------------------------------------
	

}


















