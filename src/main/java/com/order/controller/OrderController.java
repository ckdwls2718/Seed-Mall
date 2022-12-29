package com.order.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.order.mapper.OrderVO;
import com.order.service.OrderService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
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
