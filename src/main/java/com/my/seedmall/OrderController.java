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

import com.order.mapper.OrderMapper;
import com.order.model.OrderProductVO;
import com.order.model.OrderVO;
import com.order.service.OrderService;
import com.product.model.ProductVO;
import com.product.service.ProductService;
import com.user.model.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user")
@Log4j
public class OrderController {

	@Autowired
	private OrderService orderService;

	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private ProductService productService;

	// 결제 전, 결제정보 출력
	@PostMapping("/order")
	public String order(Model m, @RequestParam("pidx") int pidx, @ModelAttribute OrderProductVO opvo) {
		// 상품번호를 매개변수로 받아서 상품정보를 가져온다.
		ProductVO pvo = productService.selectByIdx(pidx);
		
		// 주문상품 총액을 가져온다.(등급할인 전)
		int total = (pvo.getPsaleprice() * opvo.getOqty()) + 4000;
		
		// 총 주문금액(등급할인 후)
		int totalPayment = orderService.totalPayment();

		m.addAttribute("pvo", pvo);
		m.addAttribute("oqty", opvo.getOqty());
		m.addAttribute("total", total);
		m.addAttribute("totalPayment", totalPayment);

		return "order/orderDetail";
	}

	// 결제완료 페이지 - 주문 명세서 생성
	@PostMapping("/orderAdd")
	public String orderAdd(Model m, HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		int midx_fk = loginUser.getMidx();

		OrderVO ovo = new OrderVO();

		// 세션에서 로그인한 사람의 회원번호를 꺼내서 OrderVO에 셋팅
		ovo.setMidx(midx_fk);

		// 주문 명세서 생성
		int n = orderService.createOrderList(ovo);

		// 주문 명세서 가져오기
		List<OrderVO> orderArr = orderService.getOrderList(ovo.getMidx());

		m.addAttribute("orderArr", orderArr);

		return "redirect:orderEnd";
	}

	// 명세서 출력 페이지
	@GetMapping("/orderEnd")
	public String orderList() {
		// 예외처리

		return "order/orderEnd";
	}

}
