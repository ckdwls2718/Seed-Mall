package com.my.seedmall;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myplant.model.MyPlantVO;
import com.myplant.service.MyPlantService;
import com.order.mapper.OrderMapper;
import com.order.model.OrderProductVO;
import com.order.model.OrderVO;
import com.order.service.OrderService;
import com.product.model.CartVO;
import com.product.model.ProductVO;
import com.product.service.CartService;
import com.product.service.ProductService;
import com.user.model.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user")
@Log4j
public class CartController {

	@Autowired
	CartService cartService;

	@Autowired
	ProductService prodService;

	@Autowired
	OrderService orderService;

	@Autowired
	OrderMapper orderMapper;
	
	@Autowired
	MyPlantService mpService;

	@GetMapping("/cart")
	public String cartList(Model m, HttpServletRequest req) {
		HttpSession ses = req.getSession();
		MemberVO loginUser = (MemberVO) ses.getAttribute("loginUser");

		List<CartVO> cartArr = cartService.selectMyCartList(loginUser.getMidx());
		int cartTotalPrice = 0;

		for (CartVO cart : cartArr) {
			ProductVO prod = prodService.selectByIdx(cart.getPidx());
			cart.setProduct(prod);

			int prodTotalPrice = prod.getPsaleprice() * cart.getPqty();
			cartTotalPrice += prodTotalPrice;

			cart.setCtotalprice(prodTotalPrice);
		}
		m.addAttribute("cartArr", cartArr);
		m.addAttribute("cartTotalPrice", cartTotalPrice);

		return "cart/cartList";
	}

	@PostMapping("/cart")
	public String insertCart(Model m, HttpServletRequest req, @ModelAttribute CartVO cart) {

		HttpSession ses = req.getSession();
		MemberVO loginUser = (MemberVO) ses.getAttribute("loginUser");
		if (loginUser == null) {
			m.addAttribute("loc", "javascript:history.back()");
			m.addAttribute("message", "로그인 후 이용해 주세요");
			return "msg";
		}
		int midx = loginUser.getMidx();

		cart.setMidx(midx);

		int result = cartService.insertCart(cart);

		log.info("cart = " + cart);

		String msg = (result > 0) ? "장바구니에 등록되었습니다" : "장바구니 등록에 실패하였습니다";

		m.addAttribute("loc", "javascript:history.back()");// 새로고침
		m.addAttribute("message", msg);
		return "msg";
	}

	@PostMapping(value = "/cartDel", produces = "application/json")
	@ResponseBody
	public ModelMap deleteCart(CartVO cart) {

		log.info("cart = " + cart);
		ModelMap map = new ModelMap();
		int result = cartService.deleteCart(cart.getCart_idx());

		map.put("result", result);

		return map;
	}

	@PostMapping(value = "/cartEdit", produces = "application/json")
	@ResponseBody
	public ModelMap updateCart(CartVO cart) {

		log.info("cart = " + cart);
		ModelMap map = new ModelMap();
		int result = cartService.updateCart(cart);

		map.put("result", result);

		return map;
	}

	// 결제 전, 결제정보 출력
	@PostMapping("/cartOrder")
	public String order(Model m, @RequestParam("cidx") int[] cidxs, @RequestParam(value="growCheck", defaultValue="N") String growCheck, HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "redirect:index";
		}
		
		log.info("growCheck = "+growCheck);

		// 장바구니 번호를 이용해 장바구니 정보 가져오기
		List<CartVO> cartArr = cartService.getCartListByCidx(cidxs);

		log.info("cartArr = " + cartArr);

		int total = 0, totalPayment = 0;

		for (CartVO cart : cartArr) {
			int pqty = cart.getPqty();
			int salePrice = cart.getProduct().getPsaleprice();

			int prodTotal = pqty * salePrice;

			cart.setCtotalprice(prodTotal);

			totalPayment += prodTotal;
		}

		total = totalPayment;

		total += 4000; // 배송비

		// List를 세션에 저장해둔다
		session.setAttribute("cartArr", cartArr);

		m.addAttribute("total", total);
		m.addAttribute("totalPayment", totalPayment);
		m.addAttribute("cartArr", cartArr);
		m.addAttribute("growCheck", growCheck);

		return "cart/cartOrderDetail";
	}

	// 결제완료 페이지 - 주문 명세서 생성
	@PostMapping("/cartOrderAdd")
	public String orderAdd(Model m, @ModelAttribute() OrderVO order, @RequestParam("growCheck")String growCheck, HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		int midx_fk = loginUser.getMidx();

		// 세션에 로그인한 사람 정보로 회원번호 셋팅
		order.setMidx(midx_fk);

		// 주문 명세서 + 수령자 DB에 생성
		orderService.createOrderList(order);
		orderMapper.createOrderMember(order); // Mapper에서는 명세서와 수령자를 따로 insert해줬다.

		// 세션에서 아까 저장해둔 List를 가져온다
		List<CartVO> cartArr = (List<CartVO>) session.getAttribute("cartArr");

		// 주문개요 DB에 생성
		if (cartArr != null) {
			for (CartVO cart : cartArr) {
				OrderProductVO orderProdVo = new OrderProductVO();
				// 주문 개요번호
				orderProdVo.setDesc_oidx(order.getDesc_oidx());

				// 상품번호
				orderProdVo.setPidx(cart.getProduct().getPidx());

				// 상품가격
				orderProdVo.setOsalePrice(cart.getProduct().getPsaleprice());

				// 상품포인트
				orderProdVo.setOpoint(cart.getProduct().getPpoint());

				// 상품갯수
				orderProdVo.setOqty(cart.getPqty());

				orderMapper.createOrderProductList(orderProdVo);

				// 식물관리에 저장할 부분
				if (growCheck.equals("Y")) {
					for (int i = 0; i < orderProdVo.getOqty(); i++) {
						MyPlantVO mpvo = new MyPlantVO();
						mpvo.setMidx(order.getMidx());
						mpvo.setOidx(orderProdVo.getOidx());
						mpvo.setNickname("애칭");
						mpvo.setPcomment("피드백");
						mpvo.setPercent(0);
						mpvo.setPlantImage("noImage");

						int n4 = mpService.insertMyPlant(mpvo);
					}
				}

				// 장바구니 목록 삭제
				cartService.deleteCart(cart.getCart_idx());
			}
		}

		// 총 주문정보 가져오기(명세서, 수령자 + 주문개요)
		OrderVO orderDesc = orderService.getOrderDesc(order.getDesc_oidx());
		List<OrderProductVO> orderProductArr = orderService.getOrderProductList(order.getDesc_oidx());

		m.addAttribute("orderDesc", orderDesc);
		m.addAttribute("orderProductArr", orderProductArr);

		// 주문개요 번호도 세션에 저장한다
		session.setAttribute("desc_oidx", order.getDesc_oidx());

		return "redirect:cartOrderResult"; // 새로고침 시 또 주문이 들어가기때문에 redirect처리 해줘야 함
	}

	@GetMapping("/cartOrderResult")
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

		return "cart/cartOrderEnd";
	}
}
