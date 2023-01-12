package com.my.seedmall;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.model.QNADTO;
import com.board.service.QNAService;
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
	
	@Autowired
	QNAService qnaService;
	
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
	
	//식물 상세보기
	@PostMapping("/plant")
	public String getPlantDetail(Model m, HttpSession ses, @RequestParam("pidx") int pidx) {
		
		log.info("pidx = "+pidx);
		MyPlantVO plant = mpService.getMyPlantDetail(pidx);
		
		m.addAttribute("plant", plant);
		
		return "member/plantDetail";
	}
	
	//식물 애칭 변경
	@PostMapping("updateNick")
	@ResponseBody
	public int updateNickname(MyPlantVO plant) {
		
		log.info("plant="+plant);
		int result = mpService.updateMyPlantNickname(plant);
		
		return result;
	}
	
	//QNA 리스트
	@GetMapping("QNA")
	public String getQnAList(Model m, HttpSession ses) {
		MemberVO loginUser = (MemberVO)ses.getAttribute("loginUser");
		
		List<QNADTO> qArr = qnaService.getMyQNAList(loginUser.getMidx());
		
		m.addAttribute("qArr", qArr);
		
		return "member/QNAList";
		
	}
		
}
