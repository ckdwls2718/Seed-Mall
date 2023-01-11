package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.model.QNADTO;
import com.board.service.QNAService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/QNA")
@Log4j
public class QNAController {
	
	@Autowired
	QNAService qnaService;
	
	//상품에 관한 QNA 출력
	@GetMapping("/{pidx}")
	public String getQNA(Model m, @PathVariable("pidx") int pidx) {
		List<QNADTO> qArr = qnaService.getQNAList(pidx);
		m.addAttribute("qArr", qArr);
		return "board/QNAList";
	}
	
	@PostMapping(value="", produces = "application/json")
	@ResponseBody
	public int insertQNA(QNADTO qna) {
		
		//System.out.println("qna =>"+qna);
		int result = qnaService.insertQNA(qna);
		
		return result;
	}
	
	@PostMapping(value="/del", produces = "application/json")
	@ResponseBody
	public int deleteQNA(@RequestParam int qidx) {
		
		//System.out.println("qidx =>"+qidx);
		int result = qnaService.deleteQNA(qidx);
		
		return result;
	}
	
	
}
