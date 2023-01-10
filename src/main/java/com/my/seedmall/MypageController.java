package com.my.seedmall;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myplant.model.MyPlantVO;
import com.myplant.service.MyPlantService;
import com.order.model.OrderProductVO;
import com.order.model.OrderVO;
import com.order.service.OrderService;
import com.user.model.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/mypage")
public class MypageController {
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	MyPlantService mpService;
	
	@GetMapping()
	public String mypage() {
		return "member/mypage";
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
}
