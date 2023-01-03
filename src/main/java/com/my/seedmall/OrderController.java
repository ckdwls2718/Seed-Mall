package com.my.seedmall;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.product.model.ProductVO;
import com.product.service.ProductService;

@Controller
public class OrderController {

	@Autowired
	ProductService productService;

	// 임시
	@GetMapping("/order")
	public String orderDetail() {
		return "order/orderDetail";
	}
	
	// 상품 상세페이지 단일주문
	@GetMapping("/order/{pidx}")
	public String order(Model m, @PathVariable("pidx") int pidx) {
		// 주문하기 버튼을 누르면 해당 상품번호로 상품정보를 출력해준다.
		ProductVO prod = productService.selectByIdx(pidx);
		m.addAttribute("prod", prod);

		return "order/orderDetail";
	}

	
	// 상품 상세페이지 단일주문 결제완료
	@PostMapping("/payment")
	public String payment() {
		// 결제하기 버튼을 누르면 완료 페이지를 띄운다.
		
		/* 예외처리
		 * log.info("join === Member: " + member); if (member.getEmail() == null ||
		 * member.getPwd() == null || member.getMname() == null ||
		 * member.getEmail().trim().isEmpty() || member.getPwd().trim().isEmpty() ||
		 * member.getMname().trim().isEmpty()) {
		 * 
		 * return "redirect:join"; }
		 * 
		 * int n = memberService.createMember(member); String str = (n > 0) ? "회원가입 완료"
		 * : "가입 실패"; String loc = (n > 0) ? "/seedmall" : "javascript:history.back()";
		 * 
		 * m.addAttribute("message", str); m.addAttribute("loc", loc);
		 */
		
		return "order/payment";
	}

}
