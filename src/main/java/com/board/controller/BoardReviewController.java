package com.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.board.model.ReviewImageVO;
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
	
	
	@GetMapping("/review/ReviewGet")
	public String reviewDetail(Model m,@RequestParam("ridx") int ridx) {
		log.info("num==="+ridx);
		
		int n=boardReviewService.updateReadnum(ridx);
		List<ReviewImageVO> reviewI=boardReviewService.getReviewImages(ridx);
		log.info("n==="+n+" reviewI=="+reviewI);
		m.addAttribute("Review",boardReviewService.selectBoardByIdx(ridx));
		m.addAttribute("ReviewI",reviewI);
			
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
	public String reviewInsert(Model m,@ModelAttribute BoardReviewVO rv, HttpServletRequest req) throws Exception {
		log.info("rv = "+rv);
		int sentiment = aiService.sentimentAnalyze(rv.getRcontent());
		
		log.info("sentiment"+sentiment);
		
		rv.setSentiment(sentiment);
		
		int result = boardReviewService.insertReview(rv, req);
		
		String str = (result > 0) ? "상품등록 성공" : "등록 실패";
		String loc = (result > 0) ? "prodList" : "javascript:history.back()";
		log.info(result);
		
		m.addAttribute("message", str);
		m.addAttribute("loc", loc);

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
	
	@PostMapping(value="review/reviewLikeNum", produces = "application/json")
	@ResponseBody
	public int boardLike(BoardReviewVO rv) {
		int result = boardReviewService.like_check(rv);
		
		log.info("like=="+rv);
		
		return result;
		
	}
	
	@PostMapping(value="review/reviewLikeNumCancel", produces = "application/json")
	@ResponseBody
	public int boardLikeCancel(BoardReviewVO rv) {
		int result = boardReviewService.like_check_cancel(rv);
		
		log.info("like=="+rv);
		
		return result;
		
	}
	
	
	
}
