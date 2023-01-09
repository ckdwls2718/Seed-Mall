package com.my.seedmall;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/adminPage")
public class AdminPageController {

	@GetMapping()
	public String mypage() {
		return "admin/adminPage";
	}

	@GetMapping("/orderManagement")
	public String orderManagement(Model m, HttpSession ses) {

		return "admin/orderManagement";
	}
	
	@GetMapping("/plantManagement")
	public String plantManagement(Model m, HttpSession ses) {
		
		return "admin/plantManagement";
	}
	
	@GetMapping("/history")
	public String history(Model m, HttpSession ses) {
		
		return "admin/history";
	}
	
	
	
}
