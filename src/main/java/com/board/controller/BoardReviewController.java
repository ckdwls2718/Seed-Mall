package com.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.board.model.BoardReviewVO;
import com.board.model.QNADTO;
import com.board.service.BoardReviewService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/review")
public class BoardReviewController {
	
	@Autowired
	BoardReviewService boardReviewService;
	
	@GetMapping("/{pidx}")
	public String getreview(Model m, @PathVariable("pidx") int pidx) {
		List<BoardReviewVO> rarr= boardReviewService.getReview(pidx);
		m.addAttribute("rarr", rarr);
		return "review/review";
		
	}
	
	@PostMapping(value="", produces = "application/json")
	@ResponseBody
	public int insertReview(BoardReviewVO rv) {
		log.info("rv=="+rv);
		//System.out.println("qna =>"+qna);
		int result = boardReviewService.insertReview(rv);
		
		return result;
	}
}
