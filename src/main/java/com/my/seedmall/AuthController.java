package com.my.seedmall;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.user.model.MemberVO;
import com.user.model.NotUserException;
import com.user.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class AuthController {

	@Resource(name = "MemberService" )
	private MemberService memberService;

	@GetMapping("/join")
	public String joinForm() {
		return "member/join";
	}

	   @PostMapping("/join")
	   public String joinEnd(Model m, @ModelAttribute("Member") MemberVO member) {
	      log.info("join === Member: " + member);
	      if (member.getEmail() == null || member.getPwd() == null || member.getMname() == null
	            || member.getEmail().trim().isEmpty() || member.getPwd().trim().isEmpty()
	            || member.getMname().trim().isEmpty()) {

	         return "redirect:join";
	      }

	      int n = memberService.createMember(member);
	      String str = (n > 0) ? "회원가입 완료" : "가입 실패";
	      String loc = (n > 0) ? "/seedmall" : "javascript:history.back()";

	      m.addAttribute("message", str);
	      m.addAttribute("loc", loc);
	      return "msg";
	   }

	@PostMapping("/login")
	public String loginProcess(HttpSession session, @ModelAttribute("member") MemberVO member) throws NotUserException {
		log.info("member===" + member);
		if (member.getEmail().trim().isEmpty() || member.getPwd().trim().isEmpty()) {
			return "redirect:index";
		}
		MemberVO loginUser = memberService.loginCheck(member.getEmail(), member.getPwd());
		if (loginUser != null) {
			// 로그인 인증을 받았다면
			session.setAttribute("loginUser", loginUser);
		}
		return "redirect:/";
	}// ------------------------------

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}

