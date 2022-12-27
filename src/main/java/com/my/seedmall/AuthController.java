package com.my.seedmall;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.user.model.MemberVO;
import com.user.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class AuthController {

	@Resource(name = "MemberService")
	private MemberService MemberService;
	
	@GetMapping("/join")
	public String joinForm() {
		return "member/join";
	}

	@PostMapping("/join")
	public String joinEnd(Model m, @ModelAttribute("Member") MemberVO Member) {
		log.info("join === Member: " + Member);
		if (Member.getEmail() == null || Member.getPwd() == null || Member.getMname() == null
				|| Member.getEmail().trim().isEmpty() || Member.getPwd().trim().isEmpty()
				|| Member.getMname().trim().isEmpty()) {

			return "redirect:join";
		}

		int n = MemberService.createMember(Member);
		String str = (n > 0) ? "회원가입 완료" : "가입 실패";
		String loc = (n > 0) ? "admin/userList" : "javascript:history.back()";

		m.addAttribute("message", str);
		m.addAttribute("loc", loc);
		return "msg";
	}
}
