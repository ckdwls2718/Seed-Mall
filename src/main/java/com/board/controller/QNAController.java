package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.model.QNADTO;
import com.board.model.QNA_ReDTO;
import com.board.service.QNAService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class QNAController {
	
	@Autowired
	QNAService qnaService;
	
	//상품에 관한 QNA 출력
	@GetMapping("/QNA/{pidx}")
	public String getQNA(Model m, @PathVariable("pidx") int pidx) {
		List<QNADTO> qArr = qnaService.getQNAListByPidx(pidx);
		m.addAttribute("qArr", qArr);
		return "board/QNAList";
	}
	
	@PostMapping(value="/QNA", produces = "application/json")
	@ResponseBody
	public int insertQNA(QNADTO qna) {
		
		//System.out.println("qna =>"+qna);
		int result = qnaService.insertQNA(qna);
		
		return result;
	}
	
	@PostMapping(value="/QNA/del", produces = "application/json")
	@ResponseBody
	public int deleteQNA(@RequestParam int qidx) {
		
		//System.out.println("qidx =>"+qidx);
		int result = qnaService.deleteQNA(qidx);
		
		return result;
	}
	
	//qna답변달기
	@PostMapping(value="admin/QNA", produces = "application/json")
	@ResponseBody
	public int insertQNA_Re(QNA_ReDTO re) {
		log.info("reply = "+re);
		int result = qnaService.insertQNA_Re(re);
		
		return result;
	}
	
	//qna답변달기
		@PostMapping(value="admin/QNA/del", produces = "application/json")
		@ResponseBody
		public int deleteQNA_Re(@RequestParam int re_qidx) {
			log.info("reply = "+re_qidx);
			int result = qnaService.deleteQNARe(re_qidx);
			
			return result;
		}
	
	
}
