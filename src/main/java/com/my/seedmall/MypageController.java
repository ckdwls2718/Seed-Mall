package com.my.seedmall;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myplant.model.MyPlantVO;
import com.myplant.service.MyPlantService;
import com.order.model.OrderProductVO;
import com.order.model.OrderVO;
import com.order.service.OrderService;
import com.user.model.MemberVO;
import com.user.model.NotUserException;
import com.user.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/mypage")
public class MypageController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	MyPlantService mpService;
	
	@GetMapping()
	public String mypage() {
		return "member/mypage";
	}
	
	// 회원 정보 수정 폼
	@GetMapping("/infoForm")
	public String myinfoForm() {
		return "member/mypageEditForm";
	}
	
	@PostMapping("/updateInfo")
	public String updateMemberInfo(@ModelAttribute MemberVO member, HttpSession ses) {
		int result =memberService.updateMemberInfo(member);
		if(result>0) {
			MemberVO dbMember = memberService.getMember(member.getMidx());
			ses.setAttribute("loginUser", dbMember);
		}
		return "member/mypageEditForm";
	}
	
	//비밀번호 수정 폼
	
	@GetMapping("/editPassForm")
	public String editPasswordForm() {
		return "member/passEditForm";
	}
	
	@PostMapping("/updatePass")
	public String updatePassword(Model m,@ModelAttribute MemberVO updateMember, @RequestParam("password2") String newPwd, 
			HttpSession ses) throws NotUserException {
		
		log.info("updateMember ="+updateMember);
		log.info("newPwd ="+newPwd);
		
		//service 단으로 수정 될 로직
		
		MemberVO findMember = memberService.findUser(updateMember);
		if(!findMember.getPwd().equals(updateMember.getPwd())) {
			m.addAttribute("message", "비밀번호가 일치하지 않습니다.");
			m.addAttribute("loc", "editPassForm");
			return "msg";
		}
		// 새 비밀번호를 set
		updateMember.setPwd(newPwd);
		
		// 비밀번호 수정
		memberService.updatePassword(updateMember);
		
		MemberVO loginUser = memberService.findUser(updateMember);
		
		ses.setAttribute("loginUser", loginUser);
		
		return "redirect:/user/mypage"; 
	}
	
	
	
	//주문 내역
	@GetMapping("/orderList")
	public String myOrderList(Model m, HttpSession ses) {
		MemberVO loginUser = (MemberVO)ses.getAttribute("loginUser");
		List<OrderVO> orderArr = orderService.getOrderList(loginUser.getMidx());
		
		m.addAttribute("orderArr", orderArr);
		
		return "member/orderList";
	}
	
	@PostMapping("/order")
	public String getOrderDetail(Model m, HttpSession ses, @RequestParam("oidx") int oidx ) {
		
		log.info("oidx = "+oidx);
		OrderVO order = orderService.getOrderDesc(oidx);
		OrderVO orderMember = orderService.getOrderMember(oidx);
		
		//일단 가격이 안바뀐다는 가정하에 진행
		List<OrderProductVO> orderProduct = orderService.getOrderProductList(oidx);
		
		m.addAttribute("order", order);
		m.addAttribute("orderMember", orderMember);
		m.addAttribute("orderProduct", orderProduct);
		
		return "member/orderDetail";
	}
	
	@PostMapping(value="/orderEnd", produces = "application/json")
	@ResponseBody
	public int orderConfirmed(int oidx) {
		log.info("oidx = "+oidx);
		int result = orderService.orderConfirmed(oidx);
		
		return result;
	}
	
	
	//식물 내역
	@GetMapping("/plantList")
	public String myPlantList(Model m, HttpSession ses) {
		
		MemberVO loginUser = (MemberVO)ses.getAttribute("loginUser");
		
		List<MyPlantVO> plantArr = mpService.getMyPlantList(loginUser.getMidx());
		
		m.addAttribute("plantArr", plantArr);
		
		return "member/plantList";
	}
	
	@PostMapping("/plant")
	public String getPlantDetail(Model m, HttpSession ses, @RequestParam("pidx") int pidx) {
		
		log.info("pidx = "+pidx);
		MyPlantVO plant = mpService.getMyPlantDetail(pidx);
		
		m.addAttribute("plant", plant);
		
		return "member/plantDetail";
	}
	@PostMapping("updateNick")
	@ResponseBody
	public int updateNickname(MyPlantVO plant) {
		
		log.info("plant="+plant);
		int result = mpService.updateMyPlantNickname(plant);
		
		return result;
	}
	
}
