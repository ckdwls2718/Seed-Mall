package com.my.seedmall;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OrderController {

//	@Resource(name = "orderService")
//	private OrderService orderService;
	
	@GetMapping("/order")
	public String order() {
		return "order/orderDetail";
	}

//	@PostMapping("/order")
//	public String orderEnd(Model m, @ModelAttribute("order") OrderVO order) {
//		log.info("주문 정보 : " + order);
//		
//		return "index";
//	}
}
