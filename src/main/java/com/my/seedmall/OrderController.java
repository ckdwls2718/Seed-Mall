package com.my.seedmall;

import java.util.ArrayList;
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
	public String order(Model m, @RequestParam("pidx") int pidxs[],@RequestParam("oqty") int oqtys[], HttpSession session,
			@ModelAttribute OrderProductVO opvo) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "redirect:index";
		}
		
		int total = 0, totalPayment = 0;
		List<ProductVO> orderArr = new ArrayList<>();
		if (pidxs != null) {
			for (int i = 0; i < pidxs.length; i++) {
				// 받아온 상품번호를 차례대로 임시변수에 저장해서 List에 추가할 것
				int pidx = pidxs[i];
				
				// 상품번호로 해당 상품 정보 가져오기
				ProductVO pvo = productService.selectByIdx(pidx);
				
				// ProductVO에서 재고수량으로 사용되던 pqty를 사용자가 선택한 수량(oqty)으로 덮어쓴다 -> 상품 정보를 세션으로 넘겨야하기 때문
				pvo.setPqty(oqtys[i]);
				orderArr.add(pvo); // List에 추가
				
				// 주문VO 셋팅
				opvo.setPidx(pidx);
				opvo.setOqty(oqtys[i]);
				opvo.setOsalePrice(pvo.getPsaleprice());

				// 주문상품 총액(등급할인 전)
				total += (pvo.getPsaleprice() * opvo.getOqty());

				// 총 주문금액(등급할인 후)
				totalPayment += orderService.totalPayment();
			}
		}
		total += 4000; // 배송비
		
		// List를 세션에 저장해둔다
		session.setAttribute("orderArr", orderArr);
		
		m.addAttribute("loginUser", loginUser);
		m.addAttribute("oqty", opvo.getOqty());
		m.addAttribute("total", total);
		m.addAttribute("totalPayment", totalPayment);
		m.addAttribute("orderArr", orderArr);
		m.addAttribute("opvo", opvo);

		return "order/orderDetail";
	}

	// 결제완료 페이지 - 주문 명세서 생성
	@PostMapping("/orderAdd")
	public String orderAdd(Model m, @ModelAttribute("ovo") OrderVO ovo, HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		int midx_fk = loginUser.getMidx();

		// 세션에 로그인한 사람 정보로 회원번호 셋팅
		ovo.setMidx(midx_fk);

		// 주문 명세서 + 수령자 DB에 생성
		int n = orderService.createOrderList(ovo);
		int n2 = orderMapper.createOrderMember(ovo); // Mapper에서는 명세서와 수령자를 따로 insert해줬다

		// 세션에서 아까 저장해둔 List를 가져온다
		List<ProductVO> orderProdArr = (List<ProductVO>) session.getAttribute("orderArr");
		
		// 주문개요 DB에 생성
		if (orderProdArr != null) {
			for (ProductVO pd : orderProdArr) {
				// 주문 상품정보에 해당 주문개요번호를 넣는다
				OrderProductVO opvo = orderService.getOrderProduct(pd.getPidx());
				
				// 그리고 OrderProductVO에 값을 넣어준다
				opvo.setDesc_oidx(ovo.getDesc_oidx()); 
				opvo.setOqty(pd.getPqty());
				opvo.setOsalePrice(pd.getPsaleprice());
				opvo.setOpoint(pd.getPpoint());
				
				int n3 = orderMapper.createOrderProductList(opvo);
			}
		}
		
		// 총 주문정보 가져오기(명세서, 수령자 + 주문개요)
		OrderVO orderDesc = orderService.getOrderDesc(ovo.getDesc_oidx());
		List<OrderProductVO> orderProductArr = orderService.getOrderProductList(ovo.getDesc_oidx());

		m.addAttribute("orderDesc", orderDesc);
		m.addAttribute("orderProductArr", orderProductArr);

		// 주문개요 번호도 세션에 저장한다
		session.setAttribute("desc_oidx", ovo.getDesc_oidx());

		return "redirect:orderResult"; // 새로고침 시 또 주문이 들어가기때문에 redirect처리 해줘야 함
	}

	@GetMapping("/orderResult")
	public String orderAddResult(Model m, HttpSession session) {
		// 세션에 저장해둔 주문개요 번호를 가져온다
		Integer desc_oidx = (Integer) session.getAttribute("desc_oidx");
		
		// 총 주문정보 가져오기(명세서, 수령자, 주문개요)
		OrderVO orderDesc = orderService.getOrderDesc(desc_oidx);
		OrderVO orderMember = orderService.getOrderMember(desc_oidx);
		List<OrderProductVO> orderProductArr = orderService.getOrderProductList(desc_oidx);

		m.addAttribute("orderDesc", orderDesc);
		m.addAttribute("orderProductArr", orderProductArr);
		m.addAttribute("orderMember", orderMember);

		return "order/orderEnd";
	}

}
