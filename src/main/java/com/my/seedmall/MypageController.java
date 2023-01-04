package com.my.seedmall;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/mypage")
public class MypageController {
	
	@GetMapping("/plantList")
	public String myPlantList(Model m, HttpSession ses) {
		
		
		
		return "member/plantList";
	}
	
	@GetMapping("/plant/{pidx}")
	public String getPlantDetail(Model m, HttpSession ses, @PathVariable("pidx") int pidx) {
		
		
		return "member/plantDetail";
	}
}
