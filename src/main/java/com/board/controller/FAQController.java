package com.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.board.service.BoardService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class FAQController {
	@Autowired
	BoardService boardService;
	
	@GetMapping("/FAQ")
    public String FAQView() {
        return "board/FAQ";
    }
}
