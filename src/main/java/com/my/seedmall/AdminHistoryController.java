package com.my.seedmall;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
//@RequestMapping("/admin")
@Log4j
public class AdminHistoryController {

	@RequestMapping("/history")
	public String history(){
		log.info("&&&&&&&&&&&&&&&&&&&&&&&");
		return "history";
	}
}
