package com.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.board.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;
	
	@GetMapping("/test")
	public String test(Model m) {
		m.addAttribute("boardArr", boardService.getBoardList());
		return "test";
	}
}
