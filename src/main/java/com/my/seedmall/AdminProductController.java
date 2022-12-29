package com.my.seedmall;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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


















