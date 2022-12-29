package com.my.seedmall;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestHeader;

import com.board.service.BoardService;
import com.user.model.MemberVO;
import com.user.model.PagingVO;
import com.user.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class AdminUserController {
	
	@Resource(name = "MemberService" )
	private MemberService MemberService;
	
	@GetMapping("/memberlist")
	public String userlist(Model m) {
		
		
		List<MemberVO> userArr=this.MemberService.listUser(null);
		log.info(userArr);
		m.addAttribute("userArr", userArr);
		
		return "/member/list";
	
	}
//	@Resource(name="boardServicImpl")
//	private BoardService boardService;
//	
//	@GetMapping("/list")
//	public String boardListPaging(Model m, @ModelAttribute("page") PagingVO page, HttpServletRequest req,
//			@RequestHeader("user-Agent")String userAgent) {
//		String myctx=req.getContextPath();
//		
//		HttpSession ses=req.getSession();
//		
//		log.info("1. page==="+page);
//		
//		int totalCount=this.boardService.getTotalCount(page);
//		
//		
//		
//		
//	}
}
