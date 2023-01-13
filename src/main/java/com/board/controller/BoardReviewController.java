package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.model.BoardReviewVO;
import com.board.service.BoardReviewService;
import com.board.service.NaverAiService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class BoardReviewController {
	
	@Autowired
	BoardReviewService boardReviewService;
	
	@Autowired
	NaverAiService aiService;
	
	@GetMapping("/review/{pidx}")
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
	
	@GetMapping("/review/ReviewGet")
	public String reviewDetail(Model m,@RequestParam("ridx") int ridx) {
		log.info("num==="+ridx);
		
		int n=boardReviewService.updateReadnum(ridx);
		log.info("n==="+n);
		m.addAttribute("Review",boardReviewService.selectBoardByIdx(ridx));
		
		return "review/reviewDetail";
		//리뷰 글보기 및 조회수 업데이트
	}//-------------------------------
	
	@PostMapping("/user/review")
	public String ReviewForm(@RequestParam(defaultValue="0") int oidx, @RequestParam(defaultValue="0") int pidx, Model m) {
		log.info("oidx==="+oidx+", pidx==="+pidx);
         m.addAttribute("oidx",oidx);
         m.addAttribute("pidx",pidx);
		return "review/reviewWrite";
	}
	
	@PostMapping("/user/reviewEnd")
	public String reviewInsert(@ModelAttribute BoardReviewVO rv) throws Exception {
		log.info("rv = "+rv);
		int sentiment = aiService.sentimentAnalyze(rv.getRcontent());
		
		log.info("sentiment"+sentiment);
		
		rv.setSentiment(sentiment);
		
		boardReviewService.insertReview(rv);

		return "redirect:../prod/"+rv.getPidx();
	}// 게시판 글쓰기
	
	@PostMapping(value="review/reviewDelete", produces = "application/json")
	// 리스폰스바디 추가
	@ResponseBody
	//반환 타입 int
	//return 타입도 int
	public int reviewDelete(@RequestParam int ridx) {
		int result =boardReviewService.deleteReview(ridx);
		return result;

	}// 게시판 삭제하기

	@PostMapping("review/reviewUpdate")
	public String reviewupdate(Model m, @ModelAttribute BoardReviewVO rv) {
		BoardReviewVO boardreview = boardReviewService.getReviewVO(rv);
		log.info("rv=="+rv);
		m.addAttribute("boardreview", boardreview);
		return "review/reviewEdit";

	}

	@PostMapping(value="review/reviewUpdateEnd", produces = "application/json")
	@ResponseBody
	public int boardEdit(@ModelAttribute BoardReviewVO rv, Model m) {
		int result = boardReviewService.updateReview(rv);
		
		log.info("rv=="+rv);
		return result;

	}// 게시판 수정 하기
	
	
	
}
