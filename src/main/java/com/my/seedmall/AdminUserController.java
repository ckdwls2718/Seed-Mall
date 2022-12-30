package com.my.seedmall;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.user.model.MemberVO;
import com.user.model.PagingVO;
import com.user.service.MemberService;

import lombok.extern.log4j.Log4j;

@RequestMapping("/admin")
@Controller
@Log4j
public class AdminUserController {
	
	@Resource(name = "MemberService" )
	private MemberService MemberService;
	
	@GetMapping("/memberList")
	public String userlist(Model m, @ModelAttribute("page") PagingVO page, HttpServletRequest req,
			@RequestHeader('user-Agent')String userAgent) {
		List<MemberVO> userArr=this.MemberService.listUser(null);
		log.info(userArr);
		m.addAttribute("userArr", userArr);
		
		return "/member/list";
	}
	
	@PostMapping("/userDel")
	public String deleteMember(@RequestParam(defaultValue = "0") int midx) {
		if(midx==0) {
			return "redirect:memberList";
		}
		int n=MemberService.deleteMember(midx);
		
		return "redirect:memberList";
	}
	MemberVO mvo=new MemberVO();
	
//	작업중-----------------
	
	@PostMapping("/userEdit")
	public String updateUser(@ModelAttribute("mvo")MemberVO mvo) {
		log.info("mvo=="+mvo);
		
		int n=MemberService.updateMember(mvo);
		log.info("updateUser: n="+n);
		
		return "redirect:memberList";
	}//----------
//-----------------------
}//

