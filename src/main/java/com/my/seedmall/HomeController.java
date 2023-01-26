package com.my.seedmall;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.board.model.BoardComVO;
import com.board.model.BoardReviewVO;
import com.board.service.BoardComService;
import com.board.service.BoardReviewService;
import com.common.service.CommonService;
import com.product.model.ProductVO;
import com.product.service.ProductService;


@Controller
public class HomeController {

	@Autowired
	ProductService prodService;
	
	@Autowired
	BoardComService comService;
	
	@Autowired
	BoardReviewService reviewService;
	
	@Autowired
	CommonService commonService;
	
	@GetMapping("/")
	public String home(Model m) {
		
		// top 5
		List<ProductVO> prodArr = prodService.getProdListTop(5);
		
		// 커뮤니티 좋아요 top
		List<BoardComVO> comArr = comService.getBoardComListTop(9);
		for(BoardComVO com : comArr) {
			String email = commonService.emailPrivate(com.getEmail());
			com.setEmail(email);
		}
		
		// 사진 리뷰 top3
		List<BoardReviewVO> reviewArr = reviewService.getReviewListTop(3);
		for(BoardReviewVO re : reviewArr) {
			String email = commonService.emailPrivate(re.getEmail());
			re.setEmail(email);
		}
		
		m.addAttribute("prodArr", prodArr);
		m.addAttribute("comArr", comArr);
		m.addAttribute("reviewArr", reviewArr);
		return "index";
	}

	
}
