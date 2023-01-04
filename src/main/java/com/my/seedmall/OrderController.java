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
	public String order(Model m, @RequestParam("pidx") int pidx, HttpSession session,
			@ModelAttribute OrderProductVO opvo) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		int midx_fk = loginUser.getMidx();

		// 상품번호로 해당 상품 정보 가져오기
		ProductVO pvo = productService.selectByIdx(pidx);

		// 주문상품 총액을 가져온다.(등급할인 전)
		int total = (pvo.getPsaleprice() * opvo.getOqty()) + 4000;

		// 총 주문금액(등급할인 후)
		int totalPayment = orderService.totalPayment();

		m.addAttribute("oqty", opvo.getOqty());
		m.addAttribute("total", total);
		m.addAttribute("totalPayment", totalPayment);
		m.addAttribute("pvo", pvo);

		return "order/orderDetail";
	}

	// 결제완료 페이지 - 주문 명세서 생성
	@PostMapping("/orderAdd")
	public String orderAdd(Model m, HttpSession session, @RequestParam("pidx") int pidx) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		int midx_fk = loginUser.getMidx();

		// 세션에 로그인한 사람 정보로 회원번호, 상품번호 셋팅
		ProductVO pvo = productService.selectByIdx(pidx);
		OrderVO ovo = new OrderVO();
		ovo.setMidx(midx_fk);
		ovo.setPidx(pidx);
		
		// 주문 명세서 + 수령자 DB에 생성 
		int n = orderService.createOrderList(ovo);
		int n2 = orderMapper.createOrderMember(ovo); // Mapper에서는 명세서와 수령자를 따로 insert해줬다.

		// 주문개요 DB에 생성
		OrderProductVO opvo = new OrderProductVO();
		opvo.setDesc_oidx(ovo.getDesc_oidx()); // 주문명세서의 주문개요번호로 부터 가져와서 주문개요번호를 넣는다.
		opvo.setPidx(pidx);
		opvo.setOsalePrice(pvo.getPsaleprice());
		
		int n3 = orderMapper.createOrderProductList(ovo.getDesc_oidx());
		
		// 총 주문정보 가져오기(명세서, 수령자 + 주문개요)
		List<OrderVO> orderArr = orderService.getOrderList(ovo.getDesc_oidx());
		List<OrderProductVO> orderProductArr = orderService.getOrderProductList(ovo.getDesc_oidx());

		m.addAttribute("orderArr", orderArr);
		m.addAttribute("orderProductArr", orderProductArr);

		return "order/orderEnd";
	}

}
