package com.my.seedmall;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.user.service.AdminHistoryService;

import lombok.extern.log4j.Log4j;

@Controller
//@RequestMapping("/admin")
@Log4j
public class AdminHistoryController {
	
//	@Autowired
//	AdminHistoryService historyService;
//	

	@GetMapping("/history")
	public String history(Model m){
		log.info("adminPage");
		
		//일매출
		
		//월매출
		
		//연매출
		
		
		return "history";
	}
}
