package com.my.seedmall;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.user.model.MemberVO;
import com.user.model.NotUserException;
import com.user.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class AuthController {
//회원가입
	@Resource(name = "MemberService")
	private MemberService memberService;
	
	@GetMapping("/login")
	public String loginForm() {
		return "member/login";
	}

	@GetMapping("/join")
	public String joinForm() {
		return "member/join";
	}
	
	@GetMapping("/check")
	public String test() {
		return "member/check";
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

	@GetMapping(value = "/emailCheck", produces = "application/json")
	@ResponseBody
	public Map<String, String> emailCheck(@RequestParam("email") String email) {
		log.info("userid===" + email);
		boolean isUse = memberService.emailCheck(email);
		String result = (isUse) ? "ok" : "no";

		Map<String, String> map = new HashMap<>();
		map.put("result", result);
		return map;
	}

	@GetMapping("/findemail")
	public String findEmailView() {
		return "member/findemail";
	}

	// 아이디 찾기 실행
	@RequestMapping(value = "find_email", method = RequestMethod.POST)
	public String findEmailAction(MemberVO vo, Model model) {
		MemberVO user = memberService.findemail(vo);
		//log.info(vo);

		if (user != null) {
			model.addAttribute("check", 1);
			model.addAttribute("email", user.getEmail());
		} else {
			model.addAttribute("check", 0);
		}
		log.info(vo);
		return "member/findemail";
	}

	// 비밀번호 찾기 페이지로 이동
	@GetMapping("/findPassword")
	public String findPasswordView() {
		return "member/findPassword";
	}

	// 비밀번호 찾기 실행
	@RequestMapping(value = "find_Password", method = RequestMethod.POST)
	public String findPasswordAction(MemberVO vo, Model model) {
		MemberVO user = memberService.findPassword(vo);
		//log.info(vo);
		if (user != null) {
			model.addAttribute("check", 1);
			model.addAttribute("pwd", user.getPwd());
		} else {
			model.addAttribute("check", 0);

		}
		log.info(vo);

		return "member/findPassword";
	}

	// 비밀번호 바꾸기 실행
	@RequestMapping(value = "update_password", method = RequestMethod.POST)
	public String updatePasswordAction(
			@RequestParam(value = "updateid", defaultValue = "", required = false) String email, MemberVO vo) {
		vo.setEmail(email);
		System.out.println(vo);
		memberService.updatePassword(vo);
		return "member/findPasswordConfirm";
	}

	// 비밀번호 바꾸기할 경우 성공 페이지 이동
	@RequestMapping(value = "check_password_view")
	public String checkPasswordForModify(HttpSession session, Model model) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "member/login";
		} else {
			return "mypage/checkformodify";
		}
	}

////로그인
	@PostMapping("/login")
	public String loginProcess(HttpSession session, @ModelAttribute("member") MemberVO member) throws NotUserException {
		log.info("member===" + member);
		if (member.getEmail().trim().isEmpty() || member.getPwd().trim().isEmpty()) {
			return "redirect:/login";
		}
		MemberVO loginUser = memberService.loginCheck(member.getEmail(), member.getPwd());
		if (loginUser != null) {
			// 로그인 인증을 받았다면
			session.setAttribute("loginUser", loginUser);
		}
		return "redirect:/";
	}// ------------------------------

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		log.info("get logout");

		memberService.logout(session);

		return "redirect:/";
	}
	
	@GetMapping("/user/mypage/quit")
	public String memberQuit() {
		return "member/quit";
	}
	
	@PostMapping(value="/user/mypage/quit",produces = "application/json")
	@ResponseBody
	public int memberQuitEnd(HttpSession ses,@RequestParam("midx") int midx) {
		MemberVO quitMember = new MemberVO();
		quitMember.setStatus(2);
		quitMember.setMidx(midx);
		
		int n = memberService.updateMember(quitMember);
		if(n>0) ses.invalidate();
		return n;
	}

	// 예외처리하는 메서드앞에 @ExceptionHandler를 붙이고 구체적인 예외 클래스를 지정한다
	@ExceptionHandler(NotUserException.class)
	public String exceptionHandler(Exception ex) {
		log.error(ex);
		return "member/errorAlert";
	}
}
