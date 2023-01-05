package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.board.model.QNADTO;
import com.board.service.QNAService;

@Controller
@RequestMapping("/QNA")
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
	
	
}
