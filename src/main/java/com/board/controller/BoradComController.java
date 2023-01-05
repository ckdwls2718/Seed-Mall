package com.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/BoradCom/*")
public class BoradComController {
	
	@RequestMapping(value="/BoradComList", method=RequestMethod.GET)
	public void getList() {
		
	}

}
